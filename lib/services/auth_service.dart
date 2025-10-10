import 'package:firebase_auth/firebase_auth.dart';
import 'local_db_service.dart';
import '../models/local_user.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthService {
  final FirebaseAuth? _auth;
  final LocalDbService localDb;
  final bool isOfflineMode;

  AuthService(this.localDb, {this.isOfflineMode = false})
      : _auth = isOfflineMode ? null : FirebaseAuth.instance;

  /// ✅ Stream 100% offline-first CORRIGÉ
  Stream<Object?> get authStateChanges async* {
    final wasLoggedIn = localDb.getIsLoggedIn();
    
    // Mode offline ou Firebase non initialisé
    if (isOfflineMode || _auth == null) {
      if (wasLoggedIn) {
        yield LocalUser(uid: 'offline', email: 'offline@bangfeed.com');
      } else {
        yield null;
      }
      return; // Important: arrêter le stream ici
    }

    // Vérifier la connexion
    final hasConnection = await InternetConnectionChecker().hasConnection;
    
    if (!hasConnection && wasLoggedIn) {
      // Mode offline avec connexion précédente
      yield LocalUser(uid: 'offline', email: 'offline@bangfeed.com');
      return;
    }

    // Mode online: utiliser Firebase
    yield* _auth.authStateChanges();
  }

  Future<void> signUp(String email, String password) async {
    if (_auth == null) {
      throw Exception('Mode hors ligne: inscription impossible');
    }
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await localDb.setIsLoggedIn(true);
  }

  Future<void> signIn(String email, String password) async {
    if (_auth == null) {
      throw Exception('Mode hors ligne: connexion impossible');
    }
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    await localDb.setIsLoggedIn(true);
  }

  Future<void> signOut() async {
    if (_auth != null) {
      await _auth.signOut();
    }
    await localDb.setIsLoggedIn(false);
  }

  // Méthode pour se connecter en mode offline
  Future<void> signInOffline() async {
    await localDb.setIsLoggedIn(true);
  }
}
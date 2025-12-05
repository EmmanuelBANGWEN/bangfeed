import 'package:bangfeed/services/firestore_service.dart';
import 'package:bangfeed/utils/phone_to_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'local_db_service.dart';
import '../models/local_user.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthService {
  final FirebaseAuth? _auth;
  final LocalDbService localDb;
  final bool isOfflineMode;

  AuthService(this.localDb, {this.isOfflineMode = false})
      : _auth = isOfflineMode ? null : FirebaseAuth.instance;











Stream<LocalUser?> get authStateChanges async* {
  if (isOfflineMode || _auth == null) {
    final wasLoggedIn = localDb.getIsLoggedIn();
    if (wasLoggedIn) {
      yield LocalUser(uid: 'offline', email: 'offline@bangfeed.com');
    } else {
      yield null;
    }
    return;
  }

  await for (final user in _auth.authStateChanges()) {
    if (user != null) {
      await localDb.setIsLoggedIn(true);

      // 🔹 Récupérer isPremium depuis Firestore
      final userData = await FirestoreService().getUserData(user.uid);
      final isPremium = userData?['isPremium'] == true;

      yield LocalUser(uid: user.uid, email: user.email ?? '', isPremium: isPremium);
    } else {
      await localDb.setIsLoggedIn(false);
      yield null;
    }
  }
}























Future<void> signUpWithPhone(String phone, String password) async {
  if (_auth == null) throw Exception('Mode hors ligne: inscription impossible');

  final email = phoneToPseudoEmail(phone);
  print('🔵 [SIGNUP] Téléphone saisi: $phone');
  print('🔵 [SIGNUP] Email généré: $email');
  
  final userCred = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  await userCred.user?.updateDisplayName(phone);
  await localDb.setIsLoggedIn(true);
}

Future<void> signInWithPhone(String phone, String password) async {
  if (_auth == null) throw Exception('Mode hors ligne: connexion impossible');

  final email = phoneToPseudoEmail(phone);
  print('🟢 [SIGNIN] Téléphone saisi: $phone');
  print('🟢 [SIGNIN] Email généré: $email');
  
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




































// Future<bool> checkPremium() async {
//   final uid = FirebaseAuth.instance.currentUser!.uid;

//   final data = await FirestoreService().getUserData(uid);
//   if (data == null) return false;

//   // Si pas premium, retourne false
//   if (!(data['isPremium'] ?? false)) return false;

//   // Vérifie la date d'expiration
//   final premiumUntilStr = data['premiumUntil'];
//   if (premiumUntilStr == null) return false;

//   final premiumUntil = DateTime.parse(premiumUntilStr);

//   return DateTime.now().isBefore(premiumUntil);
// }



// Future<bool> checkPremium() async {
//   final uid = FirebaseAuth.instance.currentUser!.uid;

//   final data = await FirestoreService().getUserData(uid);

//   if (data == null) return false;

//   final bool isPremium = data['isPremium'] ?? false;
//   final Timestamp? premiumUntil = data['premiumUntil'];

//   if (isPremium && premiumUntil != null) {
//     final now = DateTime.now();

//     // Premium expiré
//     if (premiumUntil.toDate().isBefore(now)) {
//       // On remet premium = false
//       await FirestoreService().updateUser(uid, {
//         'isPremium': false,
//       });
//       return false;
//     }
//   }

//   return isPremium;
// }




}
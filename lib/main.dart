import 'package:bangfeed/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'services/auth_service.dart';
import 'services/local_db_service.dart';
import 'services/firestore_service.dart';

import 'providers/formulation_provider.dart';
import 'providers/ingredient_provider.dart';

import 'screens/login_page.dart';
import 'screens/dashboard_page.dart';
import 'models/ingredient.dart';
import 'models/formulation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('🚀 Flutter binding initialisé');

  // Initialiser Hive TOUJOURS en premier
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(IngredientAdapter());
  if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(FormulationAdapter());
  await Hive.openBox<Ingredient>('ingredients');
  await Hive.openBox<Formulation>('formulations');
  print('✅ Hive initialisé et boxes ouvertes');

  // Vérifier connexion Internet AVANT Firebase
  // final hasInternet = false; // ← Mode offline forcé pour test
  final hasInternet = await InternetConnectionChecker().hasConnection;
  print(hasInternet ? '✅ Internet disponible' : '⚠️ Pas de connexion Internet - Mode offline activé');

  bool isOfflineMode = !hasInternet;

  // Initialiser Firebase SEULEMENT si en ligne
  if (hasInternet) {
    try {
      await Firebase.initializeApp();
      final firestoreInstance = FirebaseFirestore.instance;
      firestoreInstance.settings = const Settings(persistenceEnabled: true);
      
      // Initialiser les notifications seulement si online
      await NotificationService.initialize();
      print('✅ Firebase et notifications initialisés');
    } catch (e) {
      print('⚠️ Erreur Firebase: $e - Basculement en mode offline');
      isOfflineMode = true;
    }
  } else {
    print('⏳ Firebase ignoré - mode hors ligne activé');
  }

  // Services
  final localDb = LocalDbService();
  await localDb.init();
  print('✅ LocalDbService initialisé');
  
  // ✅ CORRECTION: N'initialiser FirestoreService que si en ligne
  FirestoreService? firestoreService;
  if (!isOfflineMode) {
    try {
      firestoreService = FirestoreService();
      print('✅ FirestoreService initialisé');
    } catch (e) {
      print('⚠️ Erreur FirestoreService: $e - Mode offline forcé');
      firestoreService = null;
      isOfflineMode = true;
    }
  } else {
    firestoreService = null;
    print('📴 FirestoreService désactivé (mode offline)');
  }

  // Lancement de l'app
  runApp(
    MultiProvider(
      providers: [
        Provider<LocalDbService>.value(value: localDb),
        // ✅ CORRECTION: Provider nullable pour FirestoreService
        Provider<FirestoreService?>.value(value: firestoreService),
        Provider<bool>.value(value: isOfflineMode),
        ChangeNotifierProvider(
          create: (_) => FormulationProvider(localDb, firestoreService),
        ),
        ChangeNotifierProvider(
          create: (_) => IngredientProvider(localDb),
        ),
      ],
      child: MyApp(isOfflineMode: isOfflineMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isOfflineMode;
  
  const MyApp({super.key, required this.isOfflineMode});

  @override
  Widget build(BuildContext context) {
    print('🏗️ [APP] Construction de MyApp (Mode: ${isOfflineMode ? "Offline" : "Online"})');
    return MaterialApp(
      title: 'BangFeed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: AuthWrapper(isOfflineMode: isOfflineMode),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final bool isOfflineMode;
  
  const AuthWrapper({super.key, required this.isOfflineMode});

  @override
  Widget build(BuildContext context) {
    final localDb = Provider.of<LocalDbService>(context, listen: false);
    final authService = AuthService(localDb, isOfflineMode: isOfflineMode);

    print('🔐 [AUTH] AuthWrapper build - Mode: ${isOfflineMode ? "Offline" : "Online"}');

    return StreamBuilder(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        print('📡 [AUTH] StreamBuilder state: ${snapshot.connectionState}, hasData: ${snapshot.hasData}, data: ${snapshot.data}');
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Chargement...'),
                ],
              ),
            ),
          );
        } 
        
        if (snapshot.hasError) {
          print('❌ [AUTH] Erreur: ${snapshot.error}');
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Erreur: ${snapshot.error}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Redémarrer l'app
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
          );
        }
        
        if (snapshot.hasData && snapshot.data != null) {
          print('✅ [AUTH] Utilisateur connecté');
          return const DashboardPage();
        }
        
        print('🔓 [AUTH] Pas d\'utilisateur - Affichage LoginPage');
        return const LoginPage();
      },
    );
  }
}
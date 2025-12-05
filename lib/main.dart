import 'package:bangfeed/screens/payer.dart';
import 'package:bangfeed/screens/payer_test.dart';
import 'package:bangfeed/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'services/auth_service.dart';
import 'services/local_db_service.dart';
import 'services/firestore_service.dart';
import 'providers/formulation_provider.dart';
import 'providers/ingredient_provider.dart';
import 'screens/login_page.dart';
import 'screens/home/dashboard_page.dart';
import 'models/ingredient.dart';
import 'models/formulation.dart';

void main() async {
  // ✅ Étape 1 : Initialisation minimale + Splash
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  print('🚀 Flutter binding initialisé et splash préservé');

  try {
    // ✅ Étape 2 : Initialiser Hive
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(IngredientAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(FormulationAdapter());
    await Hive.openBox<Ingredient>('ingredients');
    await Hive.openBox<Formulation>('formulations');
    print('✅ Hive initialisé et boxes ouvertes');

    // ✅ Étape 3 : Vérifier Internet
    final hasInternet = await InternetConnectionChecker().hasConnection;
    print(hasInternet ? '✅ Internet disponible' : '⚠️ Pas de connexion Internet');
    bool isOfflineMode = !hasInternet;

    // ✅ Étape 4 : Initialiser Firebase + Notifications
    if (hasInternet) {
      try {
        await Firebase.initializeApp();
        FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
        await NotificationService.initialize();
        print('✅ Firebase & Notifications initialisés');
      } catch (e) {
        print('⚠️ Erreur Firebase: $e - mode offline activé');
        isOfflineMode = true;
      }
    }

    // ✅ Étape 5 : Initialiser services
    final localDb = LocalDbService();
    await localDb.init();
    print('✅ LocalDbService initialisé');

    FirestoreService? firestoreService;
    if (!isOfflineMode) {
      try {
        firestoreService = FirestoreService();
        print('✅ FirestoreService initialisé');
      } catch (e) {
        print('⚠️ Erreur FirestoreService: $e - offline activé');
        firestoreService = null;
        isOfflineMode = true;
      }
    }

    // ✅ Étape 6 : Lancer l’application
    runApp(
      MultiProvider(
        providers: [
          Provider<LocalDbService>.value(value: localDb),
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

    // ✅ Étape 7 : Retirer le splash une fois tout prêt
    await Future.delayed(const Duration(milliseconds: 1000)); // petit délai visuel
    FlutterNativeSplash.remove();
    print('🧼 Splash retiré avec succès');
  } catch (e) {
    print('❌ Erreur d’initialisation: $e');
    FlutterNativeSplash.remove();
  }
}

class MyApp extends StatelessWidget {
  final bool isOfflineMode;
  const MyApp({super.key, required this.isOfflineMode});

  @override
  Widget build(BuildContext context) {
    print('🏗️ Construction MyApp (Mode: ${isOfflineMode ? "Offline" : "Online"})');
    return MaterialApp(
      title: 'BangFeed',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFD97706, {
          50: Color(0xFFFFF6E8),
          100: Color(0xFFFFEDD5),
          200: Color(0xFFFED7AA),
          300: Color(0xFFFDBA74),
          400: Color(0xFFFB923C),
          500: Color(0xFFD97706), // Ton orange principal
          600: Color(0xFFEA580C),
          700: Color(0xFFC2410C),
          800: Color(0xFF9A3412),
          900: Color(0xFF7C2D12),
        }),
        scaffoldBackgroundColor: Color(0xFFFFF6E8), // Crème
      ),
      home: AuthWrapper(isOfflineMode: isOfflineMode),
      
  routes: {
    // '/pay': (context) => const PayPage(),
    '/pay': (context) => const TestPaymentPage(),
  },

    );
  }
}

// class AuthWrapper extends StatelessWidget {
//   final bool isOfflineMode;
//   const AuthWrapper({super.key, required this.isOfflineMode});

//   @override
//   Widget build(BuildContext context) {
//     final localDb = Provider.of<LocalDbService>(context, listen: false);
//     final authService = AuthService(localDb, isOfflineMode: isOfflineMode);

//     return StreamBuilder(
//       stream: authService.authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text('Chargement...'),
//                 ],
//               ),
//             ),
//           );
//         }

//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.error_outline, size: 48, color: const Color(0xFFD97706)),
//                   SizedBox(height: 16),
//                   Text('Erreur: une erreur est survenue'),
//                 ],
//               ),
//             ),
//           );
//         }

//         if (snapshot.hasData && snapshot.data != null) {
//           return const DashboardPage();
//         }

//         return const LoginPage();
//       },
//     );
//   }
// }




class AuthWrapper extends StatelessWidget {
  final bool isOfflineMode;
  const AuthWrapper({super.key, required this.isOfflineMode});

  @override
  Widget build(BuildContext context) {
    final localDb = Provider.of<LocalDbService>(context, listen: false);
    final authService = AuthService(localDb, isOfflineMode: isOfflineMode);

    return StreamBuilder<Object?>(  // ✅ Ajoutez le type
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // ✅ Ajoutez des logs pour débugger
        print('🔄 [AuthWrapper] ConnectionState: ${snapshot.connectionState}');
        print('🔄 [AuthWrapper] HasData: ${snapshot.hasData}');
        print('🔄 [AuthWrapper] Data: ${snapshot.data}');

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
          print('❌ [AuthWrapper] Error: ${snapshot.error}');
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Erreur: ${snapshot.error}'),
                ],
              ),
            ),
          );
        }

        // ✅ Vérification plus stricte
        if (snapshot.hasData && snapshot.data != null) {
          print('✅ [AuthWrapper] User connecté, redirect vers Dashboard');
          return const DashboardPage();
        }

        print('❌ [AuthWrapper] Pas de user, redirect vers Login');
        return const LoginPage();
      },
    );
  }
}
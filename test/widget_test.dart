// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:bangfeed/models/formulation.dart';
// import 'package:bangfeed/models/ingredient.dart';
// import 'package:bangfeed/providers/formulation_provider.dart';
// import 'package:bangfeed/providers/ingredient_provider.dart';
// import 'package:bangfeed/services/firestore_service.dart';
// import 'package:bangfeed/services/local_db_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'package:bangfeed/main.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // 1️⃣ Initialiser Firebase
//   await Firebase.initializeApp();

//   // 2️⃣ Initialiser Hive
//   await Hive.initFlutter();
//   Hive.registerAdapter(IngredientAdapter());
//   Hive.registerAdapter(FormulationAdapter());

//   // 3️⃣ Initialiser LocalDbService
//   final localDb = LocalDbService();
//   await localDb.init();

//   // 4️⃣ Initialiser FirestoreService
//   final firestore = FirestoreService();

//   // ✅ Passer les services à MyApp
//   runApp(MyApp(localDb: localDb, firestore: firestore));
// }

// class MyApp extends StatelessWidget {
//   final LocalDbService localDb;
//   final FirestoreService firestore;

//   const MyApp({super.key, required this.localDb, required this.firestore});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (_) => FormulationProvider(localDb, firestore)),
//         ChangeNotifierProvider(create: (_) => IngredientProvider(localDb)),
//       ],
//       child: MaterialApp(
//         title: 'BangFeed',
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: AuthWrapper(),
//       ),
//     );
//   }
// }

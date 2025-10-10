// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import '../models/animal.dart';
// import '../services/local_db_service.dart';
// import '../services/firestore_service.dart';

// class AnimalProvider with ChangeNotifier {
//   final LocalDbService _localDb;
//   final FirestoreService _firestore;

//   List<Animal> _animals = [];
//   List<Animal> get animals => _animals;

//   AnimalProvider(this._localDb, this._firestore) {
//     _loadLocal();
//     _startAutoSync();
//   }

//   void _loadLocal() {
//     _animals = _localDb.getAllAnimals();
//     notifyListeners();
//   }

//   Future<void> addAnimal(Animal a) async {
//     await _localDb.saveAnimal(a);
//     _animals.add(a);
//     notifyListeners();
//     _trySync(a);
//   }

//   Future<void> deleteAnimal(Animal a) async {
//     await _localDb.deleteAnimal(a);
//     _animals.remove(a);
//     notifyListeners();
//   }

//   Future<void> _trySync(Animal a) async {
//     if (a.isSynced) return;
//     try {
//       await _firestore.syncAnimal(a);
//       a.isSynced = true;
//       await a.save();
//     } catch (e) {
//       print('Sync failed: $e');
//     }
//   }

//   void _startAutoSync() {
//     Connectivity().onConnectivityChanged.listen((result) {
//       if (result != ConnectivityResult.none) _syncPending();
//     });
//   }

//   Future<void> _syncPending() async {
//     for (var a in _animals.where((x) => !x.isSynced)) {
//       await _trySync(a);
//     }
//   }
// }

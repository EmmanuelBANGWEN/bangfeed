import 'package:bangfeed/models/ingredient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/formulation.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> syncFormulation(Formulation f) async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (!hasInternet) {
      print('⚠️ [FirestoreService] Pas de connexion — sync ignorée pour ${f.animalType}');
      return;
    }

    await _db
        .collection('users')
        .doc(f.userId)
        .collection('savedFormulations')
        .add({
      'animalType': f.animalType,
      'growthStage': f.growthStage,
      'ingredients': f.ingredients
          .map((i) => {
                'name': i.name,
                'protein': i.protein,
                'energy': i.energy,
                'price': i.price,
              })
          .toList(),
      'totalCost': f.totalCost,
      'date': f.date.toIso8601String(),
    });
  }

  Future<List<Formulation>> fetchFormulations(String userId) async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (!hasInternet) {
      print('⚠️ [FirestoreService] Mode offline — retour d\'une liste vide (Hive prendra le relais)');
      return [];
    }

    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('savedFormulations')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      final ingredients = (data['ingredients'] as List)
          .map((i) => Ingredient(
              name: i['name'],
              protein: (i['protein'] ?? 0).toDouble(),
              energy: (i['energy'] ?? 0).toDouble(),
              price: (i['price'] ?? 0).toDouble()))
          .toList();

      return Formulation(
        userId: userId,
        animalType: data['animalType'] ?? '',
        growthStage: data['growthStage'] ?? '',
        ingredients: ingredients,
        totalCost: (data['totalCost'] ?? 0).toDouble(),
        date: DateTime.parse(data['date'] ?? DateTime.now().toIso8601String()),
      );
    }).toList();
  }

  Future<void> deleteFormulation(Formulation f) async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (!hasInternet) {
      print('⚠️ [FirestoreService] Pas de connexion — suppression distante ignorée');
      return;
    }

    await _db
        .collection('formulations')
        .doc(f.userId)
        .collection('userFormulations')
        .doc(f.key.toString())
        .delete();
  }






  // Récupérer l'utilisateur
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.exists ? doc.data() : null;
  }

  // // Mettre à jour le statut premium
  // Future<void> setUserPremium(String uid) async {
  //   await _firestore.collection('users').doc(uid).set({
  //     'isPremium': true,
  //   }, SetOptions(merge: true)); // Merge = n'écrase pas les autres champs
  // }



Future<void> setUserPremium(String uid) async {
  final now = DateTime.now();
  final premiumUntil = now.add(Duration(days: 29));

  await _firestore.collection('users').doc(uid).set({
    'isPremium': true,
    'premiumUntil': premiumUntil.toIso8601String(),
  }, SetOptions(merge: true));
}





Future<void> updateUser(String uid, Map<String, dynamic> data) async {
  await _firestore.collection('users').doc(uid).set(
    data,
    SetOptions(merge: true),
  );
}





// Future<bool> checkPremium() async {
//   final uid = FirebaseAuth.instance.currentUser!.uid;

//   final data = await FirestoreService().getUserData(uid);
//   if (data == null) return false;

//   // Si pas premium dans Firestore → pas premium
//   if (!(data['isPremium'] ?? false)) return false;

//   // Récupérer la date d'expiration
//   dynamic premiumUntilRaw = data['premiumUntil'];
//   if (premiumUntilRaw == null) return false;

//   DateTime premiumUntil;

//   // Firestore stocke parfois un Timestamp, parfois une String
//   if (premiumUntilRaw is Timestamp) {
//     premiumUntil = premiumUntilRaw.toDate();
//   } else if (premiumUntilRaw is String) {
//     premiumUntil = DateTime.parse(premiumUntilRaw);
//   } else {
//     return false;
//   }

//   // Si premium toujours valide
//   if (DateTime.now().isBefore(premiumUntil)) {
//     return true;
//   }

//   // Sinon premium expiré → mise à jour Firestore
//   await FirestoreService().updateUser(uid, {
//     'isPremium': false,
//   });

//   return false;
// }












Future<bool> checkPremium() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final data = await getUserData(uid);
  if (data == null) return false;

  // Si pas premium dans Firestore → pas premium
  if (!(data['isPremium'] ?? false)) return false;

  // Récupérer la date d'expiration
  dynamic premiumUntilRaw = data['premiumUntil'];
  if (premiumUntilRaw == null) return false;

  DateTime premiumUntil;

  // Firestore stocke parfois un Timestamp, parfois une String
  if (premiumUntilRaw is Timestamp) {
    premiumUntil = premiumUntilRaw.toDate();
  } else if (premiumUntilRaw is String) {
    premiumUntil = DateTime.parse(premiumUntilRaw);
  } else {
    return false;
  }

  // Si premium toujours valide → OK
  if (DateTime.now().isBefore(premiumUntil)) {
    return true;
  }

  // ❗ Premium expiré → désactiver automatiquement
  await updateUser(uid, {
    'isPremium': false,
  });

  return false;
}





}

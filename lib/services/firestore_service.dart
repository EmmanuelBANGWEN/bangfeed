import 'package:bangfeed/models/ingredient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../models/formulation.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
}

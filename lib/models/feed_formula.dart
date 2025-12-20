

import 'package:hive/hive.dart';
import 'ingredient.dart';

part 'feed_formula.g.dart';

@HiveType(typeId: 2)
class FeedFormula extends HiveObject {
  @HiveField(0)
  String animal; // Ex: "Porc", "Pondeuse", "Poulet chair"

  @HiveField(1)
  String stage; // Ex: "Démarrage", "Finition", "Gestation"

  @HiveField(2)
  List<Ingredient> ingredients;

  @HiveField(3)
  double totalProtein;

  @HiveField(4)
  double totalEnergy;

  @HiveField(5)
  double totalCalcium;

  @HiveField(6)
  double totalPhosphore;

  // 🆕 Nouveaux totaux en fonction des nouveaux nutriments
  @HiveField(7)
  double totalLysine;

  @HiveField(8)
  double totalMethionine;

  @HiveField(9)
  double totalFiber;

  @HiveField(10)
  double totalFat;

  FeedFormula({
    required this.animal,
    required this.stage,
    required this.ingredients,
    required this.totalProtein,
    required this.totalEnergy,
    required this.totalCalcium,
    required this.totalPhosphore,
    required this.totalLysine,
    required this.totalMethionine,
    required this.totalFiber,
    required this.totalFat,
  });

  // 📌 Recalcul automatique des valeurs nutritives
  void recalcTotals() {
    totalProtein = 0;
    totalEnergy = 0;
    totalCalcium = 0;
    totalPhosphore = 0;
    totalLysine = 0;
    totalMethionine = 0;
    totalFiber = 0;
    totalFat = 0;

    for (var ing in ingredients) {
      final qty = ing.quantity ?? 0;

      totalProtein += qty * ing.protein;
      totalEnergy += qty * ing.energy;
      totalCalcium += qty * (ing.calcium ?? 0);
      totalPhosphore += qty * (ing.phosphore ?? 0);
      totalLysine += qty * (ing.lysine ?? 0);
      totalMethionine += qty * (ing.methionine ?? 0);
      totalFiber += qty * (ing.fiber ?? 0);
      totalFat += qty * (ing.fat ?? 0);
    }
  }

  // 🔥 Coût total de la formulation
  double get totalCost {
    double cost = 0;
    for (var ing in ingredients) {
      cost += (ing.quantity ?? 0) * ing.price;
    }
    return cost;
  }
}

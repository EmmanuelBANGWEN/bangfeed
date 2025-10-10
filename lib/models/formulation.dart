import 'package:hive/hive.dart';
import 'ingredient.dart';
part 'formulation.g.dart';

@HiveType(typeId: 1)
class Formulation extends HiveObject {
  @HiveField(0)
  String userId;
  @HiveField(1)
  String animalType;
  @HiveField(2)
  String growthStage;
  @HiveField(3)
  List<Ingredient> ingredients;
  @HiveField(4)
  double totalCost;
  @HiveField(5)
  DateTime date;

  @HiveField(6)
  bool isSynced;

  Formulation({
    required this.userId,
    required this.animalType,
    required this.growthStage,
    required this.ingredients,
    required this.totalCost,
    required this.date,

    this.isSynced = false, // nouveau champ

  });
}

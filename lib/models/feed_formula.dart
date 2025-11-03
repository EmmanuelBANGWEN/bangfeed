import 'package:hive/hive.dart';
import 'ingredient.dart';

part 'feed_formula.g.dart';

@HiveType(typeId: 2)
class FeedFormula extends HiveObject {
  @HiveField(0)
  String animal;

  @HiveField(1)
  String stage;

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

  FeedFormula({
    required this.animal,
    required this.stage,
    required this.ingredients,
    required this.totalProtein,
    required this.totalEnergy,
    required this.totalCalcium,
    required this.totalPhosphore,
  });
}

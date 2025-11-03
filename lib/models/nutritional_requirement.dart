import 'package:hive/hive.dart';
part 'nutritional_requirement.g.dart';

@HiveType(typeId: 3) // ⚠️ ATTENTION: Changer typeId si 1 est déjà utilisé par Formulation
class NutritionalRequirement extends HiveObject {
  @HiveField(0)
  String animal; // Ex: "Porc", "Poulet de chair"

  @HiveField(1)
  String stage; // Ex: "Croissance", "Démarrage"

  @HiveField(2)
  double protein; // Besoin en protéines brutes (%)

  @HiveField(3)
  double energy; // Besoin en énergie (kcal/kg)

  @HiveField(4)
  double calcium; // Besoin en calcium (%)

  @HiveField(5)
  double phosphore; // Besoin en phosphore (%)

  NutritionalRequirement({
    required this.animal,
    required this.stage,
    required this.protein,
    required this.energy,
    required this.calcium,
    required this.phosphore,
  });

  // ✅ Méthode toJson pour Firebase/export
  Map<String, dynamic> toJson() {
    return {
      'animal': animal,
      'stage': stage,
      'protein': protein,
      'energy': energy,
      'calcium': calcium,
      'phosphore': phosphore,
    };
  }

  // ✅ Factory fromJson pour Firebase/import
  factory NutritionalRequirement.fromJson(Map<String, dynamic> json) {
    return NutritionalRequirement(
      animal: json['animal'] as String,
      stage: json['stage'] as String,
      protein: (json['protein'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      calcium: (json['calcium'] as num).toDouble(),
      phosphore: (json['phosphore'] as num).toDouble(),
    );
  }

  // ✅ BONUS: Méthode pour afficher les infos
  @override
  String toString() {
    return 'NutritionalRequirement(animal: $animal, stage: $stage, '
           'protein: $protein%, energy: ${energy}kcal/kg, '
           'calcium: $calcium%, phosphore: $phosphore%)';
  }
}
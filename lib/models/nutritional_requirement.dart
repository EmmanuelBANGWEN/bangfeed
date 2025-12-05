// import 'package:hive/hive.dart';
// part 'nutritional_requirement.g.dart';

// @HiveType(typeId: 3) // ⚠️ ATTENTION: Changer typeId si 1 est déjà utilisé par Formulation
// class NutritionalRequirement extends HiveObject {
//   @HiveField(0)
//   String animal; // Ex: "Porc", "Poulet de chair"

//   @HiveField(1)
//   String stage; // Ex: "Croissance", "Démarrage"

//   @HiveField(2)
//   double protein; // Besoin en protéines brutes (%)

//   @HiveField(3)
//   double energy; // Besoin en énergie (kcal/kg)

//   @HiveField(4)
//   double calcium; // Besoin en calcium (%)

//   @HiveField(5)
//   double phosphore; // Besoin en phosphore (%)

//   NutritionalRequirement({
//     required this.animal,
//     required this.stage,
//     required this.protein,
//     required this.energy,
//     required this.calcium,
//     required this.phosphore,
//   });

//   // ✅ Méthode toJson pour Firebase/export
//   Map<String, dynamic> toJson() {
//     return {
//       'animal': animal,
//       'stage': stage,
//       'protein': protein,
//       'energy': energy,
//       'calcium': calcium,
//       'phosphore': phosphore,
//     };
//   }

//   // ✅ Factory fromJson pour Firebase/import
//   factory NutritionalRequirement.fromJson(Map<String, dynamic> json) {
//     return NutritionalRequirement(
//       animal: json['animal'] as String,
//       stage: json['stage'] as String,
//       protein: (json['protein'] as num).toDouble(),
//       energy: (json['energy'] as num).toDouble(),
//       calcium: (json['calcium'] as num).toDouble(),
//       phosphore: (json['phosphore'] as num).toDouble(),
//     );
//   }

//   // ✅ BONUS: Méthode pour afficher les infos
//   @override
//   String toString() {
//     return 'NutritionalRequirement(animal: $animal, stage: $stage, '
//            'protein: $protein%, energy: ${energy}kcal/kg, '
//            'calcium: $calcium%, phosphore: $phosphore%)';
//   }
// }














































import 'package:hive/hive.dart';
part 'nutritional_requirement.g.dart';

@HiveType(typeId: 3)
class NutritionalRequirement extends HiveObject {
  @HiveField(0)
  String animal; // Ex: "Porc", "Poulet"

  @HiveField(1)
  String stage; // Ex: "Croissance", "Démarrage"

  @HiveField(2)
  double protein; // (%)

  @HiveField(3)
  double energy; // (kcal/kg)

  @HiveField(4)
  double calcium; // (%)

  @HiveField(5)
  double phosphore; // (%)

  @HiveField(6)
  double lysine; // (%)

  @HiveField(7)
  double methionine; // (%)

  @HiveField(8)
  double fiber; // (%)

  @HiveField(9)
  double fat; // Matière grasse (%)

  NutritionalRequirement({
    required this.animal,
    required this.stage,
    required this.protein,
    required this.energy,
    required this.calcium,
    required this.phosphore,
    required this.lysine,
    required this.methionine,
    required this.fiber,
    required this.fat,
  });

  // ✅ Convertir objet → JSON (Firebase ou export)
  Map<String, dynamic> toJson() {
    return {
      'animal': animal,
      'stage': stage,
      'protein': protein,
      'energy': energy,
      'calcium': calcium,
      'phosphore': phosphore,
      'lysine': lysine,
      'methionine': methionine,
      'fiber': fiber,
      'fat': fat,
    };
  }

  // ✅ Convertir JSON → objet (Firebase ou import)
  factory NutritionalRequirement.fromJson(Map<String, dynamic> json) {
    return NutritionalRequirement(
      animal: json['animal'] as String,
      stage: json['stage'] as String,
      protein: (json['protein'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      calcium: (json['calcium'] as num).toDouble(),
      phosphore: (json['phosphore'] as num).toDouble(),
      lysine: json['lysine'] != null ? (json['lysine'] as num).toDouble() : 0.0,
      methionine: json['methionine'] != null ? (json['methionine'] as num).toDouble() : 0.0,
      fiber: json['fiber'] != null ? (json['fiber'] as num).toDouble() : 0.0,
      fat: json['fat'] != null ? (json['fat'] as num).toDouble() : 0.0,
    );
  }

  // Juste pour affichage dans debug
  @override
  String toString() {
    return 'NutritionalRequirement('
        'animal: $animal, stage: $stage, '
        'protein: $protein%, energy: ${energy}kcal/kg, '
        'calcium: $calcium%, phosphore: $phosphore%, '
        'lysine: $lysine%, methionine: $methionine%, '
        'fiber: $fiber%, fat: $fat%)';
  }
}

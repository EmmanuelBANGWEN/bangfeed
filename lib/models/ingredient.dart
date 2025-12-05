// import 'package:hive/hive.dart';
// part 'ingredient.g.dart';

// @HiveType(typeId: 0)
// class Ingredient extends HiveObject {
//   @HiveField(0)
//   String name;

//   @HiveField(1)
//   double protein;

//   @HiveField(2)
//   double energy;

//   @HiveField(3)
//   double price;

//   @HiveField(4)
//   double? quantity; // Quantité (kg)

//   // 🆕 Nouveaux champs nutritifs
//   @HiveField(5)
//   double? calcium; // % de Ca

//   @HiveField(6)
//   double? phosphore; // % de P

//   @HiveField(7)
//   double? minIncl; // Inclusion minimale (0-1, ex: 0.05 = 5%)

//   @HiveField(8)
//   double? maxIncl; // Inclusion maximale (0-1, ex: 0.40 = 40%)


//   Ingredient({
//     required this.name,
//     required this.protein,
//     required this.energy,
//     required this.price,
//     this.quantity,
//     this.calcium,
//     this.phosphore,

//     this.minIncl = 0.0,
//     this.maxIncl = 100.0,

//   });




//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Ingredient &&
//           runtimeType == other.runtimeType &&
//           name == other.name; // on compare juste par nom

//   @override
//   int get hashCode => name.hashCode;


//   // ✅ Méthode copyWith (utile si tu veux modifier un ingrédient sans recréer l’objet)
//   Ingredient copyWith({
//     String? name,
//     double? protein,
//     double? energy,
//     double? price,
//     double? quantity,
//     double? calcium,
//     double? phosphore,
//   }) {
//     return Ingredient(
//       name: name ?? this.name,
//       protein: protein ?? this.protein,
//       energy: energy ?? this.energy,
//       price: price ?? this.price,
//       quantity: quantity ?? this.quantity,
//       calcium: calcium ?? this.calcium,
//       phosphore: phosphore ?? this.phosphore,
//     );
//   }

//   // ✅ Conversion vers Map (utile pour Firebase ou export JSON)
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'protein': protein,
//       'energy': energy,
//       'price': price,
//       'quantity': quantity,
//       'calcium': calcium,
//       'phosphore': phosphore,
//     };
//   }

//   // ✅ Création à partir d’un Map (utile pour importer des données)
//   factory Ingredient.fromJson(Map<String, dynamic> json) {
//     return Ingredient(
//       name: json['name'] as String,
//       protein: (json['protein'] as num).toDouble(),
//       energy: (json['energy'] as num).toDouble(),
//       price: (json['price'] as num).toDouble(),
//       quantity: json['quantity'] != null ? (json['quantity'] as num).toDouble() : null,
//       calcium: json['calcium'] != null ? (json['calcium'] as num).toDouble() : null,
//       phosphore: json['phosphore'] != null ? (json['phosphore'] as num).toDouble() : null,
//     );
//   }
// }





import 'package:hive/hive.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 0)
class Ingredient extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double protein;

  @HiveField(2)
  double energy;

  @HiveField(3)
  double price;

  @HiveField(4)
  double? quantity;

  @HiveField(5)
  double? calcium;

  @HiveField(6)
  double? phosphore;

  @HiveField(7)
  double? minIncl;

  @HiveField(8)
  double? maxIncl;

  // 🆕 Nouveaux nutriments
  @HiveField(9)
  double? lysine;

  @HiveField(10)
  double? methionine;

  @HiveField(11)
  double? fiber;

  @HiveField(12)
  double? fat;

  Ingredient({
    required this.name,
    required this.protein,
    required this.energy,
    required this.price,
    this.quantity,
    this.calcium,
    this.phosphore,

    this.minIncl = 0.0,
    this.maxIncl = 1.0, // ✔️ corrigé

    this.lysine,
    this.methionine,
    this.fiber,
    this.fat,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  // 📌 copyWith pour mettre à jour sans recréer
  Ingredient copyWith({
    String? name,
    double? protein,
    double? energy,
    double? price,
    double? quantity,
    double? calcium,
    double? phosphore,
    double? minIncl,
    double? maxIncl,
    double? lysine,
    double? methionine,
    double? fiber,
    double? fat,
  }) {
    return Ingredient(
      name: name ?? this.name,
      protein: protein ?? this.protein,
      energy: energy ?? this.energy,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      calcium: calcium ?? this.calcium,
      phosphore: phosphore ?? this.phosphore,
      minIncl: minIncl ?? this.minIncl,
      maxIncl: maxIncl ?? this.maxIncl,
      lysine: lysine ?? this.lysine,
      methionine: methionine ?? this.methionine,
      fiber: fiber ?? this.fiber,
      fat: fat ?? this.fat,
    );
  }

  // 📌 Conversion vers JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'protein': protein,
      'energy': energy,
      'price': price,
      'quantity': quantity,
      'calcium': calcium,
      'phosphore': phosphore,
      'minIncl': minIncl,
      'maxIncl': maxIncl,
      'lysine': lysine,
      'methionine': methionine,
      'fiber': fiber,
      'fat': fat,
    };
  }

  // 📌 Création depuis JSON
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      protein: (json['protein'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] != null ? (json['quantity'] as num).toDouble() : null,
      calcium: json['calcium'] != null ? (json['calcium'] as num).toDouble() : null,
      phosphore: json['phosphore'] != null ? (json['phosphore'] as num).toDouble() : null,
      minIncl: json['minIncl'] != null ? (json['minIncl'] as num).toDouble() : 0.0,
      maxIncl: json['maxIncl'] != null ? (json['maxIncl'] as num).toDouble() : 1.0,
      lysine: json['lysine'] != null ? (json['lysine'] as num).toDouble() : null,
      methionine: json['methionine'] != null ? (json['methionine'] as num).toDouble() : null,
      fiber: json['fiber'] != null ? (json['fiber'] as num).toDouble() : null,
      fat: json['fat'] != null ? (json['fat'] as num).toDouble() : null,
    );
  }
}

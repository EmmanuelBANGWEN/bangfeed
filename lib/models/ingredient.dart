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
  double? quantity; // Quantité (kg)

  // 🆕 Nouveaux champs nutritifs
  @HiveField(5)
  double? calcium; // % de Ca

  @HiveField(6)
  double? phosphore; // % de P

  @HiveField(7)
  double? minIncl; // Inclusion minimale (0-1, ex: 0.05 = 5%)

  @HiveField(8)
  double? maxIncl; // Inclusion maximale (0-1, ex: 0.40 = 40%)


  Ingredient({
    required this.name,
    required this.protein,
    required this.energy,
    required this.price,
    this.quantity,
    this.calcium,
    this.phosphore,

    this.minIncl = 0.0,
    this.maxIncl = 100.0,

  });




  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient &&
          runtimeType == other.runtimeType &&
          name == other.name; // on compare juste par nom

  @override
  int get hashCode => name.hashCode;


  // ✅ Méthode copyWith (utile si tu veux modifier un ingrédient sans recréer l’objet)
  Ingredient copyWith({
    String? name,
    double? protein,
    double? energy,
    double? price,
    double? quantity,
    double? calcium,
    double? phosphore,
  }) {
    return Ingredient(
      name: name ?? this.name,
      protein: protein ?? this.protein,
      energy: energy ?? this.energy,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      calcium: calcium ?? this.calcium,
      phosphore: phosphore ?? this.phosphore,
    );
  }

  // ✅ Conversion vers Map (utile pour Firebase ou export JSON)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'protein': protein,
      'energy': energy,
      'price': price,
      'quantity': quantity,
      'calcium': calcium,
      'phosphore': phosphore,
    };
  }

  // ✅ Création à partir d’un Map (utile pour importer des données)
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      protein: (json['protein'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] != null ? (json['quantity'] as num).toDouble() : null,
      calcium: json['calcium'] != null ? (json['calcium'] as num).toDouble() : null,
      phosphore: json['phosphore'] != null ? (json['phosphore'] as num).toDouble() : null,
    );
  }
}

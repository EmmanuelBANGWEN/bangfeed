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
  double? quantity; // Quantité en kg - NOUVELLE PROPRIÉTÉ

  Ingredient({
    required this.name,
    required this.protein,
    required this.energy,
    required this.price,
    this.quantity, // Optionnel
  });

  // Méthode pour copier avec modification
  Ingredient copyWith({
    String? name,
    double? protein,
    double? energy,
    double? price,
    double? quantity,
  }) {
    return Ingredient(
      name: name ?? this.name,
      protein: protein ?? this.protein,
      energy: energy ?? this.energy,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  // Méthode pour convertir en Map (utile pour Firebase)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'protein': protein,
      'energy': energy,
      'price': price,
      'quantity': quantity,
    };
  }

  // Méthode pour créer depuis Map
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      protein: (json['protein'] as num).toDouble(),
      energy: (json['energy'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] != null 
          ? (json['quantity'] as num).toDouble() 
          : null,
    );
  }
}
// lib/data/ingredients_data.dart

import 'package:bangfeed/models/ingredient.dart';

// import '../models/ingredient.dart';

class IngredientsData {
  /// Liste complète des ingrédients avec contraintes min/max d'incorporation
  /// minIncl et maxIncl sont en proportions (0-1), pas en pourcentages
  /// Exemple: 0.05 = 5%, 0.40 = 40%
  
  static final List<Ingredient> allIngredients = [
    // ═══════════════════════════════════════════════════════════════
    // ADDITIFS & COMPLÉMENTS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Additifs enzymes / probiotiques',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 5000,
      minIncl: 0.0001, maxIncl: 0.01, // 0.01% - 1%
    ),
    
    Ingredient(
      name: 'Aliment complet granulé',
      protein: 20, energy: 3000, calcium: 0.3, phosphore: 0.4, price: 800,
      minIncl: 0.50, maxIncl: 1.0, // 50% - 100%
    ),

    // ═══════════════════════════════════════════════════════════════
    // CÉRÉALES & TUBERCULES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Banane',
      protein: 1.5, energy: 8500, calcium: 0.3, phosphore: 0.2, price: 225,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Blé',
      protein: 13, energy: 3100, calcium: 0.04, phosphore: 0.35, price: 390,
      minIncl: 0.05, maxIncl: 0.50, // 5% - 50%
    ),
    
    Ingredient(
      name: 'Maïs',
      protein: 9, energy: 3400, calcium: 0.03, phosphore: 0.28, price: 275,
      minIncl: 0.30, maxIncl: 0.70, // 30% - 70%
    ),
    
    Ingredient(
      name: 'Manioc',
      protein: 2, energy: 2800, calcium: 0.2, phosphore: 0.25, price: 175,
      minIncl: 0, maxIncl: 0.40, // 0% - 40%
    ),
    
    Ingredient(
      name: 'Millet',
      protein: 10, energy: 3200, calcium: 0.03, phosphore: 0.25, price: 300,
      minIncl: 0, maxIncl: 0.50, // 0% - 50%
    ),
    
    Ingredient(
      name: 'Patate douce',
      protein: 1.5, energy: 3600, calcium: 0.2, phosphore: 0.2, price: 200,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Plantain',
      protein: 2, energy: 8500, calcium: 0.3, phosphore: 0.2, price: 225,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Riz brisé',
      protein: 7, energy: 3300, calcium: 0.02, phosphore: 0.2, price: 335,
      minIncl: 0, maxIncl: 0.40, // 0% - 40%
    ),
    
    Ingredient(
      name: 'Sorgho',
      protein: 10, energy: 3300, calcium: 0.04, phosphore: 0.25, price: 300,
      minIncl: 0, maxIncl: 0.60, // 0% - 60%
    ),
    
    Ingredient(
      name: 'Tapioca',
      protein: 1, energy: 3500, calcium: 0.02, phosphore: 0.01, price: 175,
      minIncl: 0, maxIncl: 0.30, // 0% - 30%
    ),

    // ═══════════════════════════════════════════════════════════════
    // TOURTEAUX & SOURCES PROTÉIQUES VÉGÉTALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Tourteau d\'arachide',
      protein: 43, energy: 2300, calcium: 0.2, phosphore: 0.5, price: 325,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Tourteau de colza',
      protein: 36, energy: 2400, calcium: 0.5, phosphore: 0.8, price: 400,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Tourteau de coprah',
      protein: 20, energy: 5200, calcium: 0.2, phosphore: 0.6, price: 250,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Tourteau de coton',
      protein: 36, energy: 2400, calcium: 0.25, phosphore: 1.1, price: 275,
      minIncl: 0, maxIncl: 0.15, // 0% - 15% (antinutriments)
    ),
    
    Ingredient(
      name: 'Tourteau de sésame',
      protein: 23, energy: 3000, calcium: 1.0, phosphore: 0.9, price: 500,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Tourteau de soja',
      protein: 44, energy: 2500, calcium: 0.3, phosphore: 0.65, price: 475,
      minIncl: 0, maxIncl: 0.40, // 0% - 40%
    ),
    
    Ingredient(
      name: 'Tourteau de tournesol',
      protein: 28, energy: 2800, calcium: 0.3, phosphore: 0.6, price: 400,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),
    
    Ingredient(
      name: 'Palm Kernel Cake (PKC)',
      protein: 18, energy: 2800, calcium: 0.4, phosphore: 0.7, price: 225,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),

    // ═══════════════════════════════════════════════════════════════
    // SONS & SOUS-PRODUITS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Son de blé',
      protein: 15, energy: 2800, calcium: 0.13, phosphore: 1.17, price: 240,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Son de maïs',
      protein: 20, energy: 2800, calcium: 0.2, phosphore: 0.7, price: 250,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Son de riz',
      protein: 13, energy: 3000, calcium: 0.07, phosphore: 1.5, price: 260,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Coques de cacao',
      protein: 7, energy: 2500, calcium: 0.2, phosphore: 0.4, price: 150,
      minIncl: 0, maxIncl: 0.15, // 0% - 15%
    ),
    
    Ingredient(
      name: 'Drêches de brasserie',
      protein: 22, energy: 2000, calcium: 0.3, phosphore: 0.6, price: 150,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Pulpe de manioc',
      protein: 2, energy: 2900, calcium: 0.15, phosphore: 0.2, price: 140,
      minIncl: 0, maxIncl: 0.25, // 0% - 25%
    ),

    // ═══════════════════════════════════════════════════════════════
    // FARINES ANIMALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Farine de poisson',
      protein: 60, energy: 2500, calcium: 5.5, phosphore: 3.1, price: 1100,
      minIncl: 0, maxIncl: 0.15, // 0% - 15%
    ),
    
    Ingredient(
      name: 'Farine de sang',
      protein: 82, energy: 3500, calcium: 0.5, phosphore: 1.5, price: 850,
      minIncl: 0, maxIncl: 0.05, // 0% - 5%
    ),
    
    Ingredient(
      name: 'Farine de viande',
      protein: 52, energy: 3200, calcium: 2.0, phosphore: 1.0, price: 750,
      minIncl: 0, maxIncl: 0.10, // 0% - 10%
    ),
    
    Ingredient(
      name: 'Farine d\'insectes',
      protein: 45, energy: 3000, calcium: 2, phosphore: 1, price: 2000,
      minIncl: 0.02, maxIncl: 0.20, // 2% - 20%
    ),
    
    Ingredient(
      name: 'Plumes broyées',
      protein: 80, energy: 4000, calcium: 0.2, phosphore: 0.6, price: 450,
      minIncl: 0, maxIncl: 0.10, // 0% - 10%
    ),

    // ═══════════════════════════════════════════════════════════════
    // SOURCES MINÉRALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Chaux (carbonate de calcium)',
      protein: 0, energy: 0, calcium: 37, phosphore: 0, price: 100,
      minIncl: 0.005, maxIncl: 0.06, // 0.5% - 6%
    ),
    
    Ingredient(
      name: 'Farine d\'huîtres',
      protein: 5, energy: 0, calcium: 32, phosphore: 0.1, price: 450,
      minIncl: 0.001, maxIncl: 0.05, // 0.1% - 5%
    ),
    
    Ingredient(
      name: 'Farine d\'os carbonatée',
      protein: 0, energy: 0, calcium: 28, phosphore: 12, price: 120,
      minIncl: 0.001, maxIncl: 0.05, // 0.1% - 5%
    ),
    
    Ingredient(
      name: 'Farine de coquille d\'œuf',
      protein: 0, energy: 0, calcium: 35, phosphore: 0, price: 450,
      minIncl: 0.001, maxIncl: 0.05, // 0.1% - 5%
    ),
    
    Ingredient(
      name: 'Poudre d\'os',
      protein: 0, energy: 0, calcium: 28, phosphore: 13, price: 120,
      minIncl: 0.001, maxIncl: 0.05, // 0.1% - 5%
    ),
    
    Ingredient(
      name: 'Phosphate dicalcique',
      protein: 0, energy: 0, calcium: 20, phosphore: 20, price: 1000,
      minIncl: 0.002, maxIncl: 0.03, // 0.2% - 3%
    ),
    
    Ingredient(
      name: 'Sel',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 150,
      minIncl: 0.002, maxIncl: 0.006, // 0.2% - 0.6%
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS VOLAILLES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré volaille 5%',
      protein: 35, energy: 2900, calcium: 4, phosphore: 2, price: 950,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré volaille 10%',
      protein: 40, energy: 3000, calcium: 4.5, phosphore: 2.5, price: 900,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré volaille 20%',
      protein: 45, energy: 2800, calcium: 5, phosphore: 2.5, price: 850,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré poulet démarrage 30%',
      protein: 50, energy: 2900, calcium: 5, phosphore: 3, price: 800,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré poulet croissance 30%',
      protein: 45, energy: 3000, calcium: 5, phosphore: 2.5, price: 800,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré pondeuse 30%',
      protein: 40, energy: 2800, calcium: 7, phosphore: 3, price: 850,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS PORCS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré porc 5%',
      protein: 30, energy: 3100, calcium: 4, phosphore: 2, price: 950,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré porc 10%',
      protein: 35, energy: 3000, calcium: 5, phosphore: 3, price: 900,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré porc 20%',
      protein: 40, energy: 2900, calcium: 5, phosphore: 2.5, price: 850,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré porc engraissement 30%',
      protein: 45, energy: 3000, calcium: 4, phosphore: 2.5, price: 800,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré porc reproduction 30%',
      protein: 38, energy: 2900, calcium: 6, phosphore: 3, price: 850,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS POISSONS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré poisson 10%',
      protein: 42, energy: 3200, calcium: 3, phosphore: 2, price: 1100,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré poisson 20%',
      protein: 45, energy: 3100, calcium: 3.5, phosphore: 2.5, price: 1050,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
    
    Ingredient(
      name: 'Concentré poisson 30%',
      protein: 50, energy: 3200, calcium: 4, phosphore: 2.5, price: 1000,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),

    // ═══════════════════════════════════════════════════════════════
    // PRÉMIX
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Prémix 0.5%',
      protein: 25, energy: 2800, calcium: 12, phosphore: 6, price: 1300,
      minIncl: 0.001, maxIncl: 0.01, // 0.1% - 1%
    ),
    
    Ingredient(
      name: 'Prémix 1%',
      protein: 22, energy: 2800, calcium: 10, phosphore: 5, price: 1200,
      minIncl: 0.005, maxIncl: 0.015, // 0.5% - 1.5%
    ),
    
    Ingredient(
      name: 'Prémix 2%',
      protein: 20, energy: 2900, calcium: 9, phosphore: 4, price: 1100,
      minIncl: 0.01, maxIncl: 0.025, // 1% - 2.5%
    ),
    
    Ingredient(
      name: 'Prémix porc 5%',
      protein: 32, energy: 3000, calcium: 5, phosphore: 3, price: 950,
      minIncl: 0.01, maxIncl: 0.10, // 1% - 10%
    ),
    
    Ingredient(
      name: 'Prémix volaille 5%',
      protein: 34, energy: 3100, calcium: 6, phosphore: 2.5, price: 1000,
      minIncl: 0.01, maxIncl: 0.10, // 1% - 10%
    ),
    
    Ingredient(
      name: 'Prémix poisson 5%',
      protein: 38, energy: 3200, calcium: 3, phosphore: 2, price: 1200,
      minIncl: 0.01, maxIncl: 0.10, // 1% - 10%
    ),
    
    Ingredient(
      name: 'Prémélange minéral',
      protein: 3, energy: 0, calcium: 18, phosphore: 9, price: 1000,
      minIncl: 0.005, maxIncl: 0.05, // 0.5% - 5%
    ),

    // ═══════════════════════════════════════════════════════════════
    // ACIDES AMINÉS SYNTHÉTIQUES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'DL-Méthionine',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 4500,
      minIncl: 0.0001, maxIncl: 0.005, // 0.01% - 0.5%
    ),
    
    Ingredient(
      name: 'L-Lysine',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 3500,
      minIncl: 0.0001, maxIncl: 0.005, // 0.01% - 0.5%
    ),

    // ═══════════════════════════════════════════════════════════════
    // MATIÈRES GRASSES & ÉNERGÉTIQUES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Huile de palme',
      protein: 0, energy: 9000, calcium: 0, phosphore: 0, price: 1500,
      minIncl: 0, maxIncl: 0.06, // 0% - 6%
    ),
    
    Ingredient(
      name: 'Huile de poisson',
      protein: 0, energy: 9000, calcium: 0, phosphore: 0, price: 3000,
      minIncl: 0, maxIncl: 0.06, // 0% - 6%
    ),
    
    Ingredient(
      name: 'Fécule / Amidon',
      protein: 0, energy: 3500, calcium: 0, phosphore: 0, price: 250,
      minIncl: 0, maxIncl: 0.30, // 0% - 30%
    ),
    
    Ingredient(
      name: 'Mélasse',
      protein: 3, energy: 2500, calcium: 0.1, phosphore: 0.1, price: 200,
      minIncl: 0, maxIncl: 0.08, // 0% - 8%
    ),
    
    Ingredient(
      name: 'Sucre',
      protein: 0, energy: 4000, calcium: 0, phosphore: 0, price: 450,
      minIncl: 0, maxIncl: 0.08, // 0% - 8%
    ),

    // ═══════════════════════════════════════════════════════════════
    // PROTÉINES CONCENTRÉES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Gluten de maïs',
      protein: 60, energy: 3200, calcium: 0.1, phosphore: 0.9, price: 1000,
      minIncl: 0, maxIncl: 0.30, // 0% - 30%
    ),
    
    Ingredient(
      name: 'Isolat de protéine de soja',
      protein: 88, energy: 2500, calcium: 0.3, phosphore: 0.3, price: 3000,
      minIncl: 0, maxIncl: 0.40, // 0% - 40%
    ),
    
    Ingredient(
      name: 'Protéines végétales concentrées',
      protein: 65, energy: 2500, calcium: 0.5, phosphore: 0.8, price: 1500,
      minIncl: 0, maxIncl: 0.30, // 0% - 30%
    ),
    
    Ingredient(
      name: 'Levure de brasserie',
      protein: 45, energy: 2500, calcium: 0.4, phosphore: 1.0, price: 650,
      minIncl: 0, maxIncl: 0.10, // 0% - 10%
    ),

    // ═══════════════════════════════════════════════════════════════
    // AUTRES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Graine de coton entière',
      protein: 22, energy: 5000, calcium: 0.2, phosphore: 0.3, price: 250,
      minIncl: 0, maxIncl: 0.15, // 0% - 15%
    ),
    
    Ingredient(
      name: 'Lait en poudre',
      protein: 30, energy: 2500, calcium: 9, phosphore: 0.9, price: 1500,
      minIncl: 0, maxIncl: 0.30, // 0% - 30%
    ),
    
    Ingredient(
      name: 'Légumes secs',
      protein: 22, energy: 3000, calcium: 0.2, phosphore: 0.4, price: 500,
      minIncl: 0, maxIncl: 0.20, // 0% - 20%
    ),
    
    Ingredient(
      name: 'Substitut de lait',
      protein: 35, energy: 2500, calcium: 6, phosphore: 0.5, price: 1500,
      minIncl: 0.05, maxIncl: 0.40, // 5% - 40%
    ),
  ];

  /// Récupère un ingrédient par son nom
  static Ingredient? getByName(String name) {
    try {
      return allIngredients.firstWhere((ing) => ing.name == name);
    } catch (_) {
      return null;
    }
  }

  /// Récupère tous les ingrédients triés par nom
  static List<Ingredient> getSortedIngredients() {
    List<Ingredient> sorted = List.from(allIngredients);
    sorted.sort((a, b) => a.name.compareTo(b.name));
    return sorted;
  }
}
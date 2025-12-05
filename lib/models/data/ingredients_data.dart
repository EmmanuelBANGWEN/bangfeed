// lib/data/ingredients_data.dart

import 'package:bangfeed/models/ingredient.dart';

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
      minIncl: 0.0001, maxIncl: 0.01,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Aliment complet granulé',
      protein: 20, energy: 3000, calcium: 0.3, phosphore: 0.4, price: 800,
      minIncl: 0.50, maxIncl: 1.0,
      lysine: 1.2, methionine: 0.6, fiber: 5, fat: 3,
    ),

    // ═══════════════════════════════════════════════════════════════
    // CÉRÉALES & TUBERCULES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Banane',
      protein: 1.5, energy: 8500, calcium: 0.3, phosphore: 0.2, price: 225,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.05, methionine: 0.02, fiber: 6, fat: 0.5,
    ),
    
    Ingredient(
      name: 'Blé',
      protein: 13, energy: 3100, calcium: 0.04, phosphore: 0.35, price: 390,
      minIncl: 0.05, maxIncl: 0.50,
      lysine: 0.3, methionine: 0.12, fiber: 12, fat: 1.5,
    ),
    
    Ingredient(
      name: 'Maïs',
      protein: 9, energy: 3400, calcium: 0.03, phosphore: 0.28, price: 275,
      minIncl: 0.30, maxIncl: 0.70,
      lysine: 0.25, methionine: 0.1, fiber: 10, fat: 3.5,
    ),
    
    Ingredient(
      name: 'Manioc',
      protein: 2, energy: 2800, calcium: 0.2, phosphore: 0.25, price: 175,
      minIncl: 0, maxIncl: 0.40,
      lysine: 0.05, methionine: 0.02, fiber: 5, fat: 0.1,
    ),
    
    Ingredient(
      name: 'Millet',
      protein: 10, energy: 3200, calcium: 0.03, phosphore: 0.25, price: 300,
      minIncl: 0, maxIncl: 0.50,
      lysine: 0.22, methionine: 0.09, fiber: 8, fat: 2,
    ),
    
    Ingredient(
      name: 'Patate douce',
      protein: 1.5, energy: 3600, calcium: 0.2, phosphore: 0.2, price: 200,
      minIncl: 0, maxIncl: 0.25,
      lysine: 0.04, methionine: 0.02, fiber: 6, fat: 0.1,
    ),
    
    Ingredient(
      name: 'Plantain',
      protein: 2, energy: 8500, calcium: 0.3, phosphore: 0.2, price: 225,
      minIncl: 0, maxIncl: 0.25,
      lysine: 0.05, methionine: 0.02, fiber: 7, fat: 0.3,
    ),
    
    Ingredient(
      name: 'Riz brisé',
      protein: 7, energy: 3300, calcium: 0.02, phosphore: 0.2, price: 335,
      minIncl: 0, maxIncl: 0.40,
      lysine: 0.12, methionine: 0.06, fiber: 5, fat: 1,
    ),
    
    Ingredient(
      name: 'Sorgho',
      protein: 10, energy: 3300, calcium: 0.04, phosphore: 0.25, price: 300,
      minIncl: 0, maxIncl: 0.60,
      lysine: 0.24, methionine: 0.11, fiber: 9, fat: 2.5,
    ),
    
    Ingredient(
      name: 'Tapioca',
      protein: 1, energy: 3500, calcium: 0.02, phosphore: 0.01, price: 175,
      minIncl: 0, maxIncl: 0.30,
      lysine: 0.01, methionine: 0.01, fiber: 4, fat: 0.1,
    ),

    // ═══════════════════════════════════════════════════════════════
    // TOURTEAUX & SOURCES PROTÉIQUES VÉGÉTALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Tourteau d\'arachide',
      protein: 43, energy: 2300, calcium: 0.2, phosphore: 0.5, price: 325,
      minIncl: 0, maxIncl: 0.25,
      lysine: 2.2, methionine: 0.8, fiber: 8, fat: 10,
    ),
    
    Ingredient(
      name: 'Tourteau de colza',
      protein: 36, energy: 2400, calcium: 0.5, phosphore: 0.8, price: 400,
      minIncl: 0, maxIncl: 0.25,
      lysine: 1.8, methionine: 0.9, fiber: 10, fat: 8,
    ),
    
    Ingredient(
      name: 'Tourteau de coprah',
      protein: 20, energy: 5200, calcium: 0.2, phosphore: 0.6, price: 250,
      minIncl: 0, maxIncl: 0.25,
      lysine: 0.8, methionine: 0.4, fiber: 12, fat: 6,
    ),
    
    Ingredient(
      name: 'Tourteau de coton',
      protein: 36, energy: 2400, calcium: 0.25, phosphore: 1.1, price: 275,
      minIncl: 0, maxIncl: 0.15,
      lysine: 1.5, methionine: 0.7, fiber: 13, fat: 5,
    ),
    
    Ingredient(
      name: 'Tourteau de sésame',
      protein: 23, energy: 3000, calcium: 1.0, phosphore: 0.9, price: 500,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.9, methionine: 0.6, fiber: 9, fat: 14,
    ),
    
    Ingredient(
      name: 'Tourteau de soja',
      protein: 44, energy: 2500, calcium: 0.3, phosphore: 0.65, price: 475,
      minIncl: 0, maxIncl: 0.40,
      lysine: 3.0, methionine: 0.6, fiber: 7, fat: 1.5,
    ),
    
    Ingredient(
      name: 'Tourteau de tournesol',
      protein: 28, energy: 2800, calcium: 0.3, phosphore: 0.6, price: 400,
      minIncl: 0, maxIncl: 0.25,
      lysine: 1.2, methionine: 0.5, fiber: 14, fat: 7,
    ),
    
    Ingredient(
      name: 'Palm Kernel Cake (PKC)',
      protein: 18, energy: 2800, calcium: 0.4, phosphore: 0.7, price: 225,
      minIncl: 0, maxIncl: 0.25,
      lysine: 0.7, methionine: 0.3, fiber: 15, fat: 5,
    ),

    // ═══════════════════════════════════════════════════════════════
    // SONS & SOUS-PRODUITS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Son de blé',
      protein: 15, energy: 2800, calcium: 0.13, phosphore: 1.17, price: 240,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.5, methionine: 0.2, fiber: 40, fat: 4,
    ),
    
    Ingredient(
      name: 'Son de maïs',
      protein: 20, energy: 2800, calcium: 0.2, phosphore: 0.7, price: 250,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.6, methionine: 0.25, fiber: 35, fat: 6,
    ),
    
    Ingredient(
      name: 'Son de riz',
      protein: 13, energy: 3000, calcium: 0.07, phosphore: 1.5, price: 260,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.4, methionine: 0.15, fiber: 28, fat: 12,
    ),
    
    Ingredient(
      name: 'Coques de cacao',
      protein: 7, energy: 2500, calcium: 0.2, phosphore: 0.4, price: 150,
      minIncl: 0, maxIncl: 0.15,
      lysine: 0.3, methionine: 0.1, fiber: 30, fat: 3,
    ),
    
    Ingredient(
      name: 'Drêches de brasserie',
      protein: 22, energy: 2000, calcium: 0.3, phosphore: 0.6, price: 150,
      minIncl: 0, maxIncl: 0.20,
      lysine: 0.8, methionine: 0.35, fiber: 18, fat: 5,
    ),
    
    Ingredient(
      name: 'Pulpe de manioc',
      protein: 2, energy: 2900, calcium: 0.15, phosphore: 0.2, price: 140,
      minIncl: 0, maxIncl: 0.25,
      lysine: 0.04, methionine: 0.02, fiber: 8, fat: 0.2,
    ),

    // ═══════════════════════════════════════════════════════════════
    // FARINES ANIMALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Farine de poisson',
      protein: 60, energy: 2500, calcium: 5.5, phosphore: 3.1, price: 1100,
      minIncl: 0, maxIncl: 0.15,
      lysine: 5.0, methionine: 1.5, fiber: 1, fat: 8,
    ),
    
    Ingredient(
      name: 'Farine de sang',
      protein: 82, energy: 3500, calcium: 0.5, phosphore: 1.5, price: 850,
      minIncl: 0, maxIncl: 0.05,
      lysine: 7.5, methionine: 0.8, fiber: 0, fat: 1,
    ),
    
    Ingredient(
      name: 'Farine de viande',
      protein: 52, energy: 3200, calcium: 2.0, phosphore: 1.0, price: 750,
      minIncl: 0, maxIncl: 0.10,
      lysine: 4.0, methionine: 1.2, fiber: 2, fat: 12,
    ),
    
    Ingredient(
      name: 'Farine d\'insectes',
      protein: 45, energy: 3000, calcium: 2, phosphore: 1, price: 2000,
      minIncl: 0.02, maxIncl: 0.20,
      lysine: 3.5, methionine: 1.0, fiber: 6, fat: 18,
    ),
    
    Ingredient(
      name: 'Plumes broyées',
      protein: 80, energy: 4000, calcium: 0.2, phosphore: 0.6, price: 450,
      minIncl: 0, maxIncl: 0.10,
      lysine: 2.5, methionine: 0.6, fiber: 1, fat: 4,
    ),

    // ═══════════════════════════════════════════════════════════════
    // SOURCES MINÉRALES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Chaux (carbonate de calcium)',
      protein: 0, energy: 0, calcium: 37, phosphore: 0, price: 100,
      minIncl: 0.005, maxIncl: 0.06,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Farine d\'huîtres',
      protein: 5, energy: 0, calcium: 32, phosphore: 0.1, price: 450,
      minIncl: 0.001, maxIncl: 0.05,
      lysine: 0.2, methionine: 0.1, fiber: 0, fat: 0.5,
    ),
    
    Ingredient(
      name: 'Farine d\'os carbonatée',
      protein: 0, energy: 0, calcium: 28, phosphore: 12, price: 120,
      minIncl: 0.001, maxIncl: 0.05,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Farine de coquille d\'œuf',
      protein: 0, energy: 0, calcium: 35, phosphore: 0, price: 450,
      minIncl: 0.001, maxIncl: 0.05,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Poudre d\'os',
      protein: 0, energy: 0, calcium: 28, phosphore: 13, price: 120,
      minIncl: 0.001, maxIncl: 0.05,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Phosphate dicalcique',
      protein: 0, energy: 0, calcium: 20, phosphore: 20, price: 1000,
      minIncl: 0.002, maxIncl: 0.03,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Sel',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 150,
      minIncl: 0.002, maxIncl: 0.006,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS VOLAILLES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré volaille 5%',
      protein: 35, energy: 2900, calcium: 4, phosphore: 2, price: 950,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 2.5, methionine: 0.9, fiber: 4, fat: 4,
    ),
    
    Ingredient(
      name: 'Concentré volaille 10%',
      protein: 40, energy: 3000, calcium: 4.5, phosphore: 2.5, price: 900,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.0, methionine: 1.0, fiber: 3, fat: 5,
    ),
    
    Ingredient(
      name: 'Concentré volaille 20%',
      protein: 45, energy: 2800, calcium: 5, phosphore: 2.5, price: 850,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.5, methionine: 1.2, fiber: 3, fat: 4,
    ),
    
    Ingredient(
      name: 'Concentré poulet démarrage 30%',
      protein: 50, energy: 2900, calcium: 5, phosphore: 3, price: 800,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 4.0, methionine: 1.3, fiber: 2, fat: 5,
    ),
    
    Ingredient(
      name: 'Concentré poulet croissance 30%',
      protein: 45, energy: 3000, calcium: 5, phosphore: 2.5, price: 800,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.5, methionine: 1.1, fiber: 3, fat: 5,
    ),
    
    Ingredient(
      name: 'Concentré pondeuse 30%',
      protein: 40, energy: 2800, calcium: 7, phosphore: 3, price: 850,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.0, methionine: 1.0, fiber: 4, fat: 4,
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS PORCS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré porc 5%',
      protein: 30, energy: 3100, calcium: 4, phosphore: 2, price: 950,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 2.2, methionine: 0.8, fiber: 4, fat: 3,
    ),
    
    Ingredient(
      name: 'Concentré porc 10%',
      protein: 35, energy: 3000, calcium: 5, phosphore: 3, price: 900,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 2.5, methionine: 0.9, fiber: 3, fat: 4,
    ),
    
    Ingredient(
      name: 'Concentré porc 20%',
      protein: 40, energy: 2900, calcium: 5, phosphore: 2.5, price: 850,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.0, methionine: 1.0, fiber: 3, fat: 4,
    ),
    
    Ingredient(
      name: 'Concentré porc engraissement 30%',
      protein: 45, energy: 3000, calcium: 4, phosphore: 2.5, price: 800,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.5, methionine: 1.1, fiber: 3, fat: 5,
    ),
    
    Ingredient(
      name: 'Concentré porc reproduction 30%',
      protein: 38, energy: 2900, calcium: 6, phosphore: 3, price: 850,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 2.8, methionine: 0.9, fiber: 4, fat: 4,
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONCENTRÉS POISSONS
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Concentré poisson 10%',
      protein: 42, energy: 3200, calcium: 3, phosphore: 2, price: 1100,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.2, methionine: 1.0, fiber: 2, fat: 6,
    ),
    
    Ingredient(
      name: 'Concentré poisson 20%',
      protein: 45, energy: 3100, calcium: 3.5, phosphore: 2.5, price: 1050,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 3.5, methionine: 1.1, fiber: 2, fat: 7,
    ),
    
    Ingredient(
      name: 'Concentré poisson 30%',
      protein: 50, energy: 3200, calcium: 4, phosphore: 2.5, price: 1000,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 4.0, methionine: 1.3, fiber: 2, fat: 8,
    ),

    // ═══════════════════════════════════════════════════════════════
    // PRÉMIX
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Prémix 0.5%',
      protein: 25, energy: 2800, calcium: 12, phosphore: 6, price: 1300,
      minIncl: 0.001, maxIncl: 0.01,
      lysine: 1.5, methionine: 0.6, fiber: 3, fat: 2,
    ),
    
    Ingredient(
      name: 'Prémix 1%',
      protein: 22, energy: 2800, calcium: 10, phosphore: 5, price: 1200,
      minIncl: 0.005, maxIncl: 0.015,
      lysine: 1.3, methionine: 0.5, fiber: 3, fat: 2,
    ),
    
    Ingredient(
      name: 'Prémix 2%',
      protein: 20, energy: 2900, calcium: 9, phosphore: 4, price: 1100,
      minIncl: 0.01, maxIncl: 0.025,
      lysine: 1.2, methionine: 0.5, fiber: 3, fat: 2,
    ),
    
    Ingredient(
      name: 'Prémix porc 5%',
      protein: 32, energy: 3000, calcium: 5, phosphore: 3, price: 950,
      minIncl: 0.01, maxIncl: 0.10,
      lysine: 2.0, methionine: 0.7, fiber: 3, fat: 3,
    ),
    
    Ingredient(
      name: 'Prémix volaille 5%',
      protein: 34, energy: 3100, calcium: 6, phosphore: 2.5, price: 1000,
      minIncl: 0.01, maxIncl: 0.10,
      lysine: 2.2, methionine: 0.8, fiber: 3, fat: 3,
    ),
    
    Ingredient(
      name: 'Prémix poisson 5%',
      protein: 38, energy: 3200, calcium: 3, phosphore: 2, price: 1200,
      minIncl: 0.01, maxIncl: 0.10,
      lysine: 2.5, methionine: 0.9, fiber: 2, fat: 4,
    ),
    
    Ingredient(
      name: 'Prémélange minéral',
      protein: 3, energy: 0, calcium: 18, phosphore: 9, price: 1000,
      minIncl: 0.005, maxIncl: 0.05,
      lysine: 0.1, methionine: 0.05, fiber: 0, fat: 0,
    ),

    // ═══════════════════════════════════════════════════════════════
    // ACIDES AMINÉS SYNTHÉTIQUES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'DL-Méthionine',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 4500,
      minIncl: 0.0001, maxIncl: 0.005,
      lysine: 0, methionine: 99.0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'L-Lysine',
      protein: 0, energy: 0, calcium: 0, phosphore: 0, price: 3500,
      minIncl: 0.0001, maxIncl: 0.005,
      lysine: 99.0, methionine: 0, fiber: 0, fat: 0,
    ),

    // ═══════════════════════════════════════════════════════════════
    // MATIÈRES GRASSES & ÉNERGÉTIQUES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Huile de palme',
      protein: 0, energy: 9000, calcium: 0, phosphore: 0, price: 1500,
      minIncl: 0, maxIncl: 0.06,
      lysine: 0, methionine: 0, fiber: 0, fat: 100,
    ),
    
    Ingredient(
      name: 'Huile de poisson',
      protein: 0, energy: 9000, calcium: 0, phosphore: 0, price: 3000,
      minIncl: 0, maxIncl: 0.06,
      lysine: 0, methionine: 0, fiber: 0, fat: 100,
    ),
    
    Ingredient(
      name: 'Fécule / Amidon',
      protein: 0, energy: 3500, calcium: 0, phosphore: 0, price: 250,
      minIncl: 0, maxIncl: 0.30,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),
    
    Ingredient(
      name: 'Mélasse',
      protein: 3, energy: 2500, calcium: 0.1, phosphore: 0.1, price: 200,
      minIncl: 0, maxIncl: 0.08,
      lysine: 0.05, methionine: 0.01, fiber: 2, fat: 0,
    ),
    
    Ingredient(
      name: 'Sucre',
      protein: 0, energy: 4000, calcium: 0, phosphore: 0, price: 450,
      minIncl: 0, maxIncl: 0.08,
      lysine: 0, methionine: 0, fiber: 0, fat: 0,
    ),

    // ═══════════════════════════════════════════════════════════════
    // PROTÉINES CONCENTRÉES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Gluten de maïs',
      protein: 60, energy: 3200, calcium: 0.1, phosphore: 0.9, price: 1000,
      minIncl: 0, maxIncl: 0.30,
      lysine: 1.0, methionine: 1.2, fiber: 3, fat: 2,
    ),
    
    Ingredient(
      name: 'Isolat de protéine de soja',
      protein: 88, energy: 2500, calcium: 0.3, phosphore: 0.3, price: 3000,
      minIncl: 0, maxIncl: 0.40,
      lysine: 6.0, methionine: 1.2, fiber: 1, fat: 0.5,
    ),
    
    Ingredient(
      name: 'Protéines végétales concentrées',
      protein: 65, energy: 2500, calcium: 0.5, phosphore: 0.8, price: 1500,
      minIncl: 0, maxIncl: 0.30,
      lysine: 4.5, methionine: 1.0, fiber: 2, fat: 2,
    ),
    
    Ingredient(
      name: 'Levure de brasserie',
      protein: 45, energy: 2500, calcium: 0.4, phosphore: 1.0, price: 650,
      minIncl: 0, maxIncl: 0.10,
      lysine: 3.2, methionine: 0.8, fiber: 3, fat: 1.5,
    ),

    // ═══════════════════════════════════════════════════════════════
    // AUTRES
    // ═══════════════════════════════════════════════════════════════
    Ingredient(
      name: 'Graine de coton entière',
      protein: 22, energy: 5000, calcium: 0.2, phosphore: 0.3, price: 250,
      minIncl: 0, maxIncl: 0.15,
      lysine: 0.9, methionine: 0.4, fiber: 22, fat: 18,
    ),
    
    Ingredient(
      name: 'Lait en poudre',
      protein: 30, energy: 2500, calcium: 9, phosphore: 0.9, price: 1500,
      minIncl: 0, maxIncl: 0.30,
      lysine: 2.4, methionine: 0.8, fiber: 0, fat: 1,
    ),
    
    Ingredient(
      name: 'Légumes secs',
      protein: 22, energy: 3000, calcium: 0.2, phosphore: 0.4, price: 500,
      minIncl: 0, maxIncl: 0.20,
      lysine: 1.5, methionine: 0.3, fiber: 15, fat: 1.5,
    ),
    
    Ingredient(
      name: 'Substitut de lait',
      protein: 35, energy: 2500, calcium: 6, phosphore: 0.5, price: 1500,
      minIncl: 0.05, maxIncl: 0.40,
      lysine: 2.6, methionine: 0.9, fiber: 0, fat: 2,
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
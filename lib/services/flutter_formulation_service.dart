// lib/services/flutter_formulation_service.dart - VERSION CORRIGÉE ANTI-BOUCLE

import 'dart:math';
import '../models/ingredient.dart';
import '../models/nutritional_requirement.dart';
import '../models/feed_formula.dart';

/// Service de formulation d'aliments avec optimisation hiérarchique
/// Priorité 1: Protéines et Énergie (contraintes critiques)
/// Priorité 2: Autres nutriments (calcium, phosphore, etc.)
class FlutterFormulationService {
  

  /// Nutriments prioritaires (contraintes critiques)
  static const List<String> priorityNutrients = ['protein', 'energy'];
  
  /// Nutriments secondaires
  // static const List<String> secondaryNutrients = ['calcium', 'phosphore'];
  static const List<String> secondaryNutrients = ['calcium', 'phosphore', 'lysine', 'methionine', 'fiber', 'fat']; // ✅ MODIFIÉ

  /// ✅ COMPTEUR POUR ÉVITER LES BOUCLES INFINIES
  int _relaxationAttempts = 0;
  static const int maxRelaxationAttempts = 3;

  /// Fonction principale de formulation avec hiérarchie de contraintes
  FeedFormula formulate({
    required NutritionalRequirement requirement,
    required List<Ingredient> availableIngredients,
    int maxIterations = 2000,
    double tolerance = 0.015, // 1.5% de tolérance
    bool isRelaxationAttempt = false, // ✅ NOUVEAU FLAG
  }) {
    if (availableIngredients.isEmpty) {
      throw Exception('Aucun ingrédient disponible.');
    }

    // ✅ VALIDATION PRÉALABLE DES CONTRAINTES
    if (!isRelaxationAttempt) {
      _relaxationAttempts = 0; // Reset du compteur
      _validateConstraints(availableIngredients);
    }

    print('🚀 DÉMARRAGE FORMULATION');
    print('  Stade: ${requirement.animal} - ${requirement.stage}');
    print('  Ingrédients: ${availableIngredients.length}');

    // PHASE 1: Optimisation des nutriments critiques (Protéines + Énergie)
    print('\n📊 PHASE 1: Optimisation Protéines + Énergie');
    Map<String, double> phase1Mix = _optimizeCriticalNutrients(
      requirement: requirement,
      ingredients: availableIngredients,
      maxIterations: maxIterations,
      tolerance: tolerance,
    );

    // Vérifier si Phase 1 a réussi
    bool phase1Success = _validateCriticalNutrients(
      phase1Mix, 
      requirement, 
      availableIngredients,
      tolerance,
    );
    
    if (!phase1Success) {
      print('❌ Phase 1 échouée - Contraintes critiques non satisfaites');
      
      // ✅ PROTECTION CONTRE BOUCLE INFINIE
      if (_relaxationAttempts >= maxRelaxationAttempts) {
        print('⚠️ Nombre maximum de relaxations atteint ($maxRelaxationAttempts)');
        print('   Création d\'une formulation approximative...');
        return _createApproximation(requirement, availableIngredients);
      }
      
      return _formulateWithRelaxation(requirement, availableIngredients);
    }

    print('✅ Phase 1 réussie - Protéines/Énergie OK');

    // PHASE 2: Ajustement des nutriments secondaires
    print('\n📊 PHASE 2: Optimisation Calcium + Phosphore');
    Map<String, double> phase2Mix = _optimizeSecondaryNutrients(
      requirement: requirement,
      ingredients: availableIngredients,
      initialMix: phase1Mix,
      maxIterations: maxIterations ~/ 2,
      tolerance: tolerance * 1.5,
    );

    // Utiliser Phase 2 si elle améliore sans dégrader Phase 1
    Map<String, double> finalMix = phase2Mix;
    bool phase2DegradesCritical = !_validateCriticalNutrients(
      phase2Mix, 
      requirement, 
      availableIngredients,
      tolerance,
    );
    
    if (phase2DegradesCritical) {
      print('⚠️ Phase 2 dégrade les contraintes critiques - Utilisation Phase 1');
      finalMix = phase1Mix;
    } else {
      print('✅ Phase 2 réussie - Tous les nutriments optimisés');
    }

    // Normaliser et construire le résultat
    finalMix = _normalizeMix(finalMix);
    return _buildResult(finalMix, requirement, availableIngredients);
  }

  /// ✅ VALIDATION DES CONTRAINTES AVANT OPTIMISATION
  void _validateConstraints(List<Ingredient> ingredients) {
    if (ingredients.length < 2) {
      print('⚠️ ATTENTION : Seulement ${ingredients.length} ingrédient(s)');
      print('   Recommandation : Sélectionnez au moins 3-4 ingrédients');
    }

    double totalMin = 0.0;
    for (var ing in ingredients) {
      if (ing.minIncl != null && ing.minIncl! > 0) {
        totalMin += ing.minIncl!;
      }
    }
    
    if (totalMin > 1.0) {
      throw Exception(
        'ERREUR CONTRAINTES : Les minimums totalisent ${(totalMin * 100).toStringAsFixed(1)}% (max 100%)'
      );
    }

    if (totalMin > 0.95) {
      print('⚠️ Les minimums totalisent ${(totalMin * 100).toStringAsFixed(1)}%');
      print('   Peu de marge pour l\'optimisation');
    }
  }

  /// PHASE 1: Optimise uniquement protéines et énergie
  Map<String, double> _optimizeCriticalNutrients({
    required NutritionalRequirement requirement,
    required List<Ingredient> ingredients,
    required int maxIterations,
    required double tolerance,
  }) {
    // Initialisation équitable AVEC RESPECT DES CONTRAINTES MIN/MAX
    Map<String, double> mix = {};
    double totalMin = 0.0;
    
    // Calculer le total des minimums
    for (var ing in ingredients) {
      if (ing.minIncl != null && ing.minIncl! > 0) {
        totalMin += ing.minIncl!;
      }
    }
    
    // Espace disponible après les minimums
    double remainingSpace = max(0.0, 1.0 - totalMin);
    
    // Initialisation avec respect des contraintes
    for (var ing in ingredients) {
      if (ing.minIncl != null && ing.minIncl! > 0) {
        mix[ing.name] = ing.minIncl!;
      } else {
        double share = remainingSpace / ingredients.length;
        mix[ing.name] = share;
      }
      
      // S'assurer de ne pas dépasser le maximum
      if (ing.maxIncl != null && mix[ing.name]! > ing.maxIncl!) {
        mix[ing.name] = ing.maxIncl!;
      }
    }
    
    // Normaliser
    mix = _normalizeMix(mix);

    const double learningRate = 0.25;
    const double momentum = 0.1;
    Map<String, double> velocity = {};
    
    for (var ing in ingredients) {
      velocity[ing.name] = 0.0;
    }

    double bestError = double.infinity;
    Map<String, double>? bestMix;

    for (int step = 0; step < maxIterations; step++) {
      // Calculer les valeurs actuelles
      double totalProtein = _calculateNutrient(mix, ingredients, 'protein');
      double totalEnergy = _calculateNutrient(mix, ingredients, 'energy');

      // Erreurs relatives
      double errorProtein = (totalProtein - requirement.protein) / requirement.protein;
      double errorEnergy = (totalEnergy - requirement.energy) / requirement.energy;
      double totalError = errorProtein.abs() + errorEnergy.abs();

      // ✅ SAUVEGARDER LA MEILLEURE SOLUTION
      if (totalError < bestError) {
        bestError = totalError;
        bestMix = Map.from(mix);
      }

      // Vérifier convergence
      if (errorProtein.abs() < tolerance && errorEnergy.abs() < tolerance) {
        print('  ✅ Convergence atteinte en $step itérations');
        print('  Protéines: ${totalProtein.toStringAsFixed(1)}% (cible: ${requirement.protein}%)');
        print('  Énergie: ${totalEnergy.toStringAsFixed(0)} (cible: ${requirement.energy})');
        return mix;
      }

      // Ajustement avec momentum
      for (var ing in ingredients) {
        double adjustment = 0.0;

        if (errorProtein.abs() > 0.001) {
          double proteinContribution = ing.protein / requirement.protein;
          adjustment += learningRate * proteinContribution * (-errorProtein);
        }

        if (errorEnergy.abs() > 0.001) {
          double energyContribution = ing.energy / requirement.energy;
          adjustment += learningRate * energyContribution * (-errorEnergy);
        }

        velocity[ing.name] = momentum * velocity[ing.name]! + (1 - momentum) * adjustment;
        
        double newQuantity = mix[ing.name]! * (1 + velocity[ing.name]!);
        
        // ✅ RESPECTER MIN/MAX
        double minVal = ing.minIncl ?? 0.001;
        double maxVal = ing.maxIncl ?? 0.95;
        mix[ing.name] = newQuantity.clamp(minVal, maxVal);
      }

      mix = _normalizeMix(mix);
    }

    // ✅ RETOURNER LA MEILLEURE SOLUTION TROUVÉE
    print('  ⚠️ Convergence non atteinte - Utilisation meilleure solution (erreur: ${bestError.toStringAsFixed(4)})');
    return bestMix ?? mix;
  }

  /// PHASE 2: Optimise les nutriments secondaires
  Map<String, double> _optimizeSecondaryNutrients({
    required NutritionalRequirement requirement,
    required List<Ingredient> ingredients,
    required Map<String, double> initialMix,
    required int maxIterations,
    required double tolerance,
  }) {
    Map<String, double> mix = Map.from(initialMix);
    const double learningRate = 0.15;
    
    for (int step = 0; step < maxIterations; step++) {
      double totalProtein = _calculateNutrient(mix, ingredients, 'protein');
      double totalEnergy = _calculateNutrient(mix, ingredients, 'energy');
      double totalCalcium = _calculateNutrient(mix, ingredients, 'calcium');
      double totalPhosphore = _calculateNutrient(mix, ingredients, 'phosphore');

      double errorProtein = (totalProtein - requirement.protein) / requirement.protein;
      double errorEnergy = (totalEnergy - requirement.energy) / requirement.energy;
      double errorCalcium = (totalCalcium - requirement.calcium) / requirement.calcium;
      double errorPhosphore = (totalPhosphore - requirement.phosphore) / requirement.phosphore;

      if (errorProtein.abs() < tolerance && 
          errorEnergy.abs() < tolerance &&
          errorCalcium.abs() < tolerance * 1.5 && 
          errorPhosphore.abs() < tolerance * 1.5) {
        print('  ✅ Convergence complète en $step itérations');
        break;
      }

      for (var ing in ingredients) {
        double adjustment = 0.0;

        if (errorProtein.abs() > tolerance) {
          adjustment += 2.0 * learningRate * (ing.protein / requirement.protein) * (-errorProtein);
        }
        if (errorEnergy.abs() > tolerance) {
          adjustment += 2.0 * learningRate * (ing.energy / requirement.energy) * (-errorEnergy);
        }
        if (errorCalcium.abs() > tolerance * 1.5) {
          adjustment += learningRate * (ing.calcium! / requirement.calcium) * (-errorCalcium);
        }
        if (errorPhosphore.abs() > tolerance * 1.5) {
          adjustment += learningRate * (ing.phosphore! / requirement.phosphore) * (-errorPhosphore);
        }

        double newQuantity = mix[ing.name]! * (1 + adjustment);
        double minVal = ing.minIncl ?? 0.001;
        double maxVal = ing.maxIncl ?? 0.95;
        mix[ing.name] = newQuantity.clamp(minVal, maxVal);
      }

      mix = _normalizeMix(mix);
    }

    return mix;
  }

  /// Valide que les nutriments critiques sont dans les bornes
  bool _validateCriticalNutrients(
    Map<String, double> mix,
    NutritionalRequirement requirement,
    List<Ingredient> ingredients,
    double tolerance,
  ) {
    double totalProtein = _calculateNutrient(mix, ingredients, 'protein');
    double totalEnergy = _calculateNutrient(mix, ingredients, 'energy');

    double criticalTolerance = max(tolerance * 3, 0.10); // Min 10%

    bool proteinOk = (totalProtein >= requirement.protein * (1 - criticalTolerance)) &&
                     (totalProtein <= requirement.protein * (1 + criticalTolerance));
    
    bool energyOk = (totalEnergy >= requirement.energy * (1 - criticalTolerance)) &&
                    (totalEnergy <= requirement.energy * (1 + criticalTolerance));

    return proteinOk && energyOk;
  }

  /// ✅ Formulation avec relaxation progressive (AVEC PROTECTION)
  FeedFormula _formulateWithRelaxation(
    NutritionalRequirement requirement,
    List<Ingredient> ingredients,
  ) {
    _relaxationAttempts++;
    
    print('🔄 FORMULATION AVEC RELAXATION (Tentative $_relaxationAttempts/$maxRelaxationAttempts)');
    
    // Tolérance progressive
    double newTolerance = 0.015 * pow(2, _relaxationAttempts).toDouble();
    print('   Nouvelle tolérance: ${(newTolerance * 100).toStringAsFixed(1)}%');

    try {
      return formulate(
        requirement: requirement,
        availableIngredients: ingredients,
        maxIterations: 3000,
        tolerance: newTolerance,
        isRelaxationAttempt: true, // ✅ FLAG POUR ÉVITER RESET
      );
    } catch (e) {
      print('❌ Échec relaxation: $e');
      return _createApproximation(requirement, ingredients);
    }
  }

  /// ✅ Crée une approximation basique
  FeedFormula _createApproximation(
    NutritionalRequirement requirement,
    List<Ingredient> ingredients,
  ) {
    print('⚠️ CRÉATION APPROXIMATION SIMPLIFIÉE');
    
    Map<String, double> mix = {};
    
    // Respecter les minimums
    double totalMin = 0.0;
    for (var ing in ingredients) {
      double minVal = ing.minIncl ?? 0.0;
      mix[ing.name] = minVal;
      totalMin += minVal;
    }
    
    // Distribuer l'espace restant
    double remaining = max(0.0, 1.0 - totalMin);
    if (remaining > 0) {
      double share = remaining / ingredients.length;
      for (var ing in ingredients) {
        double maxVal = ing.maxIncl ?? 1.0;
        mix[ing.name] = min(mix[ing.name]! + share, maxVal);
      }
    }

    mix = _normalizeMix(mix);
    return _buildResult(mix, requirement, ingredients);
  }

  /// Calcule la valeur d'un nutriment
  // double _calculateNutrient(
  //   Map<String, double> mix,
  //   List<Ingredient> ingredients,
  //   String nutrient,
  // ) {
  //   double total = 0.0;
  //   for (var ing in ingredients) {
  //     double proportion = mix[ing.name] ?? 0.0;
  //     double? value = 0.0;

  //     switch (nutrient) {
  //       case 'protein':
  //         value = ing.protein;
  //         break;
  //       case 'energy':
  //         value = ing.energy;
  //         break;
  //       case 'calcium':
  //         value = ing.calcium;
  //         break;
  //       case 'phosphore':
  //         value = ing.phosphore;
  //         break;
  //     }

  //     total += proportion * value!;
  //   }
  //   return total;
  // }








/// Calcule la valeur d'un nutriment
double _calculateNutrient(
  Map<String, double> mix,
  List<Ingredient> ingredients,
  String nutrient,
) {
  double total = 0.0;
  for (var ing in ingredients) {
    double proportion = mix[ing.name] ?? 0.0;
    double? value = 0.0;

    switch (nutrient) {
      case 'protein':
        value = ing.protein;
        break;
      case 'energy':
        value = ing.energy;
        break;
      case 'calcium':
        value = ing.calcium;
        break;
      case 'phosphore':
        value = ing.phosphore;
        break;
      case 'lysine':        // ✅ AJOUT
        value = ing.lysine;
        break;
      case 'methionine':    // ✅ AJOUT
        value = ing.methionine;
        break;
      case 'fiber':         // ✅ AJOUT
        value = ing.fiber;
        break;
      case 'fat':           // ✅ AJOUT
        value = ing.fat;
        break;
    }

    total += proportion * (value ?? 0.0); // ✅ Gérer les nullables
  }
  return total;
}



  /// Normalise le mix pour que la somme = 1
  Map<String, double> _normalizeMix(Map<String, double> mix) {
    double total = mix.values.fold(0.0, (sum, val) => sum + val);
    if (total == 0 || total == 1.0) return mix;

    Map<String, double> normalized = {};
    for (var entry in mix.entries) {
      normalized[entry.key] = entry.value / total;
    }
    return normalized;
  }











  // /// Construit le résultat final
  // FeedFormula _buildResult(
  //   Map<String, double> mix,
  //   NutritionalRequirement requirement,
  //   List<Ingredient> ingredients,
  // ) {
  //   List<Ingredient> formulatedIngredients = [];
    
  //   for (var entry in mix.entries) {
  //     if (entry.value < 0.001) continue; // Ignorer quantités négligeables
      
  //     var originalIng = ingredients.firstWhere((ing) => ing.name == entry.key);
  //     formulatedIngredients.add(
  //       Ingredient(
  //         name: originalIng.name,
  //         protein: originalIng.protein,
  //         energy: originalIng.energy,
  //         calcium: originalIng.calcium,
  //         phosphore: originalIng.phosphore,
  //         price: originalIng.price,
  //         quantity: entry.value,
  //         minIncl: originalIng.minIncl,
  //         maxIncl: originalIng.maxIncl,
  //       ),
  //     );
  //   }

  //   double totalProtein = _calculateNutrient(mix, ingredients, 'protein');
  //   double totalEnergy = _calculateNutrient(mix, ingredients, 'energy');
  //   double totalCalcium = _calculateNutrient(mix, ingredients, 'calcium');
  //   double totalPhosphore = _calculateNutrient(mix, ingredients, 'phosphore');

  //   print('\n📊 RÉSULTATS FINAUX:');
  //   print('  Protéines: ${totalProtein.toStringAsFixed(1)}% (requis: ${requirement.protein}%)');
  //   print('  Énergie: ${totalEnergy.toStringAsFixed(0)} (requis: ${requirement.energy})');
  //   print('  Calcium: ${totalCalcium.toStringAsFixed(2)}% (requis: ${requirement.calcium}%)');
  //   print('  Phosphore: ${totalPhosphore.toStringAsFixed(2)}% (requis: ${requirement.phosphore}%)');

  //   return FeedFormula(
  //     animal: requirement.animal,
  //     stage: requirement.stage,
  //     ingredients: formulatedIngredients,
  //     totalProtein: totalProtein,
  //     totalEnergy: totalEnergy,
  //     totalCalcium: totalCalcium,
  //     totalPhosphore: totalPhosphore,
  //   );
  // }






/// Construit le résultat final
FeedFormula _buildResult(
  Map<String, double> mix,
  NutritionalRequirement requirement,
  List<Ingredient> ingredients,
) {
  List<Ingredient> formulatedIngredients = [];
  
  for (var entry in mix.entries) {
    if (entry.value < 0.001) continue;
    
    var originalIng = ingredients.firstWhere((ing) => ing.name == entry.key);
    formulatedIngredients.add(
      Ingredient(
        name: originalIng.name,
        protein: originalIng.protein,
        energy: originalIng.energy,
        calcium: originalIng.calcium,
        phosphore: originalIng.phosphore,
        price: originalIng.price,
        quantity: entry.value,
        minIncl: originalIng.minIncl,
        maxIncl: originalIng.maxIncl,
        lysine: originalIng.lysine,           // ✅ AJOUT
        methionine: originalIng.methionine,   // ✅ AJOUT
        fiber: originalIng.fiber,             // ✅ AJOUT
        fat: originalIng.fat,                 // ✅ AJOUT
      ),
    );
  }

  double totalProtein = _calculateNutrient(mix, ingredients, 'protein');
  double totalEnergy = _calculateNutrient(mix, ingredients, 'energy');
  double totalCalcium = _calculateNutrient(mix, ingredients, 'calcium');
  double totalPhosphore = _calculateNutrient(mix, ingredients, 'phosphore');
  double totalLysine = _calculateNutrient(mix, ingredients, 'lysine');         // ✅ AJOUT
  double totalMethionine = _calculateNutrient(mix, ingredients, 'methionine'); // ✅ AJOUT
  double totalFiber = _calculateNutrient(mix, ingredients, 'fiber');           // ✅ AJOUT
  double totalFat = _calculateNutrient(mix, ingredients, 'fat');               // ✅ AJOUT

  print('\n📊 RÉSULTATS FINAUX:');
  print('  Protéines: ${totalProtein.toStringAsFixed(1)}% (requis: ${requirement.protein}%)');
  print('  Énergie: ${totalEnergy.toStringAsFixed(0)} (requis: ${requirement.energy})');
  print('  Calcium: ${totalCalcium.toStringAsFixed(2)}% (requis: ${requirement.calcium}%)');
  print('  Phosphore: ${totalPhosphore.toStringAsFixed(2)}% (requis: ${requirement.phosphore}%)');
  print('  Lysine: ${totalLysine.toStringAsFixed(2)}% (requis: ${requirement.lysine}%)');           // ✅ AJOUT
  print('  Méthionine: ${totalMethionine.toStringAsFixed(2)}% (requis: ${requirement.methionine}%)'); // ✅ AJOUT
  print('  Fibres: ${totalFiber.toStringAsFixed(2)}% (requis: ${requirement.fiber}%)');             // ✅ AJOUT
  print('  Matières grasses: ${totalFat.toStringAsFixed(2)}% (requis: ${requirement.fat}%)');      // ✅ AJOUT

  return FeedFormula(
    animal: requirement.animal,
    stage: requirement.stage,
    ingredients: formulatedIngredients,
    totalProtein: totalProtein,
    totalEnergy: totalEnergy,
    totalCalcium: totalCalcium,
    totalPhosphore: totalPhosphore,
    totalLysine: totalLysine,           // ✅ AJOUT
    totalMethionine: totalMethionine,   // ✅ AJOUT
    totalFiber: totalFiber,             // ✅ AJOUT
    totalFat: totalFat,                 // ✅ AJOUT
  );
}










}
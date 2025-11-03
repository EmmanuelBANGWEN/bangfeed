
// lib/services/feedformulationservice.dart - VERSION AMÉLIORÉE

import '../models/ingredient.dart';
import '../models/nutritional_requirement.dart';
import '../models/feed_formula.dart';
import 'flutter_formulation_service.dart';

class FeedFormulationService {
  final FlutterFormulationService _advancedService = FlutterFormulationService();

  /// Fonction principale de formulation
  FeedFormula formulate({
    required NutritionalRequirement requirement,
    required List<Ingredient> availableIngredients,
  }) {
    if (availableIngredients.isEmpty) {
      throw Exception('Aucun ingrédient disponible.');
    }

    print('\n═══════════════════════════════════════════════');
    print('🚀 DÉMARRAGE FORMULATION AVANCÉE');
    print('═══════════════════════════════════════════════');
    print('Animal: ${requirement.animal}');
    print('Stade: ${requirement.stage}');
    print('Ingrédients disponibles: ${availableIngredients.length}');
    print('');

    // Utiliser le service avancé avec optimisation hiérarchique
    final result = _advancedService.formulate(
      requirement: requirement,
      availableIngredients: availableIngredients,
      maxIterations: 2000,
      tolerance: 0.015, // 1.5% de tolérance
    );

    print('\n═══════════════════════════════════════════════');
    print('✅ FORMULATION TERMINÉE');
    print('═══════════════════════════════════════════════\n');

    return result;
  }
}
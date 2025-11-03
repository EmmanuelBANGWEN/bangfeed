import 'package:bangfeed/models/nutritional_requirement.dart';

class NutritionalRequirementsData {
  static final List<NutritionalRequirement> all = [
    // 🐖 Porc
    NutritionalRequirement(
      animal: "Porc",
      stage: "Porcelet",
      protein: 20,
      energy: 3200,
      calcium: 0.9,
      phosphore: 0.6,
    ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Croissance",
      protein: 18,
      energy: 3100,
      calcium: 0.8,
      phosphore: 0.5,
    ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Truie gestante",
      protein: 16,
      energy: 2900,
      calcium: 1.0,
      phosphore: 0.6,
    ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Truie allaitante",
      protein: 18.5,
      energy: 3200,
      calcium: 1.1,
      phosphore: 0.8,
    ),

    // 🐔 Poulet de chair
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Démarrage (semaine 1)",
      protein: 22,
      energy: 3000,
      calcium: 1.0,
      phosphore: 0.5,
    ),
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Croissance (semaine 2-3)",
      protein: 20,
      energy: 3100,
      calcium: 0.9,
      phosphore: 0.45,
    ),
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Finition (semaine 4+)",
      protein: 18,
      energy: 3200,
      calcium: 0.8,
      phosphore: 0.4,
    ),
  ];

  // Fonction utilitaire pour retrouver un besoin précis
  static NutritionalRequirement? getRequirement(String animal, String stage) {
    try {
      return all.firstWhere(
        (r) => r.animal == animal && r.stage == stage,
      );
    } catch (_) {
      return null;
    }
  }
}

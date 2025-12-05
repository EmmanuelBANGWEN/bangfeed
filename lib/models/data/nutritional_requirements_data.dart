// import 'package:bangfeed/models/nutritional_requirement.dart';

// class NutritionalRequirementsData {
//   static final List<NutritionalRequirement> all = [
//     // 🐖 Porc
//     NutritionalRequirement(
//       animal: "Porc",
//       stage: "Porcelet",
//       protein: 20,
//       energy: 3200,
//       calcium: 0.9,
//       phosphore: 0.6,
//     ),
//     NutritionalRequirement(
//       animal: "Porc",
//       stage: "Croissance",
//       protein: 18,
//       energy: 3100,
//       calcium: 0.8,
//       phosphore: 0.5,
//     ),
//     NutritionalRequirement(
//       animal: "Porc",
//       stage: "Truie gestante",
//       protein: 16,
//       energy: 2900,
//       calcium: 1.0,
//       phosphore: 0.6,
//     ),
//     NutritionalRequirement(
//       animal: "Porc",
//       stage: "Truie allaitante",
//       protein: 18.5,
//       energy: 3200,
//       calcium: 1.1,
//       phosphore: 0.8,
//     ),

//     // 🐔 Poulet de chair
//     NutritionalRequirement(
//       animal: "Poulet de chair",
//       stage: "Démarrage (semaine 1)",
//       protein: 22,
//       energy: 3000,
//       calcium: 1.0,
//       phosphore: 0.5,
//     ),
//     NutritionalRequirement(
//       animal: "Poulet de chair",
//       stage: "Croissance (semaine 2-3)",
//       protein: 20,
//       energy: 3100,
//       calcium: 0.9,
//       phosphore: 0.45,
//     ),
//     NutritionalRequirement(
//       animal: "Poulet de chair",
//       stage: "Finition (semaine 4+)",
//       protein: 18,
//       energy: 3200,
//       calcium: 0.8,
//       phosphore: 0.4,
//     ),



//     // 🥚 Poule pondeuse
//     NutritionalRequirement(
//       animal: "Poule pondeuse",
//       stage: "Démarrage (0-6 semaines)",
//       protein: 18,
//       energy: 2800,
//       calcium: 1.0,
//       phosphore: 0.5,
//     ),
//     NutritionalRequirement(
//       animal: "Poule pondeuse",
//       stage: "Croissance (7-18 semaines)",
//       protein: 16,
//       energy: 2700,
//       calcium: 0.9,
//       phosphore: 0.45,
//     ),
//     NutritionalRequirement(
//       animal: "Poule pondeuse",
//       stage: "Ponte",
//       protein: 17,
//       energy: 2700,
//       calcium: 3.8,
//       phosphore: 0.45,
//     ),



//     // 🐟 Poisson silure
//     NutritionalRequirement(
//       animal: "Poisson silure",
//       stage: "Alevin",
//       protein: 42,
//       energy: 2800,
//       calcium: 1.2,
//       phosphore: 0.8,
//     ),
//     NutritionalRequirement(
//       animal: "Poisson silure",
//       stage: "Juvenile",
//       protein: 35,
//       energy: 2900,
//       calcium: 1.0,
//       phosphore: 0.7,
//     ),
//     NutritionalRequirement(
//       animal: "Poisson silure",
//       stage: "Grossissement",
//       protein: 30,
//       energy: 3000,
//       calcium: 0.9,
//       phosphore: 0.6,
//     ),






    
//   ];

//   // Fonction utilitaire pour retrouver un besoin précis
//   static NutritionalRequirement? getRequirement(String animal, String stage) {
//     try {
//       return all.firstWhere(
//         (r) => r.animal == animal && r.stage == stage,
//       );
//     } catch (_) {
//       return null;
//     }
//   }
// }



import 'package:bangfeed/models/nutritional_requirement.dart';

class NutritionalRequirementsData {
  static final List<NutritionalRequirement> all = [
    // 🐖 Porc (valeurs alignées sur NRC 2012 et études récentes sur la lysine)
    NutritionalRequirement(
      animal: "Porc",
      stage: "Porcelet",
      protein: 20.0,        // % de protéine brute
      energy: 3300.0,       // kcal/kg (valeur pratique pour starter)
      calcium: 0.9,         // %
      phosphore: 0.6,       // %
      lysine: 1.30,         // % (≈ 13 g/kg ; starter piglet)
      methionine: 0.45,     // %
      fiber: 3.5,           // % fibres brutes (faible pour starter)
      fat: 5.0,             // % matière grasse
    ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Croissance",
      protein: 18.0,
      energy: 3200.0,
      calcium: 0.8,
      phosphore: 0.5,
      lysine: 1.00,         // % (≈ 10 g/kg pour croissance)
      methionine: 0.35,
      fiber: 4.0,
      fat: 4.0,
    ),
    // NutritionalRequirement(
    //   animal: "Porc",
    //   stage: "Finisher",
    //   protein: 16.5,
    //   energy: 3100.0,
    //   calcium: 0.75,
    //   phosphore: 0.45,
    //   lysine: 0.85,         // % (valeur courante pour finisher)
    //   methionine: 0.30,
    //   fiber: 4.5,
    //   fat: 3.5,
    // ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Truie gestante",
      protein: 16.0,
      energy: 2900.0,
      calcium: 1.00,
      phosphore: 0.60,
      // études montrent des SID Lys autour de 0.44-0.58% selon phase (mid/late gestation).
      // ici on met une valeur pratique moyenne : 0.50%
      lysine: 0.50,
      methionine: 0.25,
      fiber: 6.0,
      fat: 3.0,
    ),
    NutritionalRequirement(
      animal: "Porc",
      stage: "Truie allaitante",
      protein: 18.5,
      energy: 3300.0,
      calcium: 1.10,
      phosphore: 0.80,
      // la lactation demande lysine plus élevée ; études et guides techniques indiquent ~0.9-1.2%
      lysine: 1.10,
      methionine: 0.50,
      fiber: 6.0,
      fat: 6.0,
    ),

    // 🐔 Poulet de chair (valeurs indicatives ; si tu veux j'approfondis)
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Démarrage (semaine 1)",
      protein: 22.0,
      energy: 3000.0,
      calcium: 1.0,
      phosphore: 0.5,
      lysine: 1.30,
      methionine: 0.50,
      fiber: 3.0,
      fat: 5.0,
    ),
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Croissance (semaine 2-3)",
      protein: 20.0,
      energy: 3100.0,
      calcium: 0.9,
      phosphore: 0.45,
      lysine: 1.15,
      methionine: 0.45,
      fiber: 3.0,
      fat: 5.0,
    ),
    NutritionalRequirement(
      animal: "Poulet de chair",
      stage: "Finition (semaine 4+)",
      protein: 18.0,
      energy: 3200.0,
      calcium: 0.8,
      phosphore: 0.40,
      lysine: 1.00,
      methionine: 0.40,
      fiber: 3.0,
      fat: 5.0,
    ),

    // 🥚 Poule pondeuse (valeurs indicatives)
    NutritionalRequirement(
      animal: "Poule pondeuse",
      stage: "Démarrage (0-6 semaines)",
      protein: 18.0,
      energy: 2800.0,
      calcium: 1.0,
      phosphore: 0.5,
      lysine: 0.80,
      methionine: 0.35,
      fiber: 3.5,
      fat: 3.0,
    ),
    NutritionalRequirement(
      animal: "Poule pondeuse",
      stage: "Croissance (7-18 semaines)",
      protein: 16.0,
      energy: 2700.0,
      calcium: 0.9,
      phosphore: 0.45,
      lysine: 0.75,
      methionine: 0.33,
      fiber: 3.5,
      fat: 3.0,
    ),
    NutritionalRequirement(
      animal: "Poule pondeuse",
      stage: "Ponte",
      protein: 17.0,
      energy: 2700.0,
      calcium: 3.8,     // élevé pour formation coquille
      phosphore: 0.45,
      lysine: 0.70,
      methionine: 0.30,
      fiber: 3.5,
      fat: 3.0,
    ),

    // 🐟 Poisson silure (valeurs indicatives ; pour poissons on parle souvent en protéine élevée)
    NutritionalRequirement(
      animal: "Poisson silure",
      stage: "Alevin",
      protein: 42.0,
      energy: 2800.0,
      calcium: 1.2,
      phosphore: 0.8,
      lysine: 3.50,   // en % (valeur approximative pour formulation aquacole)
      methionine: 1.10,
      fiber: 2.0,
      fat: 8.0,
    ),
    NutritionalRequirement(
      animal: "Poisson silure",
      stage: "Juvenile",
      protein: 35.0,
      energy: 2900.0,
      calcium: 1.0,
      phosphore: 0.7,
      lysine: 3.00,
      methionine: 0.95,
      fiber: 2.5,
      fat: 7.0,
    ),
    NutritionalRequirement(
      animal: "Poisson silure",
      stage: "Grossissement",
      protein: 30.0,
      energy: 3000.0,
      calcium: 0.9,
      phosphore: 0.6,
      lysine: 2.50,
      methionine: 0.80,
      fiber: 3.0,
      fat: 6.5,
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

import 'package:flutter/material.dart';

class ConseilsPage extends StatefulWidget {
  const ConseilsPage({super.key});

  @override
  State<ConseilsPage> createState() => _ConseilsPageState();
}







class _ConseilsPageState extends State<ConseilsPage> {



String _selectedCategory = 'Tous';

final List<String> _categories = [
  'Tous',
  'Porcs',
  'Poulet de chair',
  'Poules pondeuses',
  'Poissons',
  'Chèvres',
  'Moutons',
  'Boeufs',
  'Lapins',
];



// final List<ConseilNutrition> _conseils = [







//   // ----------------------------------------------------------
//   // PORCS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Alimentation des porcelets après sevrage',
//     categorie: 'Porcs',
//     description: 'Une bonne transition alimentaire évite la diarrhée post-sevrage.',
//     icon: Icons.pets,
//     color: Color(0xFFEA580C),
//     details: [
//       'Introduire progressivement l’aliment post-sevrage sur 7 jours',
//       'Protéines 18–20% et énergie digestible élevée',
//       'Ajouter levures ou probiotiques pour stabiliser la flore digestive',
//       'Éviter les variations brusques d’aliments',
//     ],
//     astuce: 'Faire 5–6 petits repas/jour pour réduire le stress et améliorer la croissance.',
//   ),
//   ConseilNutrition(
//     titre: 'Nutrition des truies gestantes',
//     categorie: 'Porcs',
//     description: 'Une bonne alimentation garantit des portées nombreuses et vigoureuses.',
//     icon: Icons.pregnant_woman,
//     color: Color(0xFFEA580C),
//     details: [
//       'Phase 1 : 2–2.5 kg/j d’aliment gestation',
//       'Phase 2 : 3 kg/j en fin de gestation',
//       'Fibres : 12–18% pour éviter la constipation',
//       'Éviter le surpoids (difficultés de mise bas)',
//     ],
//     astuce: 'Augmenter légèrement l’aliment 7–10 jours avant la mise bas.',
//   ),






















//   // ----------------------------------------------------------
//   // POULET DE CHAIR
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Démarrage des poussins de chair',
//     categorie: 'Poulet de chair',
//     description: 'Les 14 premiers jours déterminent 70% du potentiel de croissance.',
//     icon: Icons.egg,
//     color: Color(0xFFFB923C),
//     details: [
//       'Aliment starter : protéines 22–24%',
//       'Température : 32–35°C la 1ère semaine',
//       'Éclairage 23h/24 les 3 premiers jours',
//       'Eau propre + électrolytes pour réduire le stress',
//     ],
//     astuce: 'Mettre le son de blé ou le maïs concassé très fin pour encourager à manger.',
//   ),
//   ConseilNutrition(
//     titre: 'Croissance rapide et saine',
//     categorie: 'Poulet de chair',
//     description: 'Optimiser l’aliment permet de réduire le coût de production.',
//     icon: Icons.local_dining,
//     color: Color(0xFFFB923C),
//     details: [
//       'Aliment croissance : 20–21% protéines',
//       'Bonne ventilation pour éviter le stress thermique',
//       'Litière sèche pour prévenir les maladies',
//       'Éviter la suralimentation (risque de mortalité)',
//     ],
//     astuce: 'Ajouter des feuilles de papaye ou moringa séchées comme source naturelle de vitamines.',
//   ),








































//   // ----------------------------------------------------------
//   // POULES PONDEUSES
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Production optimale d’œufs',
//     categorie: 'Poules pondeuses',
//     description: 'L’aliment influence directement la ponte et la qualité des coquilles.',
//     icon: Icons.egg_alt,
//     color: Color(0xFFFFB648),
//     details: [
//       'Protéines : 16–18%',
//       'Calcium : 3.5–4%',
//       'Lumière : 14–16 h/jour',
//       'Eau propre : 200–250 ml/j',
//     ],
//     astuce: 'Distribuer le calcium (coquilles d’huîtres) en soirée pour renforcer la coquille.',
//   ),
//   ConseilNutrition(
//     titre: 'Gestion de la chaleur chez les pondeuses',
//     categorie: 'Poules pondeuses',
//     description: 'Les fortes chaleurs réduisent jusqu’à 40% la ponte.',
//     icon: Icons.heat_pump,
//     color: Color(0xFFFFB648),
//     details: [
//       'Ajouter du bicarbonate dans l’eau (1 càc/L)',
//       'Ventilation + ombrage dans les bâtiments',
//       'Éviter de nourrir aux heures chaudes',
//     ],
//     astuce: 'Augmenter légèrement la vitamine C pendant les périodes chaudes.',
//   ),








































//   // ----------------------------------------------------------
//   // POISSONS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Alimentation des poissons en étang',
//     categorie: 'Poissons',
//     description: 'Une bonne nutrition garantit une croissance rapide.',
//     icon: Icons.water,
//     color: Color(0xFF38BDF8),
//     details: [
//       'Protéines : 28–32% pour poissons juvéniles',
//       'Granulométrie adaptée selon l’âge',
//       '2–3 repas/jour',
//     ],
//     astuce: 'Ajouter azolla, moringa ou son de riz pour réduire le coût alimentaire.',
//   ),
//   ConseilNutrition(
//     titre: 'Qualité de l’eau et nutrition',
//     categorie: 'Poissons',
//     description: 'La qualité de l’eau influence directement l’appétit.',
//     icon: Icons.opacity,
//     color: Color(0xFF38BDF8),
//     details: [
//       'Oxygénation régulière',
//       'pH optimal entre 6.5 et 8.5',
//       'Éviter de nourrir quand l’eau est trouble',
//     ],
//     astuce: 'Utiliser des probiotiques naturels (levure, EM) pour clarifier l’eau.',
//   ),











































//   // ----------------------------------------------------------
//   // CHÈVRES
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Alimentation des chèvres laitières',
//     categorie: 'Chèvres',
//     description: 'Une bonne alimentation améliore la production laitière.',
//     icon: Icons.pets,
//     color: Color(0xFFD97706),
//     details: [
//       'Fourrages riches : luzerne, foin de qualité',
//       'Concentrés : 300–500g/jour selon production',
//       'Minéraux essentiels : calcium, zinc, sélénium',
//     ],
//     astuce: 'Introduire progressivement les nouveaux aliments pour éviter les ballonnements.',
//   ),
//   ConseilNutrition(
//     titre: 'Gestion de pâturage pour chèvres',
//     categorie: 'Chèvres',
//     description: 'Le pâturage influence la santé et la reproduction.',
//     icon: Icons.forest,
//     color: Color(0xFFD97706),
//     details: [
//       'Rotation des zones pour éviter la surcharge',
//       'Éviter les herbes trop mouillées (risque parasitaire)',
//     ],
//     astuce: 'Le moringa est un excellent complément riche en protéines.',
//   ),






















































//   // ----------------------------------------------------------
//   // MOUTONS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Nutrition des béliers et brebis',
//     categorie: 'Moutons',
//     description: 'Les moutons ont besoin d’un équilibre fibres–énergie.',
//     icon: Icons.ramen_dining,
//     color: Color(0xFFEA580C),
//     details: [
//       'Fourrage : 60–70% de la ration',
//       'Compléments : son, maïs, tourteaux',
//       'Eau propre en permanence',
//     ],
//     astuce: 'Les blocs multinutritionnels sont très utiles en saison sèche.',
//   ),
//   ConseilNutrition(
//     titre: 'Nutrition des agneaux',
//     categorie: 'Moutons',
//     description: 'Une bonne croissance assure une meilleure valeur marchande.',
//     icon: Icons.child_care,
//     color: Color(0xFFEA580C),
//     details: [
//       'Accès au lait jusqu’à 8 semaines',
//       'Introduire un aliment starter riche en protéines',
//     ],
//     astuce: 'Le foin de légumineuses stimule la prise de poids.',
//   ),











































//   // ----------------------------------------------------------
//   // BOEUFS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Nutrition des bovins à l’engraissement',
//     categorie: 'Boeufs',
//     description: 'Objectif : croissance rapide et carcasse de qualité.',
//     icon: Icons.agriculture,
//     color: Color(0xFF4B2E2A),
//     details: [
//       'Ration riche en énergie (maïs, manioc, drêches)',
//       'Fibres : 15–20%',
//       'Eau : 40–60 L/jour',
//     ],
//     astuce: 'Ajouter du sel et bloc minéral pour stimuler l’appétit.',
//   ),
//   ConseilNutrition(
//     titre: 'Gestion alimentaire en saison sèche',
//     categorie: 'Boeufs',
//     description: 'La baisse de qualité des pâturages réduit la croissance.',
//     icon: Icons.grass,
//     color: Color(0xFF4B2E2A),
//     details: [
//       'Utiliser les résidus agricoles (son, fanes, tiges)',
//       'Introduire l’urée-mélasse pour compenser les carences',
//     ],
//     astuce: 'Ensiler le maïs ou sorgho pendant la saison pluvieuse.',
//   ),



































//   // ----------------------------------------------------------
//   // LAPINS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Alimentation des lapins en croissance',
//     categorie: 'Lapins',
//     description: 'Le système digestif du lapin est très sensible.',
//     icon: Icons.cruelty_free,
//     color: Color(0xFF059669),
//     details: [
//       'Granulés 16–18% protéines',
//       'Foin abondant pour éviter les diarrhées',
//     ],
//     astuce: 'Donner des feuilles de patate douce comme fibre naturelle.',
//   ),
//   ConseilNutrition(
//     titre: 'Reproduction des lapines',
//     categorie: 'Lapins',
//     description: 'Une bonne nutrition garantit de grandes portées.',
//     icon: Icons.favorite,
//     color: Color(0xFF059669),
//     details: [
//       'Aliment enrichi en énergie',
//       'Vitamine E et sélénium pour la fertilité',
//     ],
//     astuce: 'Ajouter un peu de luzerne pour stimuler la lactation.',
//   ),

//   // ----------------------------------------------------------
//   // CONSEILS GENERAUX - TOUS
//   // ----------------------------------------------------------
//   ConseilNutrition(
//     titre: 'Qualité de l’eau,
//     categorie: 'Tous',
//     description: 'L’eau représente plus de 60% des performances.',
//     icon: Icons.water_drop,
//     color: Color(0xFF0EA5E9),
//     details: [
//       'Eau fraîche et propre en permanence',
//       'Nettoyer les abreuvoirs chaque jour',
//     ],
//     astuce: 'Une baisse de consommation d’eau = premier signe de maladie.',
//   ),
//   ConseilNutrition(
//     titre: 'Compléments minéraux et vitaminiques',
//     categorie: 'Tous',
//     description: 'Indispensables pour la croissance et l’immunité.',
//     icon: Icons.science,
//     color: Color(0xFF8B5CF6),
//     details: [
//       'Calcium, phosphore, sodium, zinc, sélénium',
//       'Vitamine A, D, E essentielle pour la reproduction',
//     ],
//     astuce: 'Utiliser un CMV adapté à chaque espèce.',
//   ),
// ];















// 📍 REMPLACE la liste _conseils complète (ligne ~60-250) par celle-ci :

final List<ConseilNutrition> _conseils = [
  // ========================================
  // PORCS - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Alimentation des porcelets après sevrage',
    categorie: 'Porcs',
    description: 'Une bonne transition alimentaire évite la diarrhée post-sevrage.',
    icon: Icons.pets,
    color: Color(0xFFEA580C),
    details: [
      'Introduire progressivement laliment post-sevrage sur 7 jours',
      'Protéines 18–20% et énergie digestible élevée',
      'Ajouter levures ou probiotiques pour stabiliser la flore digestive',
      'Éviter les variations brusques daliments',
      'Température ambiante : 28-30°C pour réduire le stress',
    ],
    astuce: 'Faire 5–6 petits repas/jour pour réduire le stress et améliorer la croissance.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des truies gestantes',
    categorie: 'Porcs',
    description: 'Une bonne alimentation garantit des portées nombreuses et vigoureuses.',
    icon: Icons.pregnant_woman,
    color: Color(0xFFEA580C),
    details: [
      'Phase 1 : 2–2.5 kg/j daliment gestation',
      'Phase 2 : 3 kg/j en fin de gestation',
      'Fibres : 12–18% pour éviter la constipation',
      'Éviter le surpoids (difficultés de mise bas)',
      'Calcium : 0.75-0.9% pour la formation osseuse des porcelets',
    ],
    astuce: 'Augmenter légèrement laliment 7–10 jours avant la mise bas.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation des porcs en croissance',
    categorie: 'Porcs',
    description: 'Optimiser la croissance de 20 à 60 kg.',
    icon: Icons.trending_up,
    color: Color(0xFFEA580C),
    details: [
      'Protéines : 16-18% pour une croissance rapide',
      'Aliment ad libitum pour maximiser le GMQ (gain moyen quotidien)',
      'Ajouter des acides aminés (lysine, méthionine)',
      'Surveiller la température (zone de confort : 18-22°C)',
    ],
    astuce: 'Utiliser du son de riz ou maïs concassé comme source énergétique économique.',
  ),
  
  ConseilNutrition(
    titre: 'Finition des porcs charcutiers',
    categorie: 'Porcs',
    description: 'De 60 kg à labattage : qualité de la viande.',
    icon: Icons.restaurant,
    color: Color(0xFFEA580C),
    details: [
      'Réduire les protéines à 14-15%',
      'Augmenter lénergie (maïs, manioc) pour le dépôt de gras',
      'Éviter lexcès de sel dans les dernières semaines',
      'Respecter un jeûne de 12h avant abattage',
    ],
    astuce: 'Ajouter de la farine de soja pour améliorer la qualité de la chair.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de leau pour les porcs',
    categorie: 'Porcs',
    description: 'Leau influence directement la croissance.',
    icon: Icons.water_drop,
    color: Color(0xFFEA580C),
    details: [
      'Un porc boit 5-10 litres deau par jour',
      'Nettoyer les abreuvoirs quotidiennement',
      'Eau fraîche (< 25°C) pour stimuler la consommation',
      'Vérifier le débit : 1-2 litres/minute',
    ],
    astuce: 'Une déshydratation de 10% réduit la croissance de 30%.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention des maladies digestives',
    categorie: 'Porcs',
    description: 'Les troubles digestifs causent 40% des pertes.',
    icon: Icons.health_and_safety,
    color: Color(0xFFEA580C),
    details: [
      'Hygiène stricte des mangeoires et abreuvoirs',
      'Utiliser des acidifiants (acide citrique) dans leau',
      'Éviter la surcharge alimentaire',
      'Vacciner contre les principales maladies',
    ],
    astuce: 'Le charbon de bois pulvérisé dans laliment réduit les diarrhées.',
  ),
  
  ConseilNutrition(
    titre: 'Minéraux et vitamines essentiels',
    categorie: 'Porcs',
    description: 'Les carences réduisent les performances.',
    icon: Icons.science,
    color: Color(0xFFEA580C),
    details: [
      'Phosphore : 0.6-0.8% pour la solidité osseuse',
      'Vitamine A : 5000 UI/kg pour la reproduction',
      'Zinc : 100 mg/kg pour la santé de la peau',
      'Sélénium + vitamine E contre le stress oxydatif',
    ],
    astuce: 'Un bloc à lécher multiminéral doit être disponible en permanence.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation des verrats reproducteurs',
    categorie: 'Porcs',
    description: 'La fertilité dépend de la nutrition.',
    icon: Icons.male,
    color: Color(0xFFEA580C),
    details: [
      'Protéines : 14-16% pour maintenir la libido',
      'Vitamine E + sélénium pour la qualité du sperme',
      'Éviter lobésité (2.5-3 kg daliment/jour maximum)',
      'Ajouter du zinc pour améliorer la fertilité',
    ],
    astuce: 'Mélanger de lail frais écrasé stimule naturellement la libido.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition en période de chaleur',
    categorie: 'Porcs',
    description: 'Le stress thermique réduit la consommation.',
    icon: Icons.thermostat,
    color: Color(0xFFEA580C),
    details: [
      'Nourrir tôt le matin et tard le soir',
      'Augmenter les lipides (3-5%) pour compenser',
      'Ajouter des électrolytes dans leau',
      'Douches régulières pour rafraîchir',
    ],
    astuce: 'Le bicarbonate de soude (0.5% de la ration) aide à réguler la température corporelle.',
  ),
  
  ConseilNutrition(
    titre: 'Transition alimentaire sécurisée',
    categorie: 'Porcs',
    description: 'Éviter les chocs digestifs lors des changements.',
    icon: Icons.swap_horiz,
    color: Color(0xFFEA580C),
    details: [
      'Mélanger 75% ancien + 25% nouveau (jours 1-2)',
      'Puis 50-50 (jours 3-4)',
      'Puis 25% ancien + 75% nouveau (jours 5-6)',
      '100% nouveau à partir du jour 7',
    ],
    astuce: 'Ajouter des probiotiques pendant la transition pour stabiliser la flore intestinale.',
  ),

  // ========================================
  // POULET DE CHAIR - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Démarrage des poussins de chair',
    categorie: 'Poulet de chair',
    description: 'Les 14 premiers jours déterminent 70% du potentiel de croissance.',
    icon: Icons.egg,
    color: Color(0xFFFB923C),
    details: [
      'Aliment starter : protéines 22–24%',
      'Température : 32–35°C la 1ère semaine',
      'Éclairage 23h/24 les 3 premiers jours',
      'Eau propre + électrolytes pour réduire le stress',
      'Densité : 15-18 poussins/m² maximum',
    ],
    astuce: 'Mettre le son de blé ou le maïs concassé très fin pour encourager à manger.',
  ),
  
  ConseilNutrition(
    titre: 'Croissance rapide et saine',
    categorie: 'Poulet de chair',
    description: 'Optimiser laliment permet de réduire le coût de production.',
    icon: Icons.local_dining,
    color: Color(0xFFFB923C),
    details: [
      'Aliment croissance : 20–21% protéines',
      'Bonne ventilation pour éviter le stress thermique',
      'Litière sèche pour prévenir les maladies',
      'Éviter la suralimentation (risque de mortalité)',
      'Programme lumineux : 18h lumière / 6h obscurité',
    ],
    astuce: 'Ajouter des feuilles de papaye ou moringa séchées comme source naturelle de vitamines.',
  ),
  
  ConseilNutrition(
    titre: 'Phase de finition (35 jours - abattage)',
    categorie: 'Poulet de chair',
    description: 'Maximiser le poids final tout en contrôlant les coûts.',
    icon: Icons.scale,
    color: Color(0xFFFB923C),
    details: [
      'Protéines : 18-19%',
      'Énergie élevée (3100-3200 kcal/kg)',
      'Limiter les lipides pour éviter le gras abdominal',
      'Retirer les anticoccidiens 7 jours avant abattage',
    ],
    astuce: 'Ajouter 2-3% dhuile de palme pour améliorer la pigmentation de la peau.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de la litière',
    categorie: 'Poulet de chair',
    description: 'Une litière saine = poulets en santé.',
    icon: Icons.grass,
    color: Color(0xFFFB923C),
    details: [
      'Épaisseur : 5-8 cm (copeaux de bois ou paille)',
      'Humidité < 25% pour éviter les maladies respiratoires',
      'Retourner quotidiennement les zones humides',
      'Remplacer totalement entre chaque bande',
    ],
    astuce: 'Saupoudrer de la chaux vive sur les zones très humides.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention de la coccidiose',
    categorie: 'Poulet de chair',
    description: 'La coccidiose peut tuer 20-50% du lot.',
    icon: Icons.bug_report,
    color: Color(0xFFFB923C),
    details: [
      'Utiliser un anticoccidien dans laliment',
      'Rotation des molécules pour éviter les résistances',
      'Hygiène stricte : désinfecter entre les bandes',
      'Surveiller les fientes (présence de sang = alerte)',
    ],
    astuce: 'lail frais haché dans leau a des propriétés antiparasitaires naturelles.',
  ),
  
  ConseilNutrition(
    titre: 'Vaccination et biosécurité',
    categorie: 'Poulet de chair',
    description: 'Protéger le cheptel des maladies virales.',
    icon: Icons.vaccines,
    color: Color(0xFFFB923C),
    details: [
      'Newcastle : J1 (goutte oculaire) et J14 (eau de boisson)',
      'Gumboro : J10-14 selon la pression locale',
      'Pédiluve à lentrée du bâtiment',
      'Limiter les visites extérieures',
    ],
    astuce: 'Ajouter du lait en poudre dans leau de vaccination pour neutraliser le chlore.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion du stress thermique',
    categorie: 'Poulet de chair',
    description: 'Les fortes chaleurs augmentent la mortalité.',
    icon: Icons.wb_sunny,
    color: Color(0xFFFB923C),
    details: [
      'Ventilation forcée au-dessus de 28°C',
      'Nébulisation deau fraîche dans le bâtiment',
      'Réduire la densité : 12-15 poulets/m²',
      'Ajouter de la vitamine C (200 mg/L deau)',
    ],
    astuce: 'Nourrir aux heures fraîches (6h-8h et 18h-20h) pendant les canicules.',
  ),
  
  ConseilNutrition(
    titre: 'Calcul de lindice de consommation',
    categorie: 'Poulet de chair',
    description: 'Surveiller la rentabilité de lélevage.',
    icon: Icons.calculate,
    color: Color(0xFFFB923C),
    details: [
      'IC = Aliment consommé (kg) / Poids vif gagné (kg)',
      'Objectif : IC < 2.0 à 42 jours',
      'Peser un échantillon chaque semaine',
      'Ajuster la ration si IC > 2.2',
    ],
    astuce: 'Un bon IC signifie moins de coûts et plus de rentabilité.',
  ),
  
  ConseilNutrition(
    titre: 'Qualité de leau de boisson',
    categorie: 'Poulet de chair',
    description: 'leau impacte directement la croissance.',
    icon: Icons.opacity,
    color: Color(0xFFFB923C),
    details: [
      'Consommation : 1.8-2 fois le poids daliment',
      'pH optimal : 6.5-7.5',
      'Chlorer leau (1-2 ppm) pour éviter les contaminations',
      'Nettoyer les pipettes chaque semaine',
    ],
    astuce: 'Ajouter du vinaigre de cidre (5 ml/L) une fois par semaine pour acidifier le tube digestif.',
  ),
  
  ConseilNutrition(
    titre: 'Densité et espace vital',
    categorie: 'Poulet de chair',
    description: 'La surpopulation augmente les maladies et réduit la croissance.',
    icon: Icons.group,
    color: Color(0xFFFB923C),
    details: [
      'Démarrage : 20-25 poussins/m²',
      'Croissance : 15-18 poulets/m²',
      'Finition : 10-12 poulets/m²',
      'Espace mangeoire : 3-4 cm par poulet',
    ],
    astuce: 'Séparer les mâles des femelles après 21 jours pour optimiser lespace.',
  ),

  // ========================================
  // POULES PONDEUSES - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Production optimale dœufs',
    categorie: 'Poules pondeuses',
    description: 'laliment influence directement la ponte et la qualité des coquilles.',
    icon: Icons.egg_alt,
    color: Color(0xFFFFB648),
    details: [
      'Protéines : 16–18%',
      'Calcium : 3.5–4%',
      'Lumière : 14–16 h/jour',
      'Eau propre : 200–250 ml/j',
      'Phosphore : 0.35-0.4% pour labsorption du calcium',
    ],
    astuce: 'Distribuer le calcium (coquilles dhuîtres) en soirée pour renforcer la coquille.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de la chaleur chez les pondeuses',
    categorie: 'Poules pondeuses',
    description: 'Les fortes chaleurs réduisent jusquà 40% la ponte.',
    icon: Icons.heat_pump,
    color: Color(0xFFFFB648),
    details: [
      'Ajouter du bicarbonate dans leau (1 càc/L)',
      'Ventilation + ombrage dans les bâtiments',
      'Éviter de nourrir aux heures chaudes',
      'Augmenter le calcium à 4.5% en période chaude',
    ],
    astuce: 'Augmenter légèrement la vitamine C pendant les périodes chaudes.',
  ),
  
  ConseilNutrition(
    titre: 'Démarrage des poulettes futures pondeuses',
    categorie: 'Poules pondeuses',
    description: 'Une bonne croissance = bonne ponte future.',
    icon: Icons.child_care,
    color: Color(0xFFFFB648),
    details: [
      '0-6 semaines : aliment starter 20% protéines',
      '7-18 semaines : aliment poulette 16-17% protéines',
      'Contrôler la croissance : 1.4-1.5 kg à 18 semaines',
      'Éviter lobésité (réduit la ponte)',
    ],
    astuce: 'Une poulette sous-développée donnera des œufs petits toute sa vie.',
  ),
  
  ConseilNutrition(
    titre: 'Programme lumineux pour pondeuses',
    categorie: 'Poules pondeuses',
    description: 'La lumière stimule la ponte.',
    icon: Icons.lightbulb,
    color: Color(0xFFFFB648),
    details: [
      'Démarrer à 14h de lumière à 18 semaines',
      'Augmenter 30 min/semaine jusqu\'à 16-17h',
      'Ne jamais diminuer la durée déclairage',
      'Intensité : 10-20 lux dans le poulailler',
    ],
    astuce: 'Une coupure de courant prolongée peut stopper la ponte pendant 3 semaines.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention de la chute de ponte',
    categorie: 'Poules pondeuses',
    description: 'Identifier et corriger rapidement les causes.',
    icon: Icons.trending_down,
    color: Color(0xFFFFB648),
    details: [
      'Stress (bruits, prédateurs) = chute de 20-30%',
      'Maladies (Newcastle, bronchite) = chute de 50%+',
      'Carences en calcium = œufs mous',
      'Surveiller quotidiennement le taux de ponte',
    ],
    astuce: 'Une chute brutale (>10% en 1 semaine) nécessite un diagnostic vétérinaire urgent.',
  ),
  
  ConseilNutrition(
    titre: 'Qualité de la coquille',
    categorie: 'Poules pondeuses',
    description: 'Les œufs fêlés réduisent les revenus.',
    icon: Icons.broken_image,
    color: Color(0xFFFFB648),
    details: [
      'Calcium : source principale (3.5-4%)',
      'Vitamine D3 : 3000 UI/kg pour fixer le calcium',
      'Phosphore : 0.35-0.4% (ratio Ca:P = 10:1)',
      'Éviter les chocs thermiques brusques',
    ],
    astuce: 'Collecter les œufs 3-4 fois par jour réduit les casses de 30%.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de la mue',
    categorie: 'Poules pondeuses',
    description: 'La mue naturelle stoppe la ponte pendant 2-3 mois.',
    icon: Icons.autorenew,
    color: Color(0xFFFFB648),
    details: [
      'Mue naturelle : à partir de 12-14 mois',
      'Réduire les protéines à 12% pendant la mue',
      'Réduire la lumière à 8h/jour',
      'Après la mue : reprise graduelle',
    ],
    astuce: 'Une mue forcée (provoquée) peut rajeunir un troupeau vieillissant.',
  ),
  
  ConseilNutrition(
    titre: 'Pigmentation du jaune dœuf',
    categorie: 'Poules pondeuses',
    description: 'Un jaune bien coloré se vend mieux.',
    icon: Icons.palette,
    color: Color(0xFFFFB648),
    details: [
      'Ajouter du maïs jaune (source de xanthophylles)',
      'Feuilles de moringa, luzerne déshydratée',
      'Éviter lexcès (jaune trop foncé = rejet)',
      'Contrôler avec un éventail colorimétrique (score 10-12)',
    ],
    astuce: 'Le paprika ou le piment doux en poudre intensifient naturellement la couleur.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention du picage et cannibalisme',
    categorie: 'Poules pondeuses',
    description: 'Le picage cause des pertes importantes.',
    icon: Icons.warning,
    color: Color(0xFFFFB648),
    details: [
      'Causes : surpopulation, manque de protéines, ennui',
      'Débecquage léger à 7-10 jours (prévention)',
      'Enrichir lenvironnement (perchoirs, jouets)',
      'Vérifier les carences (méthionine, sel)',
    ],
    astuce: 'Suspendre des légumes (choux, carottes) occupe les poules et réduit le picage.',
  ),
  
  ConseilNutrition(
    titre: 'Transition vers la réforme',
    categorie: 'Poules pondeuses',
    description: 'Maximiser le poids des poules de réforme.',
    icon: Icons.sell,
    color: Color(0xFFFFB648),
    details: [
      'Réforme après 72-80 semaines de ponte',
      'Augmenter lénergie (3-4 semaines avant réforme)',
      'Éviter le jeûne prolongé avant vente',
      'Poules bien engraissées = meilleur prix',
    ],
    astuce: 'Ajouter 5-7% de matières grasses dans la ration finale.',
  ),

  // ========================================
  // POISSONS - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Alimentation des poissons en étang',
    categorie: 'Poissons',
    description: 'Une bonne nutrition garantit une croissance rapide.',
    icon: Icons.water,
    color: Color(0xFF38BDF8),
    details: [
      'Protéines : 28–32% pour poissons juvéniles',
      'Granulométrie adaptée selon lâge',
      '2–3 repas/jour à heures fixes',
      'Quantité : 3-5% du poids vif total',
    ],
    astuce: 'Ajouter azolla, moringa ou son de riz pour réduire le coût alimentaire.',
  ),
  
  ConseilNutrition(
    titre: 'Qualité de leau et nutrition',
    categorie: 'Poissons',
    description: 'La qualité de leau influence directement lappétit.',
    icon: Icons.opacity,
    color: Color(0xFF38BDF8),
    details: [
      'Oxygénation régulière (>5 mg/L)',
      'pH optimal entre 6.5 et 8.5',
      'Éviter de nourrir quand leau est trouble',
      'Température idéale : 25-30°C pour les tilapias',
    ],
    astuce: 'Utiliser des probiotiques naturels (levure, EM) pour clarifier leau.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation des alevins',
    categorie: 'Poissons',
    description: 'La phase critique pour la survie.',
    icon: Icons.child_friendly,
    color: Color(0xFF38BDF8),
    details: [
      'Protéines très élevées : 40-45%',
      'Aliment en poudre fine (0.2-0.5 mm)',
      '4-6 repas par jour',
      'Surveiller la qualité de leau (plus sensibles)',
    ],
    astuce: 'Le jaune dœuf bouilli et tamisé est un excellent démarrage pour les alevins.',
  ),
  
  ConseilNutrition(
    titre: 'Fertilisation de létang',
    categorie: 'Poissons',
    description: 'Stimuler la production naturelle de nourriture.',
    icon: Icons.eco,
    color: Color(0xFF38BDF8),
    details: [
      'Fumier de volaille : 100-200 kg/ha/semaine',
      'NPK : 50-100 kg/ha/mois pour le phytoplancton',
      'Eau verte = bon signe (chlorophylle)',
      'Arrêter la fertilisation si leau devient trop verte',
    ],
    astuce: 'La fiente de poules est le meilleur fertilisant pour les étangs.',
  ),
  
  ConseilNutrition(
    titre: 'Densité de charge en étang',
    categorie: 'Poissons',
    description: 'La surpopulation limite la croissance.',
    icon: Icons.groups,
    color: Color(0xFF38BDF8),
    details: [
      'Tilapias : 2-5 poissons/m² (selon aération)',
      'Clarias (poissons-chats) : 10-20/m²',
      'Respecter la capacité de charge',
      'Densité élevée = besoin daération forcée',
    ],
    astuce: 'Faire des pêches partielles pour maintenir une densité optimale.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention des maladies',
    categorie: 'Poissons',
    description: 'Mieux vaut prévenir que guérir.',
    icon: Icons.medical_services,
    color: Color(0xFF38BDF8),
    details: [
      'Quarantaine des nouveaux poissons (7-10 jours)',
      'Ne pas suralimenter (pollution de leau)',
      'Retirer les poissons morts immédiatement',
      'Désinfecter les équipements entre les cycles',
    ],
    astuce: 'Un bain de sel (3% pendant 5 min) traite de nombreux parasites externes.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation complémentaire économique',
    categorie: 'Poissons',
    description: 'Réduire les coûts sans sacrifier la croissance.',
    icon: Icons.savings,
    color: Color(0xFF38BDF8),
    details: [
      'Termites, vers de terre : riches en protéines',
      'Azolla, lentilles deau : gratuits et nutritifs',
      'Déchets de poisson, abattoir (bien cuits)',
      'Son de riz + tourteau de soja : mélange économique',
    ],
    astuce: 'Une lampe au-dessus de létang la nuit attire les insectes (protéines gratuites).',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de loxygène dissous',
    categorie: 'Poissons',
    description: 'loxygène = vie pour les poissons.',
    icon: Icons.air,
    color: Color(0xFF38BDF8),
    details: [
      'Niveau critique : <3 mg/L (mortalité)',
      'Aérateurs : nécessaires si densité >3 poissons/m²',
      'Heures critiques : tôt le matin (min dO2)',
      'Plantes aquatiques : produisent O2 le jour',
    ],
    astuce: 'Observer les poissons en surface tôt le matin = manque doxygène.',
  ),
  

  ConseilNutrition(
    titre: 'Cycle de production optimal',
    categorie: 'Poissons',
    description: 'Maximiser la rentabilité.',
    icon: Icons.refresh,
    color: Color(0xFF38BDF8),
    details: [
      'Tilapias : 5-6 mois pour atteindre 300-400g',
      'Clarias : 4-5 mois pour 500-700g',
      'Vidange totale entre chaque cycle',
      'Désinfection à la chaux vive',
    ],
    astuce: 'Récolter par pêche sélective tous les mois pour un revenu régulier.',
  ),
  
  ConseilNutrition(
    titre: 'Contrôle des prédateurs',
    categorie: 'Poissons',
    description: 'Protéger linvestissement.',
    icon: Icons.security,
    color: Color(0xFF38BDF8),
    details: [
      'Filets anti-oiseaux au-dessus des bassins',
      'Clôtures pour empêcher les mammifères',
      'Éviter les plantes hautes près de létang',
      'Surveiller les serpents aquatiques',
    ],
    astuce: 'Un chien bien dressé dissuade la plupart des prédateurs nocturnes.',
  ),

  // ========================================
  // CHÈVRES - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Alimentation des chèvres laitières',
    categorie: 'Chèvres',
    description: 'Une bonne alimentation améliore la production laitière.',
    icon: Icons.pets,
    color: Color(0xFFD97706),
    details: [
      'Fourrages riches : luzerne, foin de qualité',
      'Concentrés : 300–500g/jour selon production',
      'Minéraux essentiels : calcium, zinc, sélénium',
      'Eau propre : 5-10 L/jour',
    ],
    astuce: 'Introduire progressivement les nouveaux aliments pour éviter les ballonnements.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de pâturage pour chèvres',
    categorie: 'Chèvres',
    description: 'Le pâturage influence la santé et la reproduction.',
    icon: Icons.forest,
    color: Color(0xFFD97706),
    details: [
      'Rotation des zones pour éviter la surcharge',
      'Éviter les herbes trop mouillées (risque parasitaire)',
      'Préférer les pâturages en hauteur (naturel pour chèvres)',
      'Compléter avec du foin en saison sèche',
    ],
    astuce: 'Le moringa est un excellent complément riche en protéines.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des chevreaux en croissance',
    categorie: 'Chèvres',
    description: 'Assurer une croissance rapide.',
    icon: Icons.child_care,
    color: Color(0xFFD97706),
    details: [
      'Allaitement : minimum 2-3 mois',
      'Aliment starter : protéines 18-20%',
      'Accès au fourrage dès 2 semaines',
      'Sevrage progressif à 3 mois',
    ],
    astuce: 'Le lait de remplacement coûte cher : privilégier lallaitement naturel.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention des parasites internes',
    categorie: 'Chèvres',
    description: 'Les vers réduisent la croissance de 30-40%.',
    icon: Icons.bug_report,
    color: Color(0xFFD97706),
    details: [
      'Vermifugation : tous les 3 mois minimum',
      'Rotation des pâturages pour casser le cycle',
      'Surveiller la couleur des muqueuses (anémie)',
      'Éviter le surpâturage',
    ],
    astuce: 'Les graines de papaye séchées ont des propriétés vermifuges naturelles.',
  ),
  
  ConseilNutrition(
    titre: 'Bloc multinutritionnel (BMN)',
    categorie: 'Chèvres',
    description: 'Complément essentiel en saison sèche.',
    icon: Icons.widgets,
    color: Color(0xFFD97706),
    details: [
      'Composition : mélasse, urée, son, minéraux',
      'Compense les carences alimentaires',
      'Stimule lappétit et la rumination',
      'À disposition en permanence',
    ],
    astuce: 'Un BMN bien fait dure 1-2 semaines pour 10 chèvres.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des boucs reproducteurs',
    categorie: 'Chèvres',
    description: 'Fertilité optimale.',
    icon: Icons.male,
    color: Color(0xFFD97706),
    details: [
      'Protéines : 16-18%',
      'Zinc et vitamine E pour la qualité du sperme',
      'Éviter lobésité (300-400g concentré/jour)',
      'Séparer des femelles hors saison de reproduction',
    ],
    astuce: 'Un bouc bien nourri peut saillir 40-50 chèvres par saison.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation pendant la gestation',
    categorie: 'Chèvres',
    description: 'Préparer une mise bas réussie.',
    icon: Icons.pregnant_woman,
    color: Color(0xFFD97706),
    details: [
      'Augmenter progressivement lalimentation',
      'Dernier mois : +30% de concentrés',
      'Calcium et phosphore pour le développement fœtal',
      'Éviter le stress et la sous-nutrition',
    ],
    astuce: 'Une chèvre mal nourrie donnera des chevreaux chétifs et peu de lait.',
  ),
  
  ConseilNutrition(
    titre: 'Maximiser la production laitière',
    categorie: 'Chèvres',
    description: 'Stratégies pour augmenter le lait.',
    icon: Icons.water_drop,
    color: Color(0xFFD97706),
    details: [
      'Traire 2 fois par jour (matin et soir)',
      'Aliment énergétique riche',
      'Eau fraîche en abondance',
      'Réduire le stress (calme, routine)',
    ],
    astuce: 'Jouer de la musique douce pendant la traite augmente le débit de lait.',
  ),
  
  ConseilNutrition(
    titre: 'Transition alimentaire saisonnière',
    categorie: 'Chèvres',
    description: 'Adapter selon les saisons.',
    icon: Icons.calendar_month,
    color: Color(0xFFD97706),
    details: [
      'Saison pluvieuse : profiter du pâturage',
      'Saison sèche : compléter avec foin et concentrés',
      'Stocker du fourrage pendant labondance',
      'Prévoir 1-2 kg foin/chèvre/jour en saison sèche',
    ],
    astuce: 'Ensiler lherbe excédentaire de la saison des pluies.',
  ),
  
  ConseilNutrition(
    titre: 'Minéraux et oligo-éléments',
    categorie: 'Chèvres',
    description: 'Prévenir les carences.',
    icon: Icons.science,
    color: Color(0xFFD97706),
    details: [
      'Sel : à volonté (pierre à lécher)',
      'Calcium : 0.6-0.8% (laitières)',
      'Cuivre, cobalt, sélénium selon région',
      'Contrôle vétérinaire en cas de symptômes',
    ],
    astuce: 'Un bloc minéral spécial caprins doit être toujours disponible.',
  ),

  // ========================================
  // MOUTONS - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Nutrition des béliers et brebis',
    categorie: 'Moutons',
    description: 'Les moutons ont besoin dun équilibre fibres–énergie.',
    icon: Icons.ramen_dining,
    color: Color(0xFFEA580C),
    details: [
      'Fourrage : 60–70% de la ration',
      'Compléments : son, maïs, tourteaux',
      'Eau propre en permanence (3-5 L/jour)',
      'Sel minéralisé à disposition',
    ],
    astuce: 'Les blocs multinutritionnels sont très utiles en saison sèche.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des agneaux',
    categorie: 'Moutons',
    description: 'Une bonne croissance assure une meilleure valeur marchande.',
    icon: Icons.child_care,
    color: Color(0xFFEA580C),
    details: [
      'Accès au lait jusquà 8 semaines minimum',
      'Introduire un aliment starter riche en protéines',
      'Accès au fourrage dès 2-3 semaines',
      'Sevrage complet à 10-12 semaines',
    ],
    astuce: 'Le foin de légumineuses stimule la prise de poids.',
  ),
  
  ConseilNutrition(
    titre: 'Flushing avant la reproduction',
    categorie: 'Moutons',
    description: 'Améliorer le taux dagnelage.',
    icon: Icons.favorite,
    color: Color(0xFFEA580C),
    details: [
      'Augmenter lalimentation 2-3 semaines avant saillie',
      '200-300g de concentrés supplémentaires',
      'Stimule lovulation et le nombre dovules',
      'Continuer 2 semaines après la saillie',
    ],
    astuce: 'Le flushing peut augmenter le nombre dagneaux de 20-30%.',
  ),
  
  ConseilNutrition(
    titre: 'Gestation et préparation à lagnelage',
    categorie: 'Moutons',
    description: 'Préparer des agneaux vigoureux.',
    icon: Icons.pregnant_woman,
    color: Color(0xFFEA580C),
    details: [
      '2 premiers mois : ration dentretien',
      'Dernier mois : augmenter de 30-40%',
      'Calcium et phosphore essentiels',
      'Éviter le surpoids (risque de toxémie)',
    ],
    astuce: 'Vacciner contre le tétanos et les entérotoxémies 1 mois avant agnelage.',
  ),
  
  ConseilNutrition(
    titre: 'Engraissement des moutons',
    categorie: 'Moutons',
    description: 'Maximiser le gain de poids.',
    icon: Icons.trending_up,
    color: Color(0xFFEA580C),
    details: [
      'Objectif : 200-300g de GMQ',
      'Ration riche en énergie (céréales)',
      'Protéines : 14-16%',
      'Durée : 60-90 jours pour finition',
    ],
    astuce: 'Ajouter 3-5% de matières grasses (huile, graines) accélère lengraissement.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion du pâturage rotatif',
    categorie: 'Moutons',
    description: 'Optimiser lutilisation des parcelles.',
    icon: Icons.sync,
    color: Color(0xFFEA580C),
    details: [
      'Rotation toutes les 2-3 semaines',
      'Hauteur dherbe : 10-15 cm (optimal)',
      'Ne pas descendre sous 5 cm (surpâturage)',
      'Repos des parcelles : 3-4 semaines',
    ],
    astuce: 'Le pâturage mixte (moutons + bovins) améliore la gestion parasitaire.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention des maladies métaboliques',
    categorie: 'Moutons',
    description: 'Toxémie de gestation et acidose.',
    icon: Icons.health_and_safety,
    color: Color(0xFFEA580C),
    details: [
      'Toxémie : brebis grasses en fin de gestation',
      'Prévention : éviter surpoids, donner énergie',
      'Acidose : excès de céréales trop rapide',
      'Introduire progressivement les concentrés',
    ],
    astuce: 'Propylène glycol (50-100 ml/jour) prévient la toxémie en fin de gestation.',
  ),
  
  ConseilNutrition(
    titre: 'Tonte et besoins nutritionnels',
    categorie: 'Moutons',
    description: 'Adapter lalimentation après la tonte.',
    icon: Icons.content_cut,
    color: Color(0xFFEA580C),
    details: [
      'Tondre avant les chaleurs ou avant lhiver',
      'Augmenter lénergie de 10-15% post-tonte',
      'Protéger du froid et des intempéries',
      'Meilleure croissance de la laine avec supplémentation',
    ],
    astuce: 'Ajouter du soufre et du zinc favorise la repousse de laine de qualité.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation des béliers reproducteurs',
    categorie: 'Moutons',
    description: 'Fertilité et libido optimales.',
    icon: Icons.male,
    color: Color(0xFFEA580C),
    details: [
      'Protéines : 14-16%',
      'Vitamine E + sélénium : qualité sperme',
      '400-600g concentrés/jour en période de lutte',
      'Éviter lobésité hors saison',
    ],
    astuce: 'Un bélier bien nourri peut saillir 30-40 brebis par saison.',
  ),
  
  ConseilNutrition(
    titre: 'Complémentation minérale',
    categorie: 'Moutons',
    description: 'Éviter les carences.',
    icon: Icons.medication,
    color: Color(0xFFEA580C),
    details: [
      'Pierre à sel en permanence',
      'Calcium : 0.4-0.6% de la ration',
      'Cuivre : attention au surdosage (toxique)',
      'Sélénium : prévient la myopathie',
    ],
    astuce: 'Les moutons sont très sensibles au cuivre : utiliser des CMV spécifiques ovins.',
  ),

  // ========================================
  // BOEUFS - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Nutrition des bovins à lengraissement',
    categorie: 'Boeufs',
    description: 'Objectif : croissance rapide et carcasse de qualité.',
    icon: Icons.agriculture,
    color: Color(0xFF4B2E2A),
    details: [
      'Ration riche en énergie (maïs, manioc, drêches)',
      'Fibres : 15–20% pour la rumination',
      'Eau : 40–60 L/jour',
      'Objectif : 1-1.5 kg GMQ',
    ],
    astuce: 'Ajouter du sel et bloc minéral pour stimuler lappétit.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion alimentaire en saison sèche',
    categorie: 'Boeufs',
    description: 'La baisse de qualité des pâturages réduit la croissance.',
    icon: Icons.grass,
    color: Color(0xFF4B2E2A),
    details: [
      'Utiliser les résidus agricoles (son, fanes, tiges)',
      'Introduire lurée-mélasse pour compenser les carences',
      'Stocker le fourrage en saison pluvieuse',
      'Complémenter avec des tourteaux',
    ],
    astuce: 'Ensiler le maïs ou sorgho pendant la saison pluvieuse.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des vaches laitières',
    categorie: 'Boeufs',
    description: 'Maximiser la production laitière.',
    icon: Icons.water_drop,
    color: Color(0xFF4B2E2A),
    details: [
      'Fourrage de qualité : 50-60% de la ration',
      'Concentrés : 1 kg pour 2.5-3 L de lait',
      'Eau : 80-120 L/jour (vache haute production)',
      'Calcium : 0.7-0.9% (prévention fièvre de lait)',
    ],
    astuce: 'Traire à heures fixes stimule la production hormonale.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation des veaux',
    categorie: 'Boeufs',
    description: 'Démarrage crucial pour la croissance.',
    icon: Icons.child_friendly,
    color: Color(0xFF4B2E2A),
    details: [
      'Colostrum : dans les 6 premières heures',
      'Lait : 4-6 L/jour jusquà 2 mois',
      'Aliment starter dès 1 semaine',
      'Sevrage progressif à 2-3 mois',
    ],
    astuce: 'Un veau bien nourri double son poids à 2 mois.',
  ),
  
  ConseilNutrition(
    titre: 'Préparation au vêlage',
    categorie: 'Boeufs',
    description: 'Prévenir les complications.',
    icon: Icons.pregnant_woman,
    color: Color(0xFF4B2E2A),
    details: [
      'Augmenter progressivement les concentrés',
      '2 derniers mois : +30-40% énergie et protéines',
      'Vitamine E + sélénium contre la rétention placentaire',
      'Éviter surpoids (vêlage difficile)',
    ],
    astuce: 'Brosser et manipuler la vache régulièrement facilite le vêlage.',
  ),
  
  ConseilNutrition(
    titre: 'Bloc multinutritionnel pour bovins',
    categorie: 'Boeufs',
    description: 'Complément essentiel.',
    icon: Icons.widgets,
    color: Color(0xFF4B2E2A),
    details: [
      'Composition : mélasse 40%, urée 5%, minéraux',
      'Compense les carences saisonnières',
      'Améliore la digestion des fourrages pauvres',
      'À disposition permanente',
    ],
    astuce: 'Un BMN bien fait dure 3-4 semaines pour 10 bovins.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion des taureaux reproducteurs',
    categorie: 'Boeufs',
    description: 'Fertilité optimale.',
    icon: Icons.male,
    color: Color(0xFF4B2E2A),
    details: [
      'Protéines : 12-14%',
      'Zinc et vitamine A pour la qualité du sperme',
      '2-3 kg concentrés/jour',
      'Éviter lobésité et la sous-nutrition',
    ],
    astuce: 'Un taureau peut saillir 30-40 vaches par saison sil est bien nourri.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention de lacidose ruminale',
    categorie: 'Boeufs',
    description: 'Maladie mortelle liée à lalimentation.',
    icon: Icons.warning,
    color: Color(0xFF4B2E2A),
    details: [
      'Cause : excès de céréales introduites trop vite',
      'Toujours augmenter progressivement',
      'Maintenir 30-40% de fourrage grossier',
      'Ajouter du bicarbonate de sodium (150g/jour)',
    ],
    astuce: 'Observer les bouses : liquides et mousseuses = acidose.',
  ),
  
  ConseilNutrition(
    titre: 'Pâturage et gestion des parcelles',
    categorie: 'Boeufs',
    description: 'Optimiser les ressources fourragères.',
    icon: Icons.landscape,
    color: Color(0xFF4B2E2A),
    details: [
      'Charge : 1-2 bovins/hectare selon qualité',
      'Rotation des parcelles toutes les 3-4 semaines',
      'Éviter le surpâturage (<5 cm = dégradation)',
      'Clôtures électriques mobiles pour rotation',
    ],
    astuce: 'Le pâturage mixte (bovins + ovins) optimise lutilisation de lherbe.',
  ),
  
  ConseilNutrition(
    titre: 'Eau et abreuvement',
    categorie: 'Boeufs',
    description: 'leau est le nutriment le plus important.',
    icon: Icons.local_drink,
    color: Color(0xFF4B2E2A),
    details: [
      'Vache laitière : 80-150 L/jour',
      'Bœuf engraissement : 40-60 L/jour',
      'Eau propre et fraîche en permanence',
      'Nettoyer les abreuvoirs chaque semaine',
    ],
    astuce: 'Une vache déshydratée réduit sa production laitière de 25% immédiatement.',
  ),

  // ========================================
  // LAPINS - 10 conseils
  // ========================================
  ConseilNutrition(
    titre: 'Alimentation des lapins en croissance',
    categorie: 'Lapins',
    description: 'Le système digestif du lapin est très sensible.',
    icon: Icons.cruelty_free,
    color: Color(0xFF059669),
    details: [
      'Granulés 16–18% protéines',
      'Foin abondant pour éviter les diarrhées',
      'Éviter lexcès de légumes verts (ballonnements)',
      'Eau propre en permanence',
    ],
    astuce: 'Donner des feuilles de patate douce comme fibre naturelle.',
  ),
  
  ConseilNutrition(
    titre: 'Reproduction des lapines',
    categorie: 'Lapins',
    description: 'Une bonne nutrition garantit de grandes portées.',
    icon: Icons.favorite,
    color: Color(0xFF059669),
    details: [
      'Aliment enrichi en énergie et protéines',
      'Vitamine E et sélénium pour la fertilité',
      'Calcium : 1% pendant la lactation',
      'Flushing 1 semaine avant saillie',
    ],
    astuce: 'Ajouter un peu de luzerne pour stimuler la lactation.',
  ),
  
  ConseilNutrition(
    titre: 'Sevrage des lapereaux',
    categorie: 'Lapins',
    description: 'Phase critique : 70% mortalité post-sevrage.',
    icon: Icons.child_care,
    color: Color(0xFF059669),
    details: [
      'Sevrer à 4-5 semaines minimum',
      'Introduire progressivement laliment solide',
      'Éviter les changements brusques',
      'Surveiller les diarrhées',
    ],
    astuce: 'Ajouter des probiotiques dans leau la première semaine post-sevrage.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention des troubles digestifs',
    categorie: 'Lapins',
    description: 'La diarrhée tue rapidement les lapins.',
    icon: Icons.medical_services,
    color: Color(0xFF059669),
    details: [
      'Hygiène stricte des cages',
      'Éviter les aliments moisis',
      'Foin de qualité : 40-50% de la ration',
      'Vinaigre de cidre (1 càs/L) en prévention',
    ],
    astuce: 'Le charbon végétal pilé dans laliment prévient les diarrhées.',
  ),
  
  ConseilNutrition(
    titre: 'Alimentation à base de fourrages verts',
    categorie: 'Lapins',
    description: 'Réduire les coûts avec des fourrages locaux.',
    icon: Icons.eco,
    color: Color(0xFF059669),
    details: [
      'Herbe fraîche : introduire progressivement',
      'Fanes de légumes, feuilles de manioc',
      'Éviter lexcès (max 30% de la ration)',
      'Toujours compléter avec du foin sec',
    ],
    astuce: 'Faire sécher légèrement lherbe avant distribution pour éviter les ballonnements.',
  ),
  
  ConseilNutrition(
    titre: 'Densité et logement',
    categorie: 'Lapins',
    description: 'lespace influence la croissance.',
    icon: Icons.home,
    color: Color(0xFF059669),
    details: [
      'Engraissement : 10-12 lapins/m² maximum',
      'Lapine + portée : 0.5-0.6 m²',
      'Cages surélevées pour lhygiène',
      'Nettoyer les cages 2-3 fois/semaine',
    ],
    astuce: 'Les cages en batterie optimisent lespace et facilitent la gestion.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion de la chaleur',
    categorie: 'Lapins',
    description: 'Les lapins sont très sensibles à la chaleur.',
    icon: Icons.thermostat,
    color: Color(0xFF059669),
    details: [
      'Température optimale : 15-20°C',
      '>28°C = stress thermique',
      'Ventilation et ombrage indispensables',
      'Nourrir aux heures fraîches',
    ],
    astuce: 'Placer des bouteilles deau congelées dans les cages pendant les canicules.',
  ),
  
  ConseilNutrition(
    titre: 'Nutrition des mâles reproducteurs',
    categorie: 'Lapins',
    description: 'Maintenir la fertilité.',
    icon: Icons.male,
    color: Color(0xFF059669),
    details: [
      'Protéines : 16-17%',
      'Vitamine E pour la qualité du sperme',
      'Éviter lobésité (max 150g granulés/jour)',
      'Séparer des femelles hors reproduction',
    ],
    astuce: 'Un mâle bien géré peut saillir 2-3 femelles par semaine.',
  ),
  
  ConseilNutrition(
    titre: 'Complémentation minérale',
    categorie: 'Lapins',
    description: 'Éviter les carences.',
    icon: Icons.science,
    color: Color(0xFF059669),
    details: [
      'Calcium : 0.8-1% (croissance et lactation)',
      'Sel : 0.3-0.5%',
      'Pierre à lécher à disposition',
      'CMV spécifique lapins recommandé',
    ],
    astuce: 'Les coquilles dœufs broyées sont une excellente source de calcium.',
  ),
  
  ConseilNutrition(
    titre: 'Cycle de production intensif',
    categorie: 'Lapins',
    description: 'Maximiser les portées.',
    icon: Icons.refresh,
    color: Color(0xFFEA580C),
    details: [
      '7-8 portées par an possibles',
      'Saillie 10-15 jours post-mise bas',
      'Sevrer à 4-5 semaines',
      'Surveiller létat corporel des femelles',
    ],
    astuce: 'Une lapine en bonne santé peut produire 40-50 lapereaux par an.',
  ),




// ========================================
  // CONSEILS GÉNÉRAUX - TOUS
  // ========================================
  ConseilNutrition(
    titre: 'Qualité de leau',
    categorie: 'Tous',
    description: 'leau représente plus de 60% des performances.',
    icon: Icons.water_drop,
    color: Color(0xFF0EA5E9),
    details: [
      'Eau fraîche et propre en permanence',
      'Nettoyer les abreuvoirs chaque jour',
      'Vérifier la qualité : pH, bactéries, nitrates',
      'Débit suffisant pour tous les animaux',
    ],
    astuce: 'Une baisse de consommation deau = premier signe de maladie.',
  ),
  
  ConseilNutrition(
    titre: 'Compléments minéraux et vitaminiques',
    categorie: 'Tous',
    description: 'Indispensables pour la croissance et limmunité.',
    icon: Icons.science,
    color: Color(0xFF8B5CF6),
    details: [
      'Calcium, phosphore, sodium, zinc, sélénium',
      'Vitamine A, D, E essentielles pour la reproduction',
      'Adapter selon lespèce et le stade physiologique',
      'Utiliser des CMV de qualité',
    ],
    astuce: 'Utiliser un CMV adapté à chaque espèce.',
  ),
  
  ConseilNutrition(
    titre: 'Hygiène et biosécurité',
    categorie: 'Tous',
    description: 'Prévenir vaut mieux que guérir.',
    icon: Icons.clean_hands,
    color: Color(0xFF0EA5E9),
    details: [
      'Nettoyage et désinfection réguliers',
      'Contrôler les entrées et sorties',
      'Éliminer les animaux morts rapidement',
      'Pédiluve à lentrée des bâtiments',
    ],
    astuce: 'La biosécurité réduit les coûts vétérinaires de 50%.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion des aliments',
    categorie: 'Tous',
    description: 'Un bon stockage préserve la qualité.',
    icon: Icons.inventory,
    color: Color(0xFF8B5CF6),
    details: [
      'Stocker au sec, à labri des rongeurs',
      'Utiliser la méthode FIFO (premier entré, premier sorti)',
      'Vérifier labsence de moisissures',
      'Respecter les dates de péremption',
    ],
    astuce: 'Les aliments moisis causent des intoxications mortelles.',
  ),
  
  ConseilNutrition(
    titre: 'Suivi des performances',
    categorie: 'Tous',
    description: 'Ce qui nest pas mesuré ne peut être amélioré.',
    icon: Icons.analytics,
    color: Color(0xFF0EA5E9),
    details: [
      'Tenir un registre de pesée régulier',
      'Calculer le GMQ (gain moyen quotidien)',
      'Noter la consommation daliment et deau',
      'Suivre les dépenses et revenus',
    ],
    astuce: 'Peser un échantillon danimaux chaque semaine pour ajuster la ration.',
  ),
  
  ConseilNutrition(
    titre: 'Prévention du stress',
    categorie: 'Tous',
    description: 'Le stress réduit les performances de 20-40%.',
    icon: Icons.spa,
    color: Color(0xFF8B5CF6),
    details: [
      'Manipulations calmes et douces',
      'Éviter les bruits forts et brusques',
      'Respecter les densités recommandées',
      'Maintenir une routine stable',
    ],
    astuce: 'Des animaux calmes grandissent mieux et tombent moins malades.',
  ),
  
  ConseilNutrition(
    titre: 'Gestion économique',
    categorie: 'Tous',
    description: 'lalimentation = 60-70% des coûts de production.',
    icon: Icons.attach_money,
    color: Color(0xFF0EA5E9),
    details: [
      'Utiliser des ingrédients locaux quand possible',
      'Calculer le coût par kg de gain de poids',
      'Comparer les sources de protéines',
      'Optimiser les formulations régulièrement',
    ],
    astuce: 'Une formulation bien calculée peut réduire les coûts de 15-25%.',
  ),
  
  ConseilNutrition(
    titre: 'Adaptation climatique',
    categorie: 'Tous',
    description: 'Le climat influence directement la nutrition.',
    icon: Icons.wb_sunny,
    color: Color(0xFF8B5CF6),
    details: [
      'Saison chaude : augmenter lénergie de la ration',
      'Saison froide : augmenter les apports pour le chauffage corporel',
      'Adapter les heures de distribution',
      'Fournir des électrolytes en période chaude',
    ],
    astuce: 'Nourrir aux heures fraîches améliore la consommation de 20%.',
  ),
  
  ConseilNutrition(
    titre: 'Prophylaxie et vaccination',
    categorie: 'Tous',
    description: 'Un animal en bonne santé valorise mieux son aliment.',
    icon: Icons.vaccines,
    color: Color(0xFF0EA5E9),
    details: [
      'Établir un calendrier de vaccination',
      'Vermifuger régulièrement',
      'Traiter les parasites externes',
      'Consulter un vétérinaire en cas de doute',
    ],
    astuce: 'Les parasites peuvent réduire la croissance de 30-50%.',
  ),
  
  ConseilNutrition(
    titre: 'Formation continue',
    categorie: 'Tous',
    description: 'Les connaissances évoluent, restez informé.',
    icon: Icons.school,
    color: Color(0xFF8B5CF6),
    details: [
      'Participer à des formations techniques',
      'Échanger avec dautres éleveurs',
      'Consulter des ressources fiables',
      'Tester de nouvelles pratiques à petite échelle',
    ],
    astuce: 'Un éleveur bien formé gagne 30% de plus quun débutant.',
  ),
];

List<ConseilNutrition> get _conseilsFiltres {
  if (_selectedCategory == 'Tous') return _conseils;
  return _conseils.where((c) => c.categorie == _selectedCategory).toList();
}





































// List<ConseilNutrition> get _conseilsFiltres {
//   if (_selectedCategory == 'Tous') return _conseils;
//   return _conseils.where((c) => c.categorie == _selectedCategory).toList();
// }













































  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4B2E2A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Conseils en Nutrition',
          style: TextStyle(
            color: Color(0xFF4B2E2A),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header avec info
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD97706).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.school,
                        color: Color(0xFFD97706),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Guides pratiques pour optimiser l\'alimentation de vos animaux',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4B2E2A),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Filtres par catégorie
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFFD97706),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF4B2E2A),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? const Color(0xFFD97706) : Colors.grey.shade300,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Liste des conseils
          Expanded(
            child: _conseilsFiltres.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'Aucun conseil pour cette catégorie',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _conseilsFiltres.length,
                    itemBuilder: (context, index) {
                      final conseil = _conseilsFiltres[index];
                      return _buildConseilCard(conseil);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildConseilCard(ConseilNutrition conseil) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _showConseilDetails(conseil),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: conseil.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(conseil.icon, size: 28, color: conseil.color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conseil.titre,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2E2A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      conseil.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4B2E2A),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: conseil.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        conseil.categorie,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: conseil.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _showConseilDetails(ConseilNutrition conseil) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  children: [
                    // Header avec icône
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: conseil.color.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(conseil.icon, size: 36, color: conseil.color),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                conseil.titre,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4B2E2A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: conseil.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  conseil.categorie,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: conseil.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Description
                    Text(
                      conseil.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4B2E2A),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Points clés
                    const Text(
                      'Points clés',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2E2A),
                      ),
                    ),
                    const SizedBox(height: 12),

                    ...conseil.details.map((detail) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: conseil.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  detail,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF4B2E2A),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),

                    const SizedBox(height: 24),

                    // Astuce
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6E8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFD97706).withOpacity(0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.lightbulb, color: Color(0xFFD97706), size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Astuce pratique',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD97706),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  conseil.astuce,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4B2E2A),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConseilNutrition {
  final String titre;
  final String categorie;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> details;
  final String astuce;

  ConseilNutrition({
    required this.titre,
    required this.categorie,
    required this.description,
    required this.icon,
    required this.color,
    required this.details,
    required this.astuce,
  });
}
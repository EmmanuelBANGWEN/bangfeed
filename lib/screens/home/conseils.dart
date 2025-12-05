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

final List<ConseilNutrition> _conseils = [
  // ----------------------------------------------------------
  // PORCS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Alimentation des porcelets après sevrage',
    categorie: 'Porcs',
    description: 'Une bonne transition alimentaire évite la diarrhée post-sevrage.',
    icon: Icons.pets,
    color: Color(0xFFEA580C),
    details: [
      'Introduire progressivement l’aliment post-sevrage sur 7 jours',
      'Protéines 18–20% et énergie digestible élevée',
      'Ajouter levures ou probiotiques pour stabiliser la flore digestive',
      'Éviter les variations brusques d’aliments',
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
      'Phase 1 : 2–2.5 kg/j d’aliment gestation',
      'Phase 2 : 3 kg/j en fin de gestation',
      'Fibres : 12–18% pour éviter la constipation',
      'Éviter le surpoids (difficultés de mise bas)',
    ],
    astuce: 'Augmenter légèrement l’aliment 7–10 jours avant la mise bas.',
  ),

  // ----------------------------------------------------------
  // POULET DE CHAIR
  // ----------------------------------------------------------
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
    ],
    astuce: 'Mettre le son de blé ou le maïs concassé très fin pour encourager à manger.',
  ),
  ConseilNutrition(
    titre: 'Croissance rapide et saine',
    categorie: 'Poulet de chair',
    description: 'Optimiser l’aliment permet de réduire le coût de production.',
    icon: Icons.local_dining,
    color: Color(0xFFFB923C),
    details: [
      'Aliment croissance : 20–21% protéines',
      'Bonne ventilation pour éviter le stress thermique',
      'Litière sèche pour prévenir les maladies',
      'Éviter la suralimentation (risque de mortalité)',
    ],
    astuce: 'Ajouter des feuilles de papaye ou moringa séchées comme source naturelle de vitamines.',
  ),

  // ----------------------------------------------------------
  // POULES PONDEUSES
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Production optimale d’œufs',
    categorie: 'Poules pondeuses',
    description: 'L’aliment influence directement la ponte et la qualité des coquilles.',
    icon: Icons.egg_alt,
    color: Color(0xFFFFB648),
    details: [
      'Protéines : 16–18%',
      'Calcium : 3.5–4%',
      'Lumière : 14–16 h/jour',
      'Eau propre : 200–250 ml/j',
    ],
    astuce: 'Distribuer le calcium (coquilles d’huîtres) en soirée pour renforcer la coquille.',
  ),
  ConseilNutrition(
    titre: 'Gestion de la chaleur chez les pondeuses',
    categorie: 'Poules pondeuses',
    description: 'Les fortes chaleurs réduisent jusqu’à 40% la ponte.',
    icon: Icons.heat_pump,
    color: Color(0xFFFFB648),
    details: [
      'Ajouter du bicarbonate dans l’eau (1 càc/L)',
      'Ventilation + ombrage dans les bâtiments',
      'Éviter de nourrir aux heures chaudes',
    ],
    astuce: 'Augmenter légèrement la vitamine C pendant les périodes chaudes.',
  ),

  // ----------------------------------------------------------
  // POISSONS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Alimentation des poissons en étang',
    categorie: 'Poissons',
    description: 'Une bonne nutrition garantit une croissance rapide.',
    icon: Icons.water,
    color: Color(0xFF38BDF8),
    details: [
      'Protéines : 28–32% pour poissons juvéniles',
      'Granulométrie adaptée selon l’âge',
      '2–3 repas/jour',
    ],
    astuce: 'Ajouter azolla, moringa ou son de riz pour réduire le coût alimentaire.',
  ),
  ConseilNutrition(
    titre: 'Qualité de l’eau et nutrition',
    categorie: 'Poissons',
    description: 'La qualité de l’eau influence directement l’appétit.',
    icon: Icons.opacity,
    color: Color(0xFF38BDF8),
    details: [
      'Oxygénation régulière',
      'pH optimal entre 6.5 et 8.5',
      'Éviter de nourrir quand l’eau est trouble',
    ],
    astuce: 'Utiliser des probiotiques naturels (levure, EM) pour clarifier l’eau.',
  ),

  // ----------------------------------------------------------
  // CHÈVRES
  // ----------------------------------------------------------
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
    ],
    astuce: 'Le moringa est un excellent complément riche en protéines.',
  ),

  // ----------------------------------------------------------
  // MOUTONS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Nutrition des béliers et brebis',
    categorie: 'Moutons',
    description: 'Les moutons ont besoin d’un équilibre fibres–énergie.',
    icon: Icons.ramen_dining,
    color: Color(0xFF16A34A),
    details: [
      'Fourrage : 60–70% de la ration',
      'Compléments : son, maïs, tourteaux',
      'Eau propre en permanence',
    ],
    astuce: 'Les blocs multinutritionnels sont très utiles en saison sèche.',
  ),
  ConseilNutrition(
    titre: 'Nutrition des agneaux',
    categorie: 'Moutons',
    description: 'Une bonne croissance assure une meilleure valeur marchande.',
    icon: Icons.child_care,
    color: Color(0xFF16A34A),
    details: [
      'Accès au lait jusqu’à 8 semaines',
      'Introduire un aliment starter riche en protéines',
    ],
    astuce: 'Le foin de légumineuses stimule la prise de poids.',
  ),

  // ----------------------------------------------------------
  // BOEUFS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Nutrition des bovins à l’engraissement',
    categorie: 'Boeufs',
    description: 'Objectif : croissance rapide et carcasse de qualité.',
    icon: Icons.agriculture,
    color: Color(0xFF4B2E2A),
    details: [
      'Ration riche en énergie (maïs, manioc, drêches)',
      'Fibres : 15–20%',
      'Eau : 40–60 L/jour',
    ],
    astuce: 'Ajouter du sel et bloc minéral pour stimuler l’appétit.',
  ),
  ConseilNutrition(
    titre: 'Gestion alimentaire en saison sèche',
    categorie: 'Boeufs',
    description: 'La baisse de qualité des pâturages réduit la croissance.',
    icon: Icons.grass,
    color: Color(0xFF4B2E2A),
    details: [
      'Utiliser les résidus agricoles (son, fanes, tiges)',
      'Introduire l’urée-mélasse pour compenser les carences',
    ],
    astuce: 'Ensiler le maïs ou sorgho pendant la saison pluvieuse.',
  ),

  // ----------------------------------------------------------
  // LAPINS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Alimentation des lapins en croissance',
    categorie: 'Lapins',
    description: 'Le système digestif du lapin est très sensible.',
    icon: Icons.cruelty_free,
    color: Color(0xFF059669),
    details: [
      'Granulés 16–18% protéines',
      'Foin abondant pour éviter les diarrhées',
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
      'Aliment enrichi en énergie',
      'Vitamine E et sélénium pour la fertilité',
    ],
    astuce: 'Ajouter un peu de luzerne pour stimuler la lactation.',
  ),

  // ----------------------------------------------------------
  // CONSEILS GENERAUX - TOUS
  // ----------------------------------------------------------
  ConseilNutrition(
    titre: 'Qualité de l’eau',
    categorie: 'Tous',
    description: 'L’eau représente plus de 60% des performances.',
    icon: Icons.water_drop,
    color: Color(0xFF0EA5E9),
    details: [
      'Eau fraîche et propre en permanence',
      'Nettoyer les abreuvoirs chaque jour',
    ],
    astuce: 'Une baisse de consommation d’eau = premier signe de maladie.',
  ),
  ConseilNutrition(
    titre: 'Compléments minéraux et vitaminiques',
    categorie: 'Tous',
    description: 'Indispensables pour la croissance et l’immunité.',
    icon: Icons.science,
    color: Color(0xFF8B5CF6),
    details: [
      'Calcium, phosphore, sodium, zinc, sélénium',
      'Vitamine A, D, E essentielle pour la reproduction',
    ],
    astuce: 'Utiliser un CMV adapté à chaque espèce.',
  ),
];

List<ConseilNutrition> get _conseilsFiltres {
  if (_selectedCategory == 'Tous') return _conseils;
  return _conseils.where((c) => c.categorie == _selectedCategory).toList();
}













































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
// 📁 Créer ce fichier : lib/screens/home/formation_page.dart

import 'package:bangfeed/screens/formation/porcs/nutri_porc_avanced.dart';
import 'package:bangfeed/screens/formation/porcs/porc_moderne.dart';
import 'package:bangfeed/screens/formation/volailles/biosecurite_avicuture.dart';
import 'package:bangfeed/screens/formation/volailles/chairs/chaire_45jours.dart';
import 'package:bangfeed/screens/formation/volailles/pondeuses/max_product.dart';
import 'package:flutter/material.dart';

class FormationPage extends StatefulWidget {
  const FormationPage({super.key});

  @override
  State<FormationPage> createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage> {
  String _selectedCategory = 'Tous';

  final List<String> _categories = [
    'Tous',
    'Porcs',
    'Volailles',
    // 'Bovins',
    // 'Petits ruminants',
    // 'Poissons',
    // 'Gestion',
  ];

  final List<Formation> _formations = [
    // PORCS
    Formation(
      titre: 'Élevage porcin moderne : du démarrage à lengraissement',
      categorie: 'Porcs',
      pageRoute: const ElevagePorcinModernePage(),  // 👈 LA PAGE DÉDIÉE


      duree: '2h 30min',
      niveau: 'Débutant',
      description: 'Apprenez toutes les bases pour réussir votre élevage de porcs.',
      modules: 12,
      icon: Icons.agriculture,
      color: Color(0xFFEA580C),
      contenu: [
        'Choix des races et sélection',
        'Construction des porcheries',
        'Alimentation par phase de croissance',
        'Gestion de la reproduction',
        'Prévention des maladies',
      ],
      formateur: 'Dr. Kouassi Jean',
      certifie: true,
    ),
    
    Formation(
      titre: 'Nutrition porcine avancée : formulation rentable',
      categorie: 'Porcs',
  pageRoute: const NutritionPorcineAvancedPage(),  // 👈 SA PROPRE PAGE


      duree: '3h 15min',
      niveau: 'Avancé',
      description: 'Maîtrisez la formulation daliments pour réduire vos coûts.',
      modules: 15,
      icon: Icons.science,
      color: Color(0xFFEA580C),
      contenu: [
        'Besoins nutritionnels par stade',
        'Formulation avec ingrédients locaux',
        'Calcul de lindice de consommation',
        'Supplémentation minérale',
        'Réduction des coûts alimentaires',
      ],
      formateur: 'Ing. Amadou Diallo',
      certifie: true,
    ),

    // VOLAILLES
    Formation(
      titre: 'Poulet de chair : 45 jours pour réussir',
      categorie: 'Volailles',
  pageRoute: const PouletDeChair45joursPage(),  // 👈 SA PROPRE PAGE


      duree: '2h 00min',
      niveau: 'Débutant',
      description: 'De larrivée des poussins à labattage : toutes les étapes.',
      modules: 10,
      icon: Icons.egg_alt,
      color: Color(0xFFFB923C),
      contenu: [
        'Préparation du poulailler',
        'Gestion des premiers jours',
        'Programme alimentaire optimal',
        'Vaccination et biosécurité',
        'Calcul de rentabilité',
      ],
      formateur: 'Dr. Fatou Ndiaye',
      certifie: true,
    ),

    Formation(
      titre: 'Poules pondeuses : maximiser la production',
      categorie: 'Volailles',
  pageRoute: const PondeuseMaxProductPage(),  // 👈 SA PROPRE PAGE

      
      duree: '2h 45min',
      niveau: 'Intermédiaire',
      description: 'Techniques pour obtenir plus de 90% de ponte.',
      modules: 13,
      icon: Icons.egg,
      color: Color(0xFFFB923C),
      contenu: [
        'Démarrage et poulettes',
        'Programme lumineux optimal',
        'Alimentation pour la ponte',
        'Gestion de la chaleur',
        'Qualité des œufs et tri',
      ],
      formateur: 'Ing. Koné Brice',
      certifie: true,
    ),

    Formation(
      titre: 'Biosécurité en aviculture',
      categorie: 'Volailles',
  pageRoute: const BiosecuriteAviculturePage(),  // 👈 SA PROPRE PAGE
      duree: '1h 30min',
      niveau: 'Tous niveaux',
      description: 'Protégez votre élevage des maladies dévastatrices.',
      modules: 8,
      icon: Icons.health_and_safety,
      color: Color(0xFFFB923C),
      contenu: [
        'Principes de biosécurité',
        'Contrôle des entrées et sorties',
        'Nettoyage et désinfection',
        'Gestion des visiteurs',
        'Protocoles durgence',
      ],
      formateur: 'Dr. Mireille Assomo',
      certifie: false,
    ),

    // // BOVINS
    // Formation(
    //   titre: 'Élevage laitier moderne en zone tropicale',
    //   categorie: 'Bovins',
    //   duree: '3h 00min',
    //   niveau: 'Intermédiaire',
    //   description: 'Optimisez votre production laitière malgré les contraintes.',
    //   modules: 14,
    //   icon: Icons.water_drop,
    //   color: Color(0xFF4B2E2A),
    //   contenu: [
    //     'Choix de races adaptées',
    //     'Alimentation des vaches laitières',
    //     'Gestion de la reproduction',
    //     'Traite et hygiène du lait',
    //     'Transformation et commercialisation',
    //   ],
    //   formateur: 'Dr. Ibrahim Touré',
    //   certifie: true,
    // ),

    // Formation(
    //   titre: 'Engraissement intensif de bovins',
    //   categorie: 'Bovins',
    //   duree: '2h 20min',
    //   niveau: 'Débutant',
    //   description: 'Stratégies pour un engraissement rapide et rentable.',
    //   modules: 11,
    //   icon: Icons.trending_up,
    //   color: Color(0xFF4B2E2A),
    //   contenu: [
    //     'Sélection des animaux',
    //     'Rations dengraissement',
    //     'Suivi de croissance',
    //     'Gestion sanitaire',
    //     'Commercialisation optimale',
    //   ],
    //   formateur: 'Ing. Moussa Traoré',
    //   certifie: true,
    // ),

    // // PETITS RUMINANTS
    // Formation(
    //   titre: 'Élevage de chèvres laitières',
    //   categorie: 'Petits ruminants',
    //   duree: '2h 10min',
    //   niveau: 'Débutant',
    //   description: 'De la reproduction à la traite : un élevage rentable.',
    //   modules: 10,
    //   icon: Icons.pets,
    //   color: Color(0xFFD97706),
    //   contenu: [
    //     'Races laitières performantes',
    //     'Alimentation pour la production',
    //     'Reproduction et sélection',
    //     'Traite et conservation du lait',
    //     'Transformation (fromage, yaourt)',
    //   ],
    //   formateur: 'Dr. Aminata Sow',
    //   certifie: true,
    // ),

    // Formation(
    //   titre: 'Moutons : reproduction et santé',
    //   categorie: 'Petits ruminants',
    //   duree: '1h 50min',
    //   niveau: 'Intermédiaire',
    //   description: 'Maîtrisez la reproduction pour augmenter votre cheptel.',
    //   modules: 9,
    //   icon: Icons.pets_outlined,
    //   color: Color(0xFFEA580C),
    //   contenu: [
    //     'Cycle de reproduction',
    //     'Flushing et préparation',
    //     'Agnelage et soins aux nouveaux-nés',
    //     'Prévention des parasites',
    //     'Gestion du troupeau',
    //   ],
    //   formateur: 'Ing. Abdoulaye Ba',
    //   certifie: false,
    // ),

    // // POISSONS
    // Formation(
    //   titre: 'Pisciculture en étang : du bassin au marché',
    //   categorie: 'Poissons',
    //   duree: '2h 30min',
    //   niveau: 'Débutant',
    //   description: 'Créez et gérez votre ferme piscicole avec succès.',
    //   modules: 12,
    //   icon: Icons.water,
    //   color: Color(0xFF38BDF8),
    //   contenu: [
    //     'Construction et aménagement des étangs',
    //     'Choix des espèces (tilapia, clarias)',
    //     'Alimentation et formulation',
    //     'Qualité de leau',
    //     'Récolte et commercialisation',
    //   ],
    //   formateur: 'Dr. Yao Kouamé',
    //   certifie: true,
    // ),

    // Formation(
    //   titre: 'Aquaponie : poissons + légumes',
    //   categorie: 'Poissons',
    //   duree: '1h 45min',
    //   niveau: 'Avancé',
    //   description: 'Système intégré pour doubler vos revenus.',
    //   modules: 8,
    //   icon: Icons.eco,
    //   color: Color(0xFF38BDF8),
    //   contenu: [
    //     'Principes de laquaponie',
    //     'Conception du système',
    //     'Équilibre poissons-plantes',
    //     'Cultures adaptées',
    //     'Gestion et maintenance',
    //   ],
    //   formateur: 'Ing. Marie-Claire Ndong',
    //   certifie: false,
    // ),

    // // GESTION
    // Formation(
    //   titre: 'Gestion dentreprise agricole',
    //   categorie: 'Gestion',
    //   duree: '3h 00min',
    //   niveau: 'Tous niveaux',
    //   description: 'Transformez votre élevage en entreprise rentable.',
    //   modules: 15,
    //   icon: Icons.business,
    //   color: Color(0xFF8B5CF6),
    //   contenu: [
    //     'Comptabilité simplifiée',
    //     'Calcul des coûts de production',
    //     'Stratégies de commercialisation',
    //     'Accès au financement',
    //     'Développement de la clientèle',
    //   ],
    //   formateur: 'MBA. Sophie Mensah',
    //   certifie: true,
    // ),

    // Formation(
    //   titre: 'Marketing de produits agricoles',
    //   categorie: 'Gestion',
    //   duree: '2h 00min',
    //   niveau: 'Intermédiaire',
    //   description: 'Vendez mieux et plus cher vos produits.',
    //   modules: 10,
    //   icon: Icons.campaign,
    //   color: Color(0xFF8B5CF6),
    //   contenu: [
    //     'Identification des marchés porteurs',
    //     'Stratégies de différenciation',
    //     'Packaging et présentation',
    //     'Marketing digital agricole',
    //     'Fidélisation des clients',
    //   ],
    //   formateur: 'Ing. Georges Eboua',
    //   certifie: false,
    // ),
  ];

  List<Formation> get _formationsFiltrees {
    if (_selectedCategory == 'Tous') return _formations;
    return _formations.where((f) => f.categorie == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEA580C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Formations',
          style: TextStyle(
            color: Colors.white,
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
                        color: const Color(0xFFEA580C).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.video_library,
                        color: Color(0xFFEA580C),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Apprenez de nos experts pour réussir votre élevage',
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
                    selectedColor: const Color(0xFFEA580C),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF4B2E2A),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? const Color(0xFFEA580C) : Colors.grey.shade300,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Liste des formations
          Expanded(
            child: _formationsFiltrees.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'Aucune formation pour cette catégorie',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _formationsFiltrees.length,
                    itemBuilder: (context, index) {
                      final formation = _formationsFiltrees[index];
                      return _buildFormationCard(formation);
                    },
                  ),
          ),
        ],
      ),
    );
  }




  Widget _buildFormationCard(Formation formation) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _showFormationDetails(formation),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: formation.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(formation.icon, size: 28, color: formation.color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            formation.titre,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4B2E2A),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (formation.certifie)
                          const Icon(Icons.verified, color: Color(0xFFEA580C), size: 20),
                      ],
                    ),
                    const SizedBox(height: 6),



                    // Row(
                    //   children: [
                    //     Container(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    //       decoration: BoxDecoration(
                    //         color: formation.color.withOpacity(0.1),
                    //         borderRadius: BorderRadius.circular(6),
                    //       ),
                    //       child: Text(
                    //         formation.niveau,
                    //         style: TextStyle(
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.w600,
                    //           color: formation.color,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 8),
                    //     Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       formation.duree,
                    //       style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    //     ),
                    //     const SizedBox(width: 8),
                    //     Icon(Icons.play_circle_outline, size: 14, color: Colors.grey[600]),
                    //     const SizedBox(width: 4),
                    //     Text(
                    //       '${formation.modules} modules',
                    //       style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    //     ),
                    //   ],
                    // ),

Wrap(
  spacing: 8,
  runSpacing: 6,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: formation.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        formation.niveau,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: formation.color,
        ),
      ),
    ),

    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          formation.duree,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    ),

    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.play_circle_outline, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          '${formation.modules} modules',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    ),
  ],
)


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

  // void _showFormationDetails(Formation formation) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => DraggableScrollableSheet(
  //       initialChildSize: 0.85,
  //       minChildSize: 0.5,
  //       maxChildSize: 0.95,
  //       builder: (context, scrollController) => Container(
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  //         ),
  //         child: Column(
  //           children: [
  //             // Handle
  //             Container(
  //               margin: const EdgeInsets.symmetric(vertical: 12),
  //               width: 40,
  //               height: 4,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey[300],
  //                 borderRadius: BorderRadius.circular(2),
  //               ),
  //             ),

  //             Expanded(
  //               child: ListView(
  //                 controller: scrollController,
  //                 padding: const EdgeInsets.all(24),
  //                 children: [
  //                   // Header avec icône
  //                   Row(
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.all(16),
  //                         decoration: BoxDecoration(
  //                           color: formation.color.withOpacity(0.15),
  //                           borderRadius: BorderRadius.circular(16),
  //                         ),
  //                         child: Icon(formation.icon, size: 36, color: formation.color),
  //                       ),
  //                       const SizedBox(width: 16),
  //                       Expanded(
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               formation.titre,
  //                               style: const TextStyle(
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Color(0xFF4B2E2A),
  //                               ),
  //                             ),
  //                             const SizedBox(height: 6),
  //                             Row(
  //                               children: [
  //                                 Container(
  //                                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //                                   decoration: BoxDecoration(
  //                                     color: formation.color.withOpacity(0.1),
  //                                     borderRadius: BorderRadius.circular(8),
  //                                   ),
  //                                   child: Text(
  //                                     formation.niveau,
  //                                     style: TextStyle(
  //                                       fontSize: 12,
  //                                       fontWeight: FontWeight.w600,
  //                                       color: formation.color,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 if (formation.certifie) ...[
  //                                   const SizedBox(width: 8),
  //                                   Container(
  //                                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                                     decoration: BoxDecoration(
  //                                       // color: const Color(0xFFEA580C).withOpacity(0.1),
  //                                       color: const Color(0xFFEA580C).withOpacity(0.1),
  //                                       borderRadius: BorderRadius.circular(8),
  //                                     ),
  //                                     child: Row(
  //                                       mainAxisSize: MainAxisSize.min,
  //                                       children: const [
  //                                         Icon(Icons.verified, size: 14, color: Color(0xFFEA580C)),
  //                                         SizedBox(width: 4),
  //                                         Text(
  //                                           'Certifiée',
  //                                           style: TextStyle(
  //                                             fontSize: 11,
  //                                             fontWeight: FontWeight.w600,
  //                                             color: Color(0xFFEA580C),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),

  //                   const SizedBox(height: 24),

  //                   // Informations rapides
  //                   Row(
  //                     children: [
  //                       _buildInfoChip(Icons.access_time, formation.duree),
  //                       const SizedBox(width: 12),
  //                       _buildInfoChip(Icons.play_circle_outline, '${formation.modules} modules'),
  //                     ],
  //                   ),

  //                   const SizedBox(height: 20),

  //                   // Description
  //                   Text(
  //                     formation.description,
  //                     style: const TextStyle(
  //                       fontSize: 16,
  //                       color: Color(0xFF4B2E2A),
  //                       height: 1.5,
  //                     ),
  //                   ),

  //                   const SizedBox(height: 24),

  //                   // Formateur
  //                   Row(
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.all(10),
  //                         decoration: BoxDecoration(
  //                           color: Colors.grey[200],
  //                           shape: BoxShape.circle,
  //                         ),
  //                         child: const Icon(Icons.person, size: 24, color: Color(0xFF4B2E2A)),
  //                       ),
  //                       const SizedBox(width: 12),
  //                       Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           const Text(
  //                             'Formateur',
  //                             style: TextStyle(fontSize: 12, color: Colors.grey),
  //                           ),
  //                           Text(
  //                             formation.formateur,
  //                             style: const TextStyle(
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.w600,
  //                               color: Color(0xFF4B2E2A),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),

  //                   const SizedBox(height: 24),

  //                   // Contenu de la formation
  //                   const Text(
  //                     'Ce que vous allez apprendre',
  //                     style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold,
  //                       color: Color(0xFF4B2E2A),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 12),

  //                   ...formation.contenu.map((item) => Padding(
  //                         padding: const EdgeInsets.only(bottom: 12),
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Container(
  //                               margin: const EdgeInsets.only(top: 6),
  //                               padding: const EdgeInsets.all(4),
  //                               decoration: BoxDecoration(
  //                                 color: formation.color.withOpacity(0.2),
  //                                 shape: BoxShape.circle,
  //                               ),
  //                               child: Icon(
  //                                 Icons.check,
  //                                 size: 14,
  //                                 color: formation.color,
  //                               ),
  //                             ),
  //                             const SizedBox(width: 12),
  //                             Expanded(
  //                               child: Text(
  //                                 item,
  //                                 style: const TextStyle(
  //                                   fontSize: 15,
  //                                   color: Color(0xFF4B2E2A),
  //                                   height: 1.5,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )),

  //                   const SizedBox(height: 24),

  //                   // Bouton daction
  //                   ElevatedButton.icon(
  //                     onPressed: () {
  //                       // TODO: Implémenter laccès à la formation
  //                       ScaffoldMessenger.of(context).showSnackBar(
  //                         const SnackBar(
  //                           content: Text('Fonctionnalité bientôt disponible !'),
  //                           backgroundColor: Color(0xFFEA580C),
  //                         ),
  //                       );
  //                     },
  //                     icon: const Icon(Icons.play_arrow, color: Colors.white),
  //                     label: const Text(
  //                       'Commencer la formation',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFFEA580C),
  //                       padding: const EdgeInsets.symmetric(vertical: 16),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(12),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }












void _showFormationDetails(Formation formation) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (modalContext) => DraggableScrollableSheet(
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
                          color: formation.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(formation.icon, size: 36, color: formation.color),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formation.titre,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B2E2A),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: formation.color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    formation.niveau,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: formation.color,
                                    ),
                                  ),
                                ),
                                if (formation.certifie) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEA580C).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.verified, size: 14, color: Color(0xFFEA580C)),
                                        SizedBox(width: 4),
                                        Text(
                                          'Certifiée',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFEA580C),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),



                  // Informations rapides
                  // Row(
                  //   children: [
                  //     _buildInfoChip(Icons.access_time, formation.duree),
                  //     const SizedBox(width: 12),
                  //     _buildInfoChip(Icons.play_circle_outline, '${formation.modules} modules'),
                  //   ],
                  // ),
Wrap(
  spacing: 12,
  runSpacing: 12,
  children: [
    _buildInfoChip(Icons.access_time, formation.duree),
    _buildInfoChip(Icons.play_circle_outline, '${formation.modules} modules'),
  ],
),



                  const SizedBox(height: 20),

                  // Description
                  Text(
                    formation.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4B2E2A),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Formateur
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, size: 24, color: Color(0xFF4B2E2A)),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Formateur',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            formation.formateur,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4B2E2A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Contenu de la formation
                  const Text(
                    'Ce que vous allez apprendre',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...formation.contenu.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: formation.color.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 14,
                                color: formation.color,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item,
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

                  // Bouton d'action
                  ElevatedButton.icon(
                    // onPressed: () {
                    //   // Fermer le modal d'abord
                    //   Navigator.pop(modalContext);
                      
                    
                    //   // Afficher le SnackBar avec le context parent
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Fonctionnalité bientôt disponible !'),
                    //       backgroundColor: Color(0xFFEA580C),
                    //     ),
                    //   );
                    // },

onPressed: () {
  Navigator.pop(modalContext);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => formation.pageRoute,  // 👈 SIMPLE !
    ),
  );
},
                   
  icon: const Icon(Icons.play_arrow, color: Colors.white),
  label: const Text(
    'Commencer la formation',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  iconAlignment: IconAlignment.start,  // 👈 AJOUTE CETTE LIGNE
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFEA580C),
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
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






  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF4B2E2A)),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
          ),
        ],
      ),
    );
  }
}

class Formation {
  final String titre;
  final String categorie;

    final Widget pageRoute;  // 👈 AJOUTER CECI

  final String duree;
  final String niveau;
  final String description;
  final int modules;
  final IconData icon;
  final Color color;
  final List<String> contenu;
  final String formateur;
  final bool certifie;

  Formation({
    required this.titre,
    required this.categorie,
    required this.pageRoute,
    required this.duree,
    required this.niveau,
    required this.description,
    required this.modules,
    required this.icon,
    required this.color,
    required this.contenu,
    required this.formateur,
    required this.certifie,
  });
}
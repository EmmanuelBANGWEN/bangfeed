import 'dart:async';
import 'dart:math';
import 'package:bangfeed/screens/formulation_details.dart';
import 'package:bangfeed/screens/home/accountpage.dart';
import 'package:bangfeed/screens/home/conseils.dart';
import 'package:bangfeed/screens/formation_page.dart';
import 'package:bangfeed/screens/home/market.dart';
import 'package:bangfeed/screens/payer.dart';
import 'package:bangfeed/screens/select_animal.dart';
import 'package:bangfeed/services/firestore_service.dart';
import 'package:bangfeed/services/premium_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/formulation_provider.dart';
import '../login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController _astuceController = PageController();
  int _currentAstuce = 0;
  late Timer _timer;
  bool _isPremium = false;

  // final List<String> astuces = [

  //   "Assurez-vous que les animaux aient toujours de l'eau propre !",
  //   "Surveillez régulièrement le poids et la santé des animaux.",
  //   "Nettoyez les enclos pour éviter les maladies.",
  //   "Offrez un espace suffisant pour chaque animal.",
  // ];





    final List<String> astuces = [
      "Assurez-vous que les animaux aient toujours de l'eau propre et fraîche.",
      "Surveillez régulièrement le poids et la santé des animaux.",
      "Nettoyez et désinfectez les enclos pour prévenir les maladies.",
      "Offrez un espace suffisant pour chaque animal pour réduire le stress.",
      "Variez l’alimentation pour maximiser la croissance et la production.",
      "Complétez les rations avec des minéraux et vitamines adaptés.",
      "Surveillez l'apparition de parasites et traitez-les à temps.",
      "Séparez les animaux malades pour éviter la propagation des maladies.",
      "Assurez-vous que les abris sont bien ventilés et protégés de l’humidité.",
      "Maintenez un programme de vaccination régulier selon l’espèce.",
      "Fournissez des aliments à bonne qualité et stockez-les correctement.",
      "Évitez de donner des restes de nourriture moisis ou périmés.",
      "Surveillez la consommation d’eau et d’aliments pour détecter des problèmes tôt.",
      "Utilisez des prébiotiques et probiotiques pour améliorer la digestion.",
      "Maintenez un suivi de reproduction et d’accouplement pour optimiser la production.",
      "Nettoyez les mangeoires et abreuvoirs tous les jours.",
      "Faites une rotation des pâturages pour éviter le surpâturage.",
      "Utilisez des litières propres et sèches pour le confort et la santé.",
      "Contrôlez la densité animale pour éviter le stress et les blessures.",
      "Gardez un registre précis de l’alimentation et des traitements vétérinaires.",
      "Surveillez les signes de carences nutritionnelles.",
      "Introduisez progressivement les changements alimentaires pour éviter les troubles digestifs.",
      "Évitez les mélanges de nourriture toxiques ou inadaptés.",
      "Fournissez des abris pour protéger les animaux du soleil et des intempéries.",
      "Assurez un éclairage suffisant pour les volailles afin d’optimiser la ponte.",
      "Réduisez le stress lors des manipulations et du transport.",
      "Surveillez la qualité du fourrage et évitez la moisissure.",
      "Contrôlez la reproduction pour éviter la consanguinité.",
      "Faites attention aux signes de fatigue ou de maladie chez les jeunes animaux.",
      "Fournissez des compléments calciques pour les animaux en croissance ou les pondeuses.",
      "Prévoyez des zones de repos calmes pour les animaux.",
      "Appliquez des programmes de prévention contre les parasites externes.",
      "Utilisez des probiotiques pour renforcer le système immunitaire des animaux.",
      "Évitez le suralimentaire pour prévenir l’obésité et les troubles digestifs.",
      "Séparez les animaux par âge ou stade physiologique pour mieux gérer l’alimentation.",
      "Faites des bilans de santé réguliers avec un vétérinaire local.",
      "Gardez l’environnement sec pour réduire les infections fongiques.",
      "Introduisez des fibres dans l’alimentation pour une meilleure digestion.",
      "Assurez la qualité et la fraîcheur des céréales et protéines végétales.",
      "Évitez le mélange de différents types d’animaux dans le même enclos si possible.",
      "Utilisez des vaccinations adaptées à la région et aux espèces.",
      "Contrôlez régulièrement les taux de croissance et ajustez l’alimentation.",
      "Apprenez à identifier rapidement les maladies fréquentes dans votre zone.",
      "Évitez le stress thermique en période de forte chaleur ou de froid.",
      "Protégez les jeunes animaux des infections par les adultes.",
      "Recyclez et composte les litières de manière hygiénique.",
      "Fournissez des minéraux à l’eau ou dans l’alimentation selon les besoins.",
      "Maintenez une routine stable pour réduire le stress des animaux.",
      "Enseignez aux employés les bonnes pratiques de manipulation et d’alimentation.",
      "Surveillez les signes de déshydratation, surtout en saison sèche.",
      "Évitez les mélanges alimentaires dangereux pour la santé des animaux."
    ];

  // Future<bool> checkPremium() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) return false; // pas connecté

  //     final data = await FirestoreService().getUserData(user.uid);
  //     if (data == null) return false;
  //     return data['isPremium'] ?? false;
  //   } catch (e) {
  //     print('Erreur checkPremium: $e');
  //     return false;
  //   }
  // }

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       if (_astuceController.hasClients) {
//         _currentAstuce = (_currentAstuce + 1) % astuces.length;
//         _astuceController.animateToPage(
//           _currentAstuce,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });

//       // Appel et mise à jour UI si besoin
//     // checkPremium().then((isP) {
//     //   print("PREMIUM STATUS: $isP");
//     //   setState(() {
//     //     _isPremium = isP;
//     //   });
//     // });

// PremiumService().checkPremiumStatus().then((isP) {
//   print("PREMIUM STATUS: $isP");
//   setState(() {
//     _isPremium = isP;
//   });
// });


//   }


  static List<String> astucesAleatoires = [];




@override
void initState() {
  super.initState();

  if (astucesAleatoires.isEmpty) {
    astucesAleatoires = List.from(astuces)..shuffle(Random());
  }

  // ✅ CORRECTION : Initialise directement sans vérifier isActive
  _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    if (_astuceController.hasClients) {
      _currentAstuce = (_currentAstuce + 1) % astucesAleatoires.length;
      _astuceController.animateToPage(
        _currentAstuce,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  });

  PremiumService().checkPremiumStatus().then((isP) {
    print("PREMIUM STATUS: $isP");
    setState(() {
      _isPremium = isP;
    });
  });
}





  @override
  void dispose() {
    _timer.cancel();
    _astuceController.dispose();
    super.dispose();
  }

  // @override
  // void dispose() {
  //   // ✅ NE PAS annuler le timer ni dispose le controller ici
  //   // Ils doivent persister entre les pages
  //   super.dispose();
  // }


  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 48, color: Color(0xFFD97706)),
              const SizedBox(height: 16),
              const Text(
                'Déconnexion',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Voulez-vous vraiment vous déconnecter de votre compte ?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF4B2E2A)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Annuler'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _logout(context);
                    },
                    child: const Text('Se déconnecter'),
                  ),












                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


Widget _buildPremiumBadge() {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      gradient: _isPremium
          ? const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : LinearGradient(
              colors: [Colors.grey[300]!, Colors.grey[400]!],
            ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: _isPremium
          ? [
              BoxShadow(
                color: Colors.orange.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]
          : [],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _isPremium ? Icons.diamond : Icons.lock_outline,
          color: _isPremium ? Colors.white : Colors.grey[700],
          size: 16,
        ),
        const SizedBox(width: 6),
        Text(
          _isPremium ? 'PREMIUM' : 'GRATUIT',
          style: TextStyle(
            color: _isPremium ? Colors.white : Colors.grey[700],
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    final formulations = context.watch<FormulationProvider>().formulations;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      
      
































// 📍 ÉTAPE 2 : Modifie ton AppBar (remplace l'AppBar actuel vers ligne 230)
// Remplace UNIQUEMENT la partie "appBar:" par ceci :

appBar: AppBar(
  backgroundColor: const Color(0xFFD97706),
  elevation: 0,
  title: const Text(
    'BangFeed',
    style: TextStyle(
      color: Color(0xFF4B2E2A),
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  actions: [
    // ✅ BADGE PREMIUM ICI
    _buildPremiumBadge(),
    
  
PopupMenuButton<String>(
  icon: const Icon(Icons.more_vert, color: Colors.black54),
  itemBuilder: (context) => [

    const PopupMenuItem(
      value: 'account',
      child: Row(
        children: [
          Icon(Icons.payment, color: Colors.orange),
          SizedBox(width: 10),
          Text("Mon compte"),
        ],
      ),
    ),
    const PopupMenuDivider(),
    const PopupMenuItem(
      value: 'logout',
      child: Row(
        children: [
          Icon(Icons.logout, color: Colors.red),
          SizedBox(width: 10),
          Text("Se déconnecter"),
        ],
      ),
    ),
  ],
  onSelected: (value) {
    switch (value) {

      case 'account':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountPage()),
        );
        break;
      case 'logout':
      _confirmLogout(context); // ✅ Appelle ta fonction ici
        break;
    }
  },
)






  ],
),







      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER FORMULATIONS ---
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mes Formulations',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B2E2A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  
                  '${formulations.length} formulation${formulations.length > 1 ? 's' : ''} créée${formulations.length > 1 ? 's' : ''}',
                  style: const TextStyle(fontSize: 16, color: Color(0xFF4B2E2A)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // // --- ASTUCE DU JOUR ---
          // Container(
          //   height: 60,
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(16),
          //     boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
          //   ),
          //   child: PageView.builder(
          //     controller: _astuceController,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: astuces.length,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           const Icon(Icons.lightbulb, color: Color(0xFFD97706), size: 32),
          //           const SizedBox(width: 12),
          //           Expanded(
          //             child: Text(
          //               astuces[index],
          //               style: const TextStyle(fontSize: 16, color: Color(0xFF4B2E2A)),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),


          // ✅ ASTUCE DU JOUR (avec astuces aléatoires)
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
            ),
            child: PageView.builder(
              controller: _astuceController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: astucesAleatoires.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Color(0xFFD97706), size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        astucesAleatoires[index],
                        style: const TextStyle(fontSize: 16, color: Color(0xFF4B2E2A)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),



          const SizedBox(height: 16),

          // --- BOUTONS CONSEILS ET MARCHÉ ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(


                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ConseilsPage()),
                    );
                  },




                    icon: const Icon(Icons.school, color: Colors.white),
                    label: const Text(
                      "Conseils",
                      style: TextStyle(color: Colors.white),

                      ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (_) => const MarketPage()),
                      MaterialPageRoute(builder: (_) => const FormationPage()),
                    );
                  },
                    icon: const Icon(Icons.store, color: Colors.white),
                    label: const Text(
                      
                      // "Marché",
                      "Formations",
                    style: TextStyle(color: Colors.white),

                    
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD97706),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),



















          // ✅ 3 BOUTONS : CONSEILS, FORMATIONS, MARCHÉ
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: _buildActionButton(
          //           context,
          //           icon: Icons.school,
          //           label: "Conseils",
          //           color: const Color(0xFFD97706),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (_) => const ConseilsPage()),
          //             );
          //           },
          //         ),
          //       ),
          //       const SizedBox(width: 12),
          //       Expanded(
          //         child: _buildActionButton(
          //           context,
          //           icon: Icons.video_library,
          //           label: "Formations",
          //           color: const Color(0xFFEA580C),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (_) => const FormationPage()),
          //             );
          //           },
          //         ),
          //       ),
          //       const SizedBox(width: 12),
          //       Expanded(
          //         child: _buildActionButton(
          //           context,
          //           icon: Icons.store,
          //           label: "Marché",
          //           color: const Color(0xFF0EA5E9),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (_) => const MarketPage()),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),


          const SizedBox(height: 16),

          // --- CONTENU FORMULATIONS ---
          Expanded(
            child: formulations.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: formulations.length,
                    itemBuilder: (context, index) {
                      final f = formulations[index];
                      final animal = f.animalType.toLowerCase();
                      IconData icon = Icons.pets;
                      Color color = const Color(0xFFD97706);

                      if (animal.contains('porc')) {
                        icon = Icons.agriculture;
                        color = const Color(0xFFEA580C);
                      } else if (animal.contains('poulet') || animal.contains('volaille')) {
                        icon = Icons.egg_alt;
                        color = const Color(0xFFFB923C);
                      } else if (animal.contains('bovin') || animal.contains('vache')) {
                        icon = Icons.agriculture_outlined;
                        color = const Color(0xFF4B2E2A);
                      }

                      return _buildFormulationCard(context, f, icon, color);
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AnimalSelectionPage()),
          );
        },
        backgroundColor: const Color(0xFFD97706),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Nouvelle formulation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  
  // ✅ Bouton d'action unifié
  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /// --- WIDGETS SECONDAIRES ---
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.science_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            'Aucune formulation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Appuyez sur + pour créer votre première formulation',
            style: TextStyle(fontSize: 14, color: Color(0xFF4B2E2A)),
          ),
        ],
      ),
    );
  }

  Widget _buildFormulationCard(BuildContext context, dynamic f, IconData icon, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FormulationDetailPage(formulation: f)),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(f.animalType,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4B2E2A))),
                    const SizedBox(height: 4),
                    Text(f.growthStage, style: const TextStyle(fontSize: 14, color: Color(0xFF4B2E2A))),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money, size: 16, color: Color(0xFFD97706)),
                        const SizedBox(width: 4),
                        Text('${f.totalCost.toStringAsFixed(0)} FCFA',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4B2E2A))),
                      ],
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
}

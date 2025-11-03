import 'package:bangfeed/screens/formulation_details.dart';
import 'package:bangfeed/screens/select_animal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }


// void _confirmLogout(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Confirmation'),
//       content: const Text('Voulez-vous vraiment vous déconnecter ?'),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(), // Annuler
//           child: const Text('Annuler'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Fermer le dialog
//             _logout(context);           // Appel réel du logout
//           },
//           child: const Text('Déconnexion'),
//         ),
//       ],
//     ),
//   );
// }














void _confirmLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4B2E2A),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Annuler'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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






  @override
  Widget build(BuildContext context) {
    final formulations = context.watch<FormulationProvider>().formulations;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
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
          IconButton(
            onPressed: () => _confirmLogout(context),
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Déconnexion',
          )
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER ---
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
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF4B2E2A),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // --- CONTENU PRINCIPAL ---
          Expanded(
            child: formulations.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: formulations.length,
                    itemBuilder: (context, index) {
                      final f = formulations[index];

                      // Style selon le type d’animal
                      final animal = f.animalType.toLowerCase();
                      IconData icon = Icons.pets;
                      Color color = const Color(0xFFD97706); // orange de base

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

      // --- BOUTON FLOTTANT ---
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
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF4B2E2A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormulationCard(
      BuildContext context, dynamic f, IconData icon, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FormulationDetailPage(formulation: f),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icône
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

              // Infos principales
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      f.animalType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4B2E2A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      f.growthStage,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4B2E2A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money,
                            size: 16, color: Color(0xFFD97706)),
                        const SizedBox(width: 4),
                        Text(
                          '${f.totalCost.toStringAsFixed(0)} FCFA',
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
              ),

              // Flèche
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

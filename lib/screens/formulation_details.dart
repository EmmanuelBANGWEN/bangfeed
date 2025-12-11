import 'package:bangfeed/services/premium_service.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bangfeed/services/firestore_service.dart';
import '../models/formulation.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';

class FormulationDetailPage extends StatefulWidget {
  final Formulation formulation;

  const FormulationDetailPage({
    super.key,
    required this.formulation,
  });

  @override
  State<FormulationDetailPage> createState() => _FormulationDetailPageState();
}

class _FormulationDetailPageState extends State<FormulationDetailPage> {
  bool _isPremium = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPremiumStatus();
  }

  // Future<void> _checkPremiumStatus() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) {
  //       setState(() {
  //         _isPremium = false;
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     final data = await FirestoreService().getUserData(user.uid);
  //     setState(() {
  //       _isPremium = data?['isPremium'] ?? false;
  //       _isLoading = false;
  //     });
      
  //     print("✅ PREMIUM STATUS dans FormulationDetailPage: $_isPremium");
  //   } catch (e) {
  //     print('❌ Erreur checkPremium: $e');
  //     setState(() {
  //       _isPremium = false;
  //       _isLoading = false;
  //     });
  //   }
  // }




Future<void> _checkPremiumStatus() async {
  try {
    final isPremium = await PremiumService().checkPremiumStatus();
    setState(() {
      _isPremium = isPremium;
      _isLoading = false;
    });
    
    print("✅ PREMIUM STATUS dans FormulationDetailPage: $_isPremium");
  } catch (e) {
    print('❌ Erreur checkPremium: $e');
    setState(() {
      _isPremium = false;
      _isLoading = false;
    });
  }
}



  // Calculs
  double get totalWeight => widget.formulation.ingredients.fold(
        0,
        (sum, ing) => sum + (ing.quantity ?? 0),
      );













  // Map<String, double> get nutritionalComposition {
  //   double totalProtein = 0;
  //   double totalEnergy = 0;

  //   for (var ing in widget.formulation.ingredients) {
  //     final weight = ing.quantity ?? 0;
  //     totalProtein += (ing.protein * weight) / 100;
  //     totalEnergy += (ing.energy * weight) / 100;
  //   }

  //   final proteinPercent = totalWeight > 0 ? (totalProtein / totalWeight) * 100 : 0.0;
  //   final energyPercent = totalWeight > 0 ? (totalEnergy / totalWeight) * 100 : 0.0;

  //   return {
  //     'Protéines': proteinPercent.toDouble(),
  //     'Énergie': energyPercent.toDouble(),
  //   };
  // }






Map<String, double> get nutritionalComposition {
  double totalProtein = 0;
  double totalEnergy = 0;
  double totalCalcium = 0;      // ✅ AJOUT
  double totalPhosphore = 0;    // ✅ AJOUT
  double totalLysine = 0;       // ✅ AJOUT
  double totalMethionine = 0;   // ✅ AJOUT
  double totalFiber = 0;        // ✅ AJOUT
  double totalFat = 0;          // ✅ AJOUT

  for (var ing in widget.formulation.ingredients) {
    final weight = ing.quantity ?? 0;
    totalProtein += (ing.protein * weight) / 100;
    totalEnergy += (ing.energy * weight) / 100;
    totalCalcium += ((ing.calcium ?? 0) * weight) / 100;           // ✅ AJOUT
    totalPhosphore += ((ing.phosphore ?? 0) * weight) / 100;       // ✅ AJOUT
    totalLysine += ((ing.lysine ?? 0) * weight) / 100;             // ✅ AJOUT
    totalMethionine += ((ing.methionine ?? 0) * weight) / 100;     // ✅ AJOUT
    totalFiber += ((ing.fiber ?? 0) * weight) / 100;               // ✅ AJOUT
    totalFat += ((ing.fat ?? 0) * weight) / 100;                   // ✅ AJOUT
  }

  final proteinPercent = totalWeight > 0 ? (totalProtein / totalWeight) * 100 : 0.0;
  final energyPercent = totalWeight > 0 ? (totalEnergy / totalWeight) * 100 : 0.0;
  final calciumPercent = totalWeight > 0 ? (totalCalcium / totalWeight) * 100 : 0.0;           // ✅ AJOUT
  final phosphorePercent = totalWeight > 0 ? (totalPhosphore / totalWeight) * 100 : 0.0;       // ✅ AJOUT
  final lysinePercent = totalWeight > 0 ? (totalLysine / totalWeight) * 100 : 0.0;             // ✅ AJOUT
  final methioninePercent = totalWeight > 0 ? (totalMethionine / totalWeight) * 100 : 0.0;     // ✅ AJOUT
  final fiberPercent = totalWeight > 0 ? (totalFiber / totalWeight) * 100 : 0.0;               // ✅ AJOUT
  final fatPercent = totalWeight > 0 ? (totalFat / totalWeight) * 100 : 0.0;                   // ✅ AJOUT

  return {
    'Protéines': proteinPercent.toDouble(),
    'Énergie': energyPercent.toDouble(),
    'Calcium': calciumPercent.toDouble(),           // ✅ AJOUT
    'Phosphore': phosphorePercent.toDouble(),       // ✅ AJOUT
    'Lysine': lysinePercent.toDouble(),             // ✅ AJOUT
    'Méthionine': methioninePercent.toDouble(),     // ✅ AJOUT
    'Fibres': fiberPercent.toDouble(),              // ✅ AJOUT
    'Matières grasses': fatPercent.toDouble(),      // ✅ AJOUT
  };
}












  

  void _deleteFormulation(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer cette formulation ?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await context.read<FormulationProvider>().deleteFormulation(widget.formulation);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Formulation supprimée avec succès'),
            backgroundColor: Colors.red,
          ),
        );
        
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Détail formulation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: _isPremium
            ? [
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.white),
                  onPressed: () => _deleteFormulation(context),
                ),
              ]
            : null,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<FormulationProvider>(
              builder: (context, provider, child) {
                // Vérifier si l'utilisateur peut accéder à cette formulation
                final formulations = provider.formulations;
                final index = formulations.indexWhere(
                  (f) => f.key == widget.formulation.key,
                );

                // Si non-premium et que c'est au-delà de la premières formulations
                final canAccess = _isPremium || index < 1;

                if (!canAccess) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, size: 100, color: Colors.orange[600]),
                          const SizedBox(height: 24),
                          const Text(
                            "Contenu Premium",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4B2E2A),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Cette formulation est réservée aux utilisateurs premium.\n\n"
                            "Passez à la version premium pour accéder à toutes vos formulations sauvegardées.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Navigation vers la page de paiement
                              Navigator.pushNamed(context, '/pay');
                            },
                            icon: const Icon(Icons.diamond, color: Colors.white),
                            label: const Text(
                              "Devenir Premium",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[600],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // Si l'utilisateur peut accéder, afficher le contenu normal
                return _buildDetailContent(context);
              },
            ),
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    final nutrition = nutritionalComposition;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre principal
            Text(
              widget.formulation.animalType,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Sous-titre
            Text(
              widget.formulation.growthStage,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF4B2E2A),
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Card Coût total
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Coût total',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF4B2E2A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${widget.formulation.totalCost.toStringAsFixed(0)} FCFA',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Composition nutritionnelle
            const Text(
              'Composition nutritionnelle',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildNutritionRow('Protéines', nutrition['Protéines']!),
                  const Divider(height: 24),
                  _buildNutritionRow('Énergie', nutrition['Énergie']!),
                
                const Divider(height: 24),
                _buildNutritionRow('Calcium', nutrition['Calcium']!),
                const Divider(height: 24),
                _buildNutritionRow('Phosphore', nutrition['Phosphore']!),
                const Divider(height: 24),
                _buildNutritionRow('Lysine', nutrition['Lysine']!),
                const Divider(height: 24),
                _buildNutritionRow('Méthionine', nutrition['Méthionine']!),
                const Divider(height: 24),
                _buildNutritionRow('Fibres', nutrition['Fibres']!),
                const Divider(height: 24),
                _buildNutritionRow('Matières grasses', nutrition['Matières grasses']!),




                
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Ingrédients
            const Text(
              'Ingrédients',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: widget.formulation.ingredients.asMap().entries.map((entry) {
                  final index = entry.key;
                  final ing = entry.value;
                  final proportion = totalWeight > 0 
                      ? ((ing.quantity ?? 0) / totalWeight * 100) 
                      : 0;
                  
                  return Column(
                    children: [
                      if (index > 0) const Divider(height: 24),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              ing.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4B2E2A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${proportion.toStringAsFixed(0)}%',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF4B2E2A),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '${ing.price.toStringAsFixed(2)} FCFA',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4B2E2A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Bouton Supprimer (seulement pour premium)
            if (_isPremium)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _deleteFormulation(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Supprimer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }


























  // Widget _buildNutritionRow(String label, double percentage) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         label,
  //         style: const TextStyle(
  //           fontSize: 18,
  //           color: Color(0xFF4B2E2A),
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //       Text(
  //         label == 'Énergie'
  //             ? '${percentage.toStringAsFixed(0)} kcal/kg'
  //             : '${percentage.toStringAsFixed(0)}%',
  //         style: const TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xFF4B2E2A),
  //         ),
  //       ),
  //     ],
  //   );
  // }





Widget _buildNutritionRow(String label, double percentage) {
  String unit = '%';
  if (label == 'Énergie') {
    unit = 'kcal/kg';
  }
  
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFF4B2E2A),
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        '${percentage.toStringAsFixed(1)} $unit',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4B2E2A),
        ),
      ),
    ],
  );
}


















}
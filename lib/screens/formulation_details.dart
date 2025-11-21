import 'package:flutter/material.dart';
import '../models/formulation.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';

class FormulationDetailPage extends StatelessWidget {
  final Formulation formulation;

  const FormulationDetailPage({
    super.key,
    required this.formulation,
  });

  // Calculs
  double get totalWeight => formulation.ingredients.fold(
        0,
        (sum, ing) => sum + (ing.quantity ?? 0),
      );


Map<String, double> get nutritionalComposition {
  // Calcul basé sur les ingrédients
  double totalProtein = 0;
  double totalEnergy = 0;

  for (var ing in formulation.ingredients) {
    final weight = ing.quantity ?? 0;
    totalProtein += (ing.protein * weight) / 100;
    totalEnergy += (ing.energy * weight) / 100;
  }

  final proteinPercent = totalWeight > 0 ? (totalProtein / totalWeight) * 100 : 0.0; // ✅ Ajoutez .0
  final energyPercent = totalWeight > 0 ? (totalEnergy / totalWeight) * 100 : 0.0;   // ✅ Ajoutez .0
  // final energyKcal = totalWeight > 0 ? (totalEnergy / totalWeight) : 0.0;

  return {
    'Protéines': proteinPercent.toDouble(),  // ✅ Convertir explicitement
    'Énergie': energyPercent.toDouble(),     // ✅ Convertir explicitement
    // 'Énergie': energyKcal.toDouble(),     // ✅ Convertir explicitement
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
        await context.read<FormulationProvider>().deleteFormulation(formulation);
        
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
    final nutrition = nutritionalComposition;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD97706)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFFD97706)),
            onPressed: () => _deleteFormulation(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre principal
              Text(
                formulation.animalType,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Sous-titre
              Text(
                formulation.growthStage,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF4B2E2A),
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
                    Text(
                      'Coût total',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xFF4B2E2A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${formulation.totalCost.toStringAsFixed(0)} FCFA',
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
                  children: formulation.ingredients.asMap().entries.map((entry) {
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
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xFF4B2E2A),
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
              
              // Bouton Supprimer
              SizedBox(
                width: double.infinity,



                child: ElevatedButton(
                  onPressed: () => _deleteFormulation(context),
                  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red[600], // ✅ Rouge pour supprimer (dangereux)
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
      ),
    );
  }

  Widget _buildNutritionRow(String label, double percentage) {
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
          // '${percentage.toStringAsFixed(0)}%',
          

        label == 'Énergie'
            ? '${percentage.toStringAsFixed(0)} kcal/kg'
            : '${percentage.toStringAsFixed(0)}%',


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
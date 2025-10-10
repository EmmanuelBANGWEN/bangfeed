import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../models/formulation.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/notification_service.dart';
import 'package:fl_chart/fl_chart.dart'; // Ajoutez fl_chart: ^0.66.0 dans pubspec.yaml

class ResultPage extends StatelessWidget {
  final String animal;
  final String stage;
  final List<Ingredient> ingredients;
  final double totalCost;

  const ResultPage({
    super.key,
    required this.animal,
    required this.stage,
    required this.ingredients,
    required this.totalCost,
  });

  // Calculs des proportions et contributions
  double get totalWeight => ingredients.fold(0, (sum, ing) => sum + (ing.quantity ?? 0));
  
  double get costPerKg => totalWeight > 0 ? totalCost / totalWeight : 0;

  // Calculs nutritionnels (à adapter selon vos données réelles)
  Map<String, double> get nutritionalComposition {
    // Exemple de calcul - à remplacer par vos vraies données
    return {
      'Protéines': 20.0,
      'Énergie': 55.0,
      'Minéraux': 25.0,
    };
  }

  void _save(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final formulation = Formulation(
        userId: user.uid,
        animalType: animal,
        growthStage: stage,
        ingredients: ingredients,
        totalCost: totalCost,
        date: DateTime.now(),
      );

      await context.read<FormulationProvider>().addFormulation(formulation);

      await NotificationService.sendLocalNotification(
        title: '✅ Formulation sauvegardée avec succès',
        body: '$animal ($stage) - Coût total: ${totalCost.toStringAsFixed(2)} FCFA',
      );

      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Formulation sauvegardée avec succès'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Résultat / génération',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bouton Générer (si besoin de regénérer)
            

            const SizedBox(height: 20),

            // Card Résultat
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Résultat',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Coûts
                  _buildResultRow('Coût total', '${totalCost.toStringAsFixed(2)} FCFA'),
                  const SizedBox(height: 8),
                  _buildResultRow('Coût par kg', '${costPerKg.toStringAsFixed(2)} FCFA'),
                  
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),

                  // Composition nutritionnelle
                  const Text(
                    'Composition nutritionnelle',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...nutritionalComposition.entries.map((entry) => 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _buildResultRow(entry.key, '${entry.value.toStringAsFixed(0)}%'),
                    )
                  ).toList(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tableau des ingrédients
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // En-têtes du tableau
                  Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Ingrédient',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Proportion',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Contribution',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),

                  // Liste des ingrédients
                  ...ingredients.map((ing) {
                    final proportion = totalWeight > 0 
                        ? ((ing.quantity ?? 0) / totalWeight * 100)
                        : 0;
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              ing.name,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${proportion.toStringAsFixed(0)}%',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${ing.price.toStringAsFixed(2)} FCFA',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Graphique circulaire
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: _buildPieChartSections(),
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Avertissement
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange[200]!),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber, color: Colors.orange[700], size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Avertissement :\nVérifiez la disponibilité des ingrédients',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.orange[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Bouton Sauvegarder
            ElevatedButton(
              onPressed: () => _save(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Sauvegarder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    final colors = [
      Colors.blue[600]!,
      Colors.orange[600]!,
      Colors.red[400]!,
      Colors.green[600]!,
      Colors.purple[600]!,
    ];

    return ingredients.asMap().entries.map((entry) {
      final index = entry.key;
      final ing = entry.value;
      final proportion = totalWeight > 0 
          ? ((ing.quantity ?? 0) / totalWeight * 100)
          : 0;

      return PieChartSectionData(
        value: proportion.toDouble(), 
        title: '${proportion.toStringAsFixed(0)}%',
        color: colors[index % colors.length],
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
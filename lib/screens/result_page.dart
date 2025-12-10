import 'package:bangfeed/screens/payer.dart';
import 'package:bangfeed/screens/payer_test.dart';
import 'package:bangfeed/services/firestore_service.dart';
import 'package:bangfeed/services/premium_service.dart';
import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../models/formulation.dart';
import '../models/nutritional_requirement.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/notification_service.dart';
import 'package:fl_chart/fl_chart.dart';

class ResultPage extends StatefulWidget {
  final String animal;
  final String stage;
  final List<Ingredient> ingredients;
  final double totalCost;
  final NutritionalRequirement? requirement;

  const ResultPage({
    super.key,
    required this.animal,
    required this.stage,
    required this.ingredients,
    required this.totalCost,
    this.requirement,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isPremium = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPremiumStatus();
  }













Future<void> _checkPremiumStatus() async {
  try {
    final isPremium = await PremiumService().checkPremiumStatus();
    setState(() {
      _isPremium = isPremium;
      _isLoading = false;
    });
    
    print("✅ PREMIUM STATUS dans ResultPage: $_isPremium");
  } catch (e) {
    print('❌ Erreur checkPremium: $e');
    setState(() {
      _isPremium = false;
      _isLoading = false;
    });
  }
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
      
  //     print("✅ PREMIUM STATUS dans ResultPage: $_isPremium");
  //   } catch (e) {
  //     print('❌ Erreur checkPremium: $e');
  //     setState(() {
  //       _isPremium = false;
  //       _isLoading = false;
  //     });
  //   }
  // }

  // ✅ Quantité totale
  double get totalWeight => 100.0;

  // ✅ Coût par kg
  double get costPerKg => widget.totalCost / totalWeight;

  // ✅ Composition nutritionnelle pondérée
  Map<String, double> get nutritionalComposition {
    double totalProtein = 0;
    double totalEnergy = 0;
    double totalCalcium = 0;
    double totalPhosphore = 0;

    for (var ing in widget.ingredients) {
      final proportion = ing.quantity ?? 0;
      totalProtein += ing.protein * proportion;
      totalEnergy += ing.energy * proportion;
      totalCalcium += (ing.calcium ?? 0) * proportion;
      totalPhosphore += (ing.phosphore ?? 0) * proportion;
    }

    return {
      'Protéines': totalProtein,
      'Énergie': totalEnergy,
      'Calcium': totalCalcium,
      'Phosphore': totalPhosphore,
    };
  }




























// ✅ NOUVEAU: Validation de la formule
Map<String, dynamic> validateFormula() {
  if (widget.requirement == null) {
    return {
      'isValid': false,
      'message': 'Pas de référence nutritionnelle',
      'details': {},
    };
  }

  final composition = nutritionalComposition;
  const double tolerance = 0.10; // 10% de tolérance

  bool proteinOk = _isInRange(
    composition['Protéines']!,
    widget.requirement!.protein,
    tolerance,
  );
  bool energyOk = _isInRange(
    composition['Énergie']!,
    widget.requirement!.energy,
    tolerance,
  );
  bool calciumOk = _isInRange(
    composition['Calcium']!,
    widget.requirement!.calcium,
    tolerance,
  );
  bool phosphoreOk = _isInRange(
    composition['Phosphore']!,
    widget.requirement!.phosphore,
    tolerance,
  );

  bool isValid = proteinOk && energyOk && calciumOk && phosphoreOk;

  return {
    'isValid': isValid,
    'protein': proteinOk,
    'energy': energyOk,
    'calcium': calciumOk,
    'phosphore': phosphoreOk,
    'message': isValid 
        ? '✅ Formule conforme aux besoins nutritionnels'
        : '⚠️ Formule à ajuster',
    'details': {
      'Protéines': {
        'actual': composition['Protéines']!,
        'required': widget.requirement!.protein,
        'status': proteinOk,
      },
      'Énergie': {
        'actual': composition['Énergie']!,
        'required': widget.requirement!.energy,
        'status': energyOk,
      },
      'Calcium': {
        'actual': composition['Calcium']!,
        'required': widget.requirement!.calcium,
        'status': calciumOk,
      },
      'Phosphore': {
        'actual': composition['Phosphore']!,
        'required': widget.requirement!.phosphore,
        'status': phosphoreOk,
      },
    },
  };
}

  bool _isInRange(double actual, double required, double tolerance) {
    double lowerBound = required * (1 - tolerance);
    double upperBound = required * (1 + tolerance);
    return actual >= lowerBound && actual <= upperBound;
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
      animalType: widget.animal,      // ✅ widget.animal
      growthStage: widget.stage,       // ✅ widget.stage
      ingredients: widget.ingredients, // ✅ widget.ingredients
      totalCost: widget.totalCost,     // ✅ widget.totalCost
      date: DateTime.now(),
    );

    await context.read<FormulationProvider>().addFormulation(formulation);

    await NotificationService.sendLocalNotification(
      title: '✅ Formulation sauvegardée',
      body: '${widget.animal} (${widget.stage}) - ${widget.totalCost.toStringAsFixed(0)} FCFA',
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



  // ... reste de tes méthodes (validateFormula, _isInRange, etc.)




  Widget _infoChip(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B2E2A),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        title: const Text(
          'Résultat de formulation',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B2E2A),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),






























body: Consumer<FormulationProvider>(
  builder: (context, provider, child) {
    // final bool canAccess =
    //     provider.formulations.length < 5; // Gratuit = 2 formulations max
// final bool canAccess = provider.formulations.length < 3; // Gratuit = 3 formulations max
final bool canAccess = _isPremium || provider.formulations.length < 3;

    if (!canAccess) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Abonnement premium",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Vous avez atteint la limite de la version gratuite.\n"
                "Payez pour débloquer les formulations illimitées.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 25),






ElevatedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PayPage()),
          // MaterialPageRoute(builder: (context) => const TestPaymentPage()),

    
    );
  },
  icon: const Icon(Icons.payment, color: Colors.white),
  label: const Text(
    "Payer maintenant",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)






























          ],
        ),
      );
    }

    // SI L’UTILISATEUR A LE DROIT → afficher ta page normale
    return _buildResultContent(context);
  },
),



























      //   ),
      // ),
    );
  }

  Widget _buildResultRow(String label, String value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isHighlight ? 18 : 16,
            fontWeight: isHighlight ? FontWeight.w600 : FontWeight.normal,
            color: const Color(0xFF4B2E2A),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isHighlight ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: isHighlight ? const Color(0xFFD97706) : const Color(0xFF4B2E2A),
          ),
        ),
      ],
    );
  }

  Widget _buildNutritionalRow(String label, double value, String unit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF4B2E2A),
          ),
        ),
        Text(
          '${value.toStringAsFixed(1)} $unit',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B2E2A),
          ),
        ),
      ],
    );
  }

  // ✅ NOUVEAU: Widget avec validation
  Widget _buildNutritionalRowWithValidation(
    String label,
    double actual,
    double required,
    String unit,
  ) {
    const double tolerance = 0.10; // 10%
    bool isValid = _isInRange(actual, required, tolerance);
    
    Color statusColor = isValid ? Colors.green : Colors.orange;
    IconData statusIcon = isValid ? Icons.check_circle : Icons.warning;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(statusIcon, color: statusColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B2E2A),
                  ),
                ),
              ],
            ),
            Text(
              '${actual.toStringAsFixed(1)} $unit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Requis: ${required.toStringAsFixed(1)} $unit',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }




















Widget _buildResultContent(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

          
          children: [
            // En-tête Animal/Stade
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoChip('Animal', widget.animal),
                  _infoChip('Stade', widget.stage),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ═══════════════════════════════════════════════════════════
            // SECTION 1: COÛTS
            // ═══════════════════════════════════════════════════════════
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
                  Row(
                    children: const [
                      Icon(Icons.monetization_on, color: Color(0xFFD97706), size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Coûts',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4B2E2A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildResultRow(
                    'Quantité produite',
                    '${totalWeight.toStringAsFixed(0)} kg',
                  ),
                  const Divider(height: 20),
                  _buildResultRow(
                    'Coût total',
                    '${widget.totalCost.toStringAsFixed(0)} FCFA',
                    isHighlight: true,
                  ),
                  const Divider(height: 20),
                  _buildResultRow(
                    'Coût par kg',
                    '${costPerKg.toStringAsFixed(0)} FCFA/kg',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════
            // SECTION 2: COMPOSITION NUTRITIONNELLE
            // ═══════════════════════════════════════════════════════════
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
                  Row(
                    children: const [
                      Icon(Icons.science, color: Color(0xFFD97706), size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Composition nutritionnelle',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4B2E2A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // ✅ Affichage avec validation
                  if (widget.requirement != null) ...[
                    _buildNutritionalRowWithValidation(
                      'Protéines',
                      nutritionalComposition['Protéines']!,
                      widget.requirement!.protein,
                      '%',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRowWithValidation(
                      'Énergie',
                      nutritionalComposition['Énergie']!,
                      widget.requirement!.energy,
                      'kcal/kg',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRowWithValidation(
                      'Calcium',
                      nutritionalComposition['Calcium']!,
                      widget.requirement!.calcium,
                      '%',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRowWithValidation(
                      'Phosphore',
                      nutritionalComposition['Phosphore']!,
                      widget.requirement!.phosphore,
                      '%',
                    ),
                  ] else ...[
                    _buildNutritionalRow(
                      'Protéines',
                      nutritionalComposition['Protéines']!,
                      '%',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRow(
                      'Énergie',
                      nutritionalComposition['Énergie']!,
                      'kcal/kg',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRow(
                      'Calcium',
                      nutritionalComposition['Calcium']!,
                      '%',
                    ),
                    const Divider(height: 20),
                    _buildNutritionalRow(
                      'Phosphore',
                      nutritionalComposition['Phosphore']!,
                      '%',
                    ),
                  ],

                  // ✅ NOUVEAU: Indicateur global de validation
                  if (widget.requirement != null) ...[
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 16),
                    _buildValidationIndicator(),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════
            // SECTION 3: DÉTAIL DES INGRÉDIENTS
            // ═══════════════════════════════════════════════════════════
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
                  Row(
                    children: const [
                      Icon(Icons.list_alt, color: Color(0xFFD97706), size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Détail des ingrédients',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4B2E2A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // En-têtes du tableau
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Ingrédient',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF4B2E2A),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Quantité',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF4B2E2A),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Coût',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF4B2E2A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ✅ Lignes des ingrédients
                  ...widget.ingredients.map((ing) {
                    // ing.quantity est une proportion entre 0 et 1
                    final proportion = (ing.quantity ?? 0) * 100; // Pourcentage
                    final quantityKg = (ing.quantity ?? 0) * totalWeight; // Kg réels
                    final cost = quantityKg * ing.price; // Coût = kg × prix/kg

                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                ing.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4B2E2A),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  '${proportion.toStringAsFixed(1)}%',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4B2E2A),
                                  ),
                                ),
                                Text(
                                  '(${quantityKg.toStringAsFixed(1)} kg)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${cost.toStringAsFixed(0)} F',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD97706),
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

            // ═══════════════════════════════════════════════════════════
            // SECTION 4: GRAPHIQUE
            // ═══════════════════════════════════════════════════════════
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
                  const Text(
                    'Répartition des ingrédients',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4B2E2A),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      children: const [
                        Icon(Icons.warning_amber, color: Color(0xFFD97706), size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Vérifiez la disponibilité des ingrédients sur le marché local',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF4B2E2A),
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
                backgroundColor: const Color(0xFFD97706),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Sauvegarder cette formulation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
















    ),
  );
}

































  // ✅ NOUVEAU: Indicateur global
  Widget _buildValidationIndicator() {
    final validation = validateFormula();
    final bool isValid = validation['isValid'] as bool;
    final String message = validation['message'] as String;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isValid ? Colors.green[50] : Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isValid ? Colors.green[300]! : Colors.orange[300]!,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.warning_amber,
            color: isValid ? Colors.green[700] : Colors.orange[700],
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isValid ? Colors.green[900] : Colors.orange[900],
                  ),
                ),
                if (!isValid) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Ajustez les ingrédients pour respecter les besoins',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.orange[800],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    final colors = [
      Colors.blue[600]!,
      Colors.orange[600]!,
      Colors.green[600]!,
      Colors.purple[600]!,
      Colors.red[400]!,
      Colors.teal[600]!,
      Colors.amber[700]!,
      Colors.pink[400]!,
    ];

    return widget.ingredients.asMap().entries.map((entry) {
      final index = entry.key;
      final ing = entry.value;
      final proportion = (ing.quantity ?? 0) * 100;

      return PieChartSectionData(
        value: proportion,
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
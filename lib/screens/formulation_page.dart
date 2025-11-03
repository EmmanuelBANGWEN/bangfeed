// lib/screens/formulation_page.dart - VERSION AMÉLIORÉE AVEC CONTRAINTES ET DESIGN

// import 'package:bangfeed/services/pawapay/pawapay_service.dart';
import 'package:flutter/material.dart';
import 'package:bangfeed/models/data/ingredients_data.dart';
import 'package:bangfeed/models/data/nutritional_requirements_data.dart';
import 'package:bangfeed/services/feedformulationservice.dart';
import '../models/ingredient.dart';
import 'result_page.dart';

class FormulationPage extends StatefulWidget {
  final String animal;
  final String stage;

  const FormulationPage({
    super.key,
    required this.animal,
    required this.stage,
  });

  @override
  State<FormulationPage> createState() => _FormulationPageState();
}

class _FormulationPageState extends State<FormulationPage> {
  final List<Ingredient> _selectedIngredients = [];
  final Map<String, TextEditingController> _priceControllers = {};
  // final pawaService = PawaPayService("eyJraWQiOiIxIiwiYWxnIjoiRVMyNTYifQ.eyJ0dCI6IkFBVCIsInN1YiI6IjEyNTEwIiwibWF2IjoiMSIsImV4cCI6MjA3NzcxMTU3OSwiaWF0IjoxNzYyMTc4Nzc5LCJwbSI6IkRBRixQQUYiLCJqdGkiOiJkNjY3N2FiNS05MmQ4LTQ2M2ItYTQzNC1hZjQ5N2RhNTZmMmEifQ.H_qTs_acBP8nTg6ofIvR9cFA_mq3oq1s88ScaLXmXqS4w5OYkplBNEQ_ypCUYNPumNFtQvaNykBN9sYqNage5w");

  @override
  void dispose() {
    for (var controller in _priceControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _autoFormulate() {
    final requirement = NutritionalRequirementsData.getRequirement(
      widget.animal,
      widget.stage,
    );

    if (requirement == null) {
      _showSnack('Aucun besoin défini pour ce stade.', Colors.red);
      return;
    }

    if (_selectedIngredients.isEmpty) {
      _showSnack('Veuillez sélectionner au moins un ingrédient.', Colors.orange);
      return;
    }

    // ✅ Validation des contraintes min/max
    double totalMin = _selectedIngredients.fold(
      0.0,
      (sum, ing) => sum + (ing.minIncl ?? 0),
    );

    if (totalMin > 1.0) {
      _showSnack(
        'Les minimums totalisent ${(totalMin * 100).toStringAsFixed(1)}% (max 100%)',
        Colors.red,
      );
      return;
    }

    // ✅ Préparer les ingrédients avec prix actualisés
    final ingredientsToFormulate = _selectedIngredients.map((ing) {
      final controller = _priceControllers[ing.name];
      final updatedPrice = double.tryParse(
            controller?.text.replaceAll(',', '.') ?? '',
          ) ??
          ing.price;

      return Ingredient(
        name: ing.name,
        protein: ing.protein,
        energy: ing.energy,
        calcium: ing.calcium,
        phosphore: ing.phosphore,
        price: updatedPrice,
        quantity: null,
        minIncl: ing.minIncl,
        maxIncl: ing.maxIncl,
      );
    }).toList();

    // ✅ Lancer la formulation
    try {
      final result = FeedFormulationService().formulate(
        requirement: requirement,
        availableIngredients: ingredientsToFormulate,
      );

      double totalCost = result.ingredients.fold(
        0.0,
        (sum, ing) => sum + ((ing.quantity ?? 0) * 100 * ing.price),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            animal: widget.animal,
            stage: widget.stage,
            ingredients: result.ingredients,
            totalCost: totalCost,
            requirement: requirement,
          ),
        ),
      );
    } catch (e) {
      _showSnack('Erreur de formulation : $e', Colors.red);
    }
  }





//   void _showPaymentDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Paiement requis'),
//         content: const Text(
//             'Pour générer la formule automatique, vous devez payer 1000 FCFA.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Annuler'),
//           ),



//           ElevatedButton(
//             onPressed: () {
//               // Simuler le paiement ici (intégrer Mobile Money plus tard)
//               // setState(() {
//               //   _paid = true;
//               // });
//               Navigator.pop(context);
//               _autoFormulate();
//             },
//             child: const Text('Payer 1000 FCFA'),
//           ),







// // ElevatedButton.icon(
// //   icon: const Icon(Icons.payment),
// //   onPressed: _selectedIngredients.isEmpty
// //       ? null
// //       : () async {
// //           Navigator.pop(context); // Fermer la dialogue
          
// //           // Afficher un indicateur de chargement
// //           showDialog(
// //             context: context,
// //             barrierDismissible: false,
// //             builder: (context) => const Center(
// //               child: CircularProgressIndicator(),
// //             ),
// //           );
          
// //           final success = await pawaService.initiatePayment(
// //             phoneNumber: '237655372703', // Format valide pour le Cameroun
// //             amount: 1000,
// //             provider: 'MTN_MOMO_CMR', // ou 'ORANGE_CMR'
// //           );

// //           Navigator.pop(context); // Fermer le chargement

// //           if (success) {
// //             _autoFormulate();
// //           } else {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               const SnackBar(
// //                 content: Text('❌ Erreur lors du paiement. Veuillez réessayer.'),
// //                 backgroundColor: Colors.red,
// //               ),
// //             );
// //           }
// //         },
// //   style: ElevatedButton.styleFrom(
// //     backgroundColor: const Color(0xFFD97706),
// //     foregroundColor: Colors.white,
// //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
// //   ),
// //   label: const Text('Payer 1000 FCFA'),
// // ),













//         ],
//       ),
//     );
//   }





  void _showSnack(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allIngredients = IngredientsData.getSortedIngredients();

    for (var ing in allIngredients) {
      _priceControllers.putIfAbsent(
        ing.name,
        () => TextEditingController(text: ing.price.toStringAsFixed(0)),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        title: const Text('Nouvelle formulation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🟩 En-tête
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

            // 🟧 Titre section ingrédients
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sélectionnez les ingrédients :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🧾 Liste des ingrédients
            Expanded(
              child: ListView.builder(
                itemCount: allIngredients.length,
                itemBuilder: (context, index) {
                  final ing = allIngredients[index];
                  final isSelected =
                      _selectedIngredients.any((i) => i.name == ing.name);

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected
                            ? const Color(0xFFD97706)
                            : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nom + Checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: isSelected,
                                activeColor: const Color(0xFFD97706),
                                onChanged: (val) {
                                  setState(() {
                                    if (val == true) {
                                      _selectedIngredients.add(ing);
                                    } else {
                                      _selectedIngredients
                                          .removeWhere((i) => i.name == ing.name);
                                    }
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  ing.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: const Color(0xFF4B2E2A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),

                          // ✅ Contraintes
                          if (ing.minIncl != null || ing.maxIncl != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Incorporation : ${ing.minIncl != null ? "${(ing.minIncl! * 100).toStringAsFixed(1)}%" : "0%"} - ${ing.maxIncl != null ? "${(ing.maxIncl! * 100).toStringAsFixed(1)}%" : "100%"}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                          const SizedBox(height: 8),

                          // 📊 Valeurs nutritionnelles
                          Text(
                            'Protéines : ${ing.protein}% | Énergie : ${ing.energy} kcal/kg\n'
                            'Calcium : ${ing.calcium}% | Phosphore : ${ing.phosphore}%',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF4B2E2A),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // 💰 Champ prix
                          TextField(
                            controller: _priceControllers[ing.name],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Prix (FCFA/kg)',
                              labelStyle: const TextStyle(
                                color: Color(0xFF4B2E2A),
                              ),
                              prefixIcon: const Icon(
                                Icons.attach_money,
                                color: Color(0xFFD97706),
                                size: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),










            // 🟩 Bouton formulation
            ElevatedButton.icon(
              icon: const Icon(Icons.auto_fix_high),
              // onPressed: _selectedIngredients.isEmpty ? null : _showPaymentDialog,
              onPressed: _selectedIngredients.isEmpty ? null : _autoFormulate,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD97706),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                minimumSize: const Size(double.infinity, 50),
              ),
              label: const Text(
                'Formulation automatique',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),










          ],
        ),
      ),
    );
  }

  Widget _infoChip(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
          ),
        ),
      ],
    );
  }
}

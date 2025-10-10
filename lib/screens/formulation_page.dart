import 'package:flutter/material.dart';
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
  _FormulationPageState createState() => _FormulationPageState();
}

class _FormulationPageState extends State<FormulationPage> {
  late String _selectedAnimal;
  late String _selectedStage;
  final List<Ingredient> _selectedIngredients = [];

  final List<String> _animals = ['Porc', 'Poulet de chair'];
  final List<String> _stages = ['Démarrage', 'Croissance', 'Finition', 'Engraissement', 'Sevrage', 'Gestation'];

  double _totalCost = 0;

  @override
  void initState() {
    super.initState();
    _selectedAnimal = widget.animal;
    _selectedStage = widget.stage;
  }

  void _calculate() {
    double cost = 0;
    for (var i in _selectedIngredients) {
      cost += i.price;
    }
    setState(() {
      _totalCost = cost;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          animal: _selectedAnimal,
          stage: _selectedStage,
          ingredients: _selectedIngredients,
          totalCost: _totalCost,
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    // Pour MVP, on simule des ingrédients

    final allIngredients = [
      Ingredient(name: 'Maïs', protein: 9, energy: 3400, price: 0.5),
      Ingredient(name: 'Tourteau soja', protein: 44, energy: 2500, price: 1.2),
      Ingredient(name: 'Blé', protein: 12, energy: 3200, price: 0.6),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Nouvelle Formulation')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Champ animal (lecture seule)
            DropdownButtonFormField(
              value: _selectedAnimal,
              items: _animals.map((a) => DropdownMenuItem(value: a, child: Text(a))).toList(),
              onChanged: null,
              decoration: InputDecoration(
                labelText: 'Animal sélectionné',
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            // Champ stade (lecture seule)
            DropdownButtonFormField(
              value: _selectedStage,
              items: _stages.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
              onChanged: null,
              decoration: InputDecoration(
                labelText: 'Stade sélectionné',
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sélectionnez les ingrédients :',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allIngredients.length,
                itemBuilder: (context, index) {
                  final ing = allIngredients[index];
                  return CheckboxListTile(
                    title: Text('${ing.name} (${ing.price} FCFA/kg)'),
                    subtitle: Text('Protéines: ${ing.protein}% | Énergie: ${ing.energy} kcal'),
                    value: _selectedIngredients.contains(ing),
                    onChanged: (bool? val) {
                      setState(() {
                        if (val == true) {
                          _selectedIngredients.add(ing);
                        } else {
                          _selectedIngredients.remove(ing);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedIngredients.isEmpty ? null : _calculate,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green[600],
                ),
                child: Text(
                  'Calculer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
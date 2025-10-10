import 'package:bangfeed/screens/select_stage.dart';
import 'package:flutter/material.dart';

class AnimalSelectionPage extends StatefulWidget {
  const AnimalSelectionPage({super.key});

  @override
  State<AnimalSelectionPage> createState() => _AnimalSelectionPageState();
}

class _AnimalSelectionPageState extends State<AnimalSelectionPage> {
  String? selectedAnimal;

  final List<Map<String, dynamic>> animals = [
 
    {
      'name': 'Porc',
      'icon': '🐷',
      'color': Color(0xFF2D5F4F),
    },
    {
      'name': 'Poulet de chair',
      'icon': '🐔',
      'color': Color(0xFF2D5F4F),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo/Titre
              const Text(
                'BangFeed',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Étape
              const Text(
                'Étape 1/4 : Choisir l\'animal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Grille d'animaux
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    final isSelected = selectedAnimal == animal['name'];
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnimal = animal['name'];
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected 
                                ? animal['color'] 
                                : Colors.grey[300]!,
                            width: isSelected ? 3 : 1.5,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: animal['color'].withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icône personnalisée
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: animal['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: _buildAnimalIcon(animal['name'], animal['color']),
                              ),
                            ),
                            
                            const SizedBox(height: 12),
                            
                            // Nom
                            Text(
                              animal['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected 
                                    ? animal['color'] 
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Bouton Suivant
              SizedBox(
                width: double.infinity,
                child: 
                ElevatedButton(
                  onPressed: selectedAnimal == null ? null : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StageSelectionPage(animal: selectedAnimal!)  // ✅ Correct
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnimal != null 
                        ? const Color(0xFF2D5F4F) 
                        : Colors.grey[300],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: selectedAnimal != null ? 2 : 0,
                    disabledBackgroundColor: Colors.grey[300],
                    disabledForegroundColor: Colors.grey[500],
                  ),
                  child: const Text(
                    'Suivant',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimalIcon(String animalName, Color color) {
    IconData iconData;
    
    switch (animalName) {

      case 'Porc':
        iconData = Icons.set_meal; // Cochon stylisé
        break;
      case 'Poulet de chair':
        iconData = Icons.egg_alt; // Poulet/Œuf
        break;
      default:
        iconData = Icons.pets;
    }
    
    return Icon(
      iconData,
      size: 48,
      color: color,
    );
  }
}


import 'package:flutter/material.dart';

// ✅ Tes pages cibles (vérifie bien les noms de classes internes)
import 'package:bangfeed/screens/select_age_page/pig_age_page.dart';
import 'package:bangfeed/screens/select_age_page/poulet_chair_age_page.dart';

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
      'color': const Color(0xFFD97706), // Orange unifié
    },
    {
      'name': 'Poulet de chair',
      'icon': '🐔',
      'color': const Color(0xFFD97706),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo ou titre
              const Text(
                'BangFeed',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),

              const SizedBox(height: 40),

              // Étape
              const Text(
                'Étape 1/4 : Choisir l\'animal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B2E2A),
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
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
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
                            // Icône stylisée
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: animal['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: _buildAnimalIcon(
                                  animal['name'],
                                  animal['color'],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Nom de l’animal
                            Text(
                              animal['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? animal['color']
                                    : const Color(0xFF4B2E2A),
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
                child: ElevatedButton(
                  onPressed: selectedAnimal == null
                      ? null
                      : () {
                          Widget nextPage;

                          switch (selectedAnimal) {
                            case 'Porc':
                              nextPage = const StagePorcPage(); // ✅ Vérifie le nom
                              break;
                            case 'Poulet de chair':
                              nextPage = const StagePouletPage(); // ✅ Vérifie le nom
                              break;
                            default:
                              nextPage = const Placeholder();
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => nextPage),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnimal != null
                        ? const Color(0xFFD97706)
                        : Colors.grey[300],
                    foregroundColor: selectedAnimal != null
                        ? Colors.white
                        : Colors.grey[600],
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
        iconData = Icons.set_meal; // Représente un cochon stylisé
        break;
      case 'Poulet de chair':
        iconData = Icons.egg_alt; // Représente un poulet ou un œuf
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

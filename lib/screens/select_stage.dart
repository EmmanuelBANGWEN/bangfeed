import 'package:bangfeed/screens/formulation_page.dart';
import 'package:flutter/material.dart';

class StageSelectionPage extends StatefulWidget {
  final String animal;
  
  const StageSelectionPage({super.key, required this.animal});

  @override
  State<StageSelectionPage> createState() => _StageSelectionPageState();
}

class _StageSelectionPageState extends State<StageSelectionPage> {
  String? selectedStage;

  final List<String> stages = [
    'Démarrage',
    'Croissance',
    'Finition',
    'Ponte',
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
                'Étape 2/4 : Choisir stade\nphysiologique / âge',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Liste des stades
              Expanded(
                child: ListView.builder(
                  itemCount: stages.length,
                  itemBuilder: (context, index) {
                    final stage = stages[index];
                    final isSelected = selectedStage == stage;
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStage = stage;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected 
                                  ? const Color(0xFF2D5F4F) 
                                  : Colors.grey[300]!,
                              width: isSelected ? 2.5 : 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                              if (isSelected)
                                BoxShadow(
                                  color: const Color(0xFF2D5F4F).withOpacity(0.15),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Icône de sélection
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected 
                                        ? const Color(0xFF2D5F4F) 
                                        : Colors.grey[400]!,
                                    width: 2,
                                  ),
                                  color: isSelected 
                                      ? const Color(0xFF2D5F4F) 
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              
                              const SizedBox(width: 16),
                              
                              // Texte du stade
                              Expanded(
                                child: Text(
                                  stage,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: isSelected 
                                        ? FontWeight.w600 
                                        : FontWeight.w500,
                                    color: isSelected 
                                        ? const Color(0xFF1B4332) 
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Boutons Retour et Suivant
              Row(
                children: [
                  // Bouton Retour
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Retour',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Bouton Suivant
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedStage == null ? null : () {
                        // Navigation vers l'étape suivante
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => FormulationPage(
                              animal: widget.animal,
                              stage: selectedStage!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedStage != null 
                            ? const Color(0xFF2D5F4F) 
                            : Colors.grey[300],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: selectedStage != null ? 2 : 0,
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
            ],
          ),
        ),
      ),
    );
  }
}

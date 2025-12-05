import 'package:flutter/material.dart';
import 'package:bangfeed/screens/formulation_page.dart';

class StagePoulePondeusePage extends StatefulWidget {
  const StagePoulePondeusePage({super.key});

  @override
  State<StagePoulePondeusePage> createState() => _StagePoulePondeusePageState();
}

class _StagePoulePondeusePageState extends State<StagePoulePondeusePage> {
  String? selectedStage;

  final List<Map<String, dynamic>> stages = [
    {'name': 'Démarrage (0-6 semaines)', 'icon': Icons.egg},
    {'name': 'Croissance (7-18 semaines)', 'icon': Icons.trending_up},
    {'name': 'Ponte', 'icon': Icons.album},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Étape 2/4 : Poule pondeuse",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Choisissez le stade de la poule 🐔',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: stages.length,
                  itemBuilder: (context, index) {
                    final stage = stages[index];
                    final isSelected = selectedStage == stage['name'];

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFFEFD5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFD97706)
                              : Colors.grey[300]!,
                          width: isSelected ? 2.5 : 1.5,
                        ),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: const Color(0xFFD97706).withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),

                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        leading: Icon(
                          stage['icon'],
                          color: isSelected
                              ? const Color(0xFFD97706)
                              : const Color(0xFF4B2E2A),
                          size: 32,
                        ),
                        title: Text(
                          stage['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: const Color(0xFF4B2E2A),
                          ),
                        ),
                        trailing: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? const Color(0xFFD97706)
                              : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            selectedStage = stage['name'];
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: selectedStage == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormulationPage(
                                animal: "Poule pondeuse",
                                stage: selectedStage!,
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                    disabledBackgroundColor: Colors.grey[400],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  label: const Text(
                    "Suivant",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

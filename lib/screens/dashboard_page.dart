import 'package:bangfeed/screens/formulation_details.dart';
import 'package:bangfeed/screens/select_animal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/formulation_provider.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final formulations = context.watch<FormulationProvider>().formulations;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'BangFeed',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: Icon(Icons.logout, color: Colors.black87),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mes Formulations',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '${formulations.length} formulation${formulations.length > 1 ? 's' : ''} créée${formulations.length > 1 ? 's' : ''}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 16),
          
          // Liste des formulations
          Expanded(
            child: formulations.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.science_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Aucune formulation',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Appuyez sur + pour créer votre première formulation',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: formulations.length,
                    itemBuilder: (context, index) {
                      final f = formulations[index];
                      
                      // Icône selon le type d'animal
                      IconData animalIcon = Icons.pets;
                      Color cardColor = Colors.green;
                      
                      if (f.animalType.toLowerCase().contains('porc')) {
                        animalIcon = Icons.agriculture;
                        cardColor = Colors.pink;
                      } else if (f.animalType.toLowerCase().contains('poulet') || 
                                 f.animalType.toLowerCase().contains('volaille')) {
                        animalIcon = Icons.egg_alt;
                        cardColor = Colors.orange;
                      } else if (f.animalType.toLowerCase().contains('bovin') || 
                                 f.animalType.toLowerCase().contains('vache')) {
                        animalIcon = Icons.agriculture_outlined;
                        cardColor = Colors.brown;
                      }
                      
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        
                        
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FormulationDetailPage(formulation: f)  // ✅ Ajoutez ici
                              ),
                            );
                          },



                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                // Icône de l'animal
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: cardColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    animalIcon,
                                    size: 32,
                                    color: cardColor,
                                  ),
                                ),
                                
                                SizedBox(width: 16),
                                
                                // Informations
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        f.animalType,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        f.growthStage,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.attach_money,
                                            size: 16,
                                            color: Colors.green[700],
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '${f.totalCost.toStringAsFixed(0)} FCFA',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Flèche
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),


floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (_) => AnimalSelectionPage())  // ✅ Changez ici
    );
  },
  icon: Icon(Icons.add),
  label: Text('Nouvelle formulation'),
  backgroundColor: Colors.green[600],
),


    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/animal_provider.dart';
// import '../models/animal.dart';

// class AnimalPage extends StatelessWidget {
//   const AnimalPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AnimalProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Animaux')),
//       body: ListView.builder(
//         itemCount: provider.animals.length,
//         itemBuilder: (context, index) {
//           final a = provider.animals[index];
//           return ListTile(
//             title: Text(a.name),
//             subtitle: Text(a.species),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () => provider.deleteAnimal(a),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (_) => _AddAnimalDialog(),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class _AddAnimalDialog extends StatefulWidget {
//   @override
//   State<_AddAnimalDialog> createState() => _AddAnimalDialogState();
// }

// class _AddAnimalDialogState extends State<_AddAnimalDialog> {
//   final _nameController = TextEditingController();
//   final _speciesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AnimalProvider>(context, listen: false);
//     return AlertDialog(
//       title: Text('Nouvel animal'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nom')),
//           TextField(controller: _speciesController, decoration: InputDecoration(labelText: 'Espèce')),
//         ],
//       ),
//       actions: [
//         TextButton(
//           child: Text('Annuler'),
//           onPressed: () => Navigator.pop(context),
//         ),
//         ElevatedButton(
//           child: Text('Enregistrer'),
//           onPressed: () {
//             provider.addAnimal(Animal(
//               name: _nameController.text,
//               species: _speciesController.text,
//             ));
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }

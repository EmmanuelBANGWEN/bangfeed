// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'services/notification_service.dart';

// class NotificationsTestPage extends StatefulWidget {
//   const NotificationsTestPage({super.key});

//   @override
//   State<NotificationsTestPage> createState() => _NotificationsTestPageState();
// }

// class _NotificationsTestPageState extends State<NotificationsTestPage> {
//   final NotificationService _notificationService = NotificationService();
//   String? _fcmToken;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadToken();
//   }

//   Future<void> _loadToken() async {
//     setState(() => _isLoading = true);
//     String? token = await _notificationService.getToken();
//     setState(() {
//       _fcmToken = token;
//       _isLoading = false;
//     });
//   }

//   void _copyToken() {
//     if (_fcmToken != null) {
//       Clipboard.setData(ClipboardData(text: _fcmToken!));
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Token copié dans le presse-papiers')),
//       );
//     }
//   }

//   Future<void> _sendTestNotification() async {
//     await _notificationService.showLocalNotification(
//       id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
//       title: 'Test de notification',
//       body: 'Ceci est une notification locale de test',
//       data: {'screen': 'test', 'timestamp': DateTime.now().toString()},
//     );

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Notification locale envoyée')),
//       );
//     }
//   }

//   Future<void> _subscribeToTopic() async {
//     await _notificationService.subscribeToTopic('all_users');
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Abonné au topic "all_users"')),
//       );
//     }
//   }

//   Future<void> _unsubscribeFromTopic() async {
//     await _notificationService.unsubscribeFromTopic('all_users');
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Désabonné du topic "all_users"')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test des Notifications'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Section Token FCM
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.key, color: Colors.blue),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Token FCM',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: SelectableText(
//                               _fcmToken ?? 'Chargement...',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 fontFamily: 'monospace',
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton.icon(
//                                   onPressed: _copyToken,
//                                   icon: const Icon(Icons.copy, size: 18),
//                                   label: const Text('Copier'),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Expanded(
//                                 child: ElevatedButton.icon(
//                                   onPressed: _loadToken,
//                                   icon: const Icon(Icons.refresh, size: 18),
//                                   label: const Text('Recharger'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Section Tests
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.notifications_active,
//                                   color: Colors.orange),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Tests',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           ElevatedButton.icon(
//                             onPressed: _sendTestNotification,
//                             icon: const Icon(Icons.send),
//                             label: const Text('Envoyer notification locale'),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: const Size(double.infinity, 50),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Section Topics
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.topic, color: Colors.green),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Gestion des Topics',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           ElevatedButton.icon(
//                             onPressed: _subscribeToTopic,
//                             icon: const Icon(Icons.add_circle),
//                             label: const Text('S\'abonner à "all_users"'),
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: const Size(double.infinity, 50),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           OutlinedButton.icon(
//                             onPressed: _unsubscribeFromTopic,
//                             icon: const Icon(Icons.remove_circle),
//                             label: const Text('Se désabonner de "all_users"'),
//                             style: OutlinedButton.styleFrom(
//                               minimumSize: const Size(double.infinity, 50),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Instructions
//                   Card(
//                     color: Colors.blue[50],
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               const Icon(Icons.info, color: Colors.blue),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Instructions',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 12),
//                           const Text(
//                             '1. Copiez le token FCM ci-dessus\n'
//                             '2. Envoyez-le à votre backend Django\n'
//                             '3. Utilisez la console Firebase ou votre API pour envoyer des notifications\n'
//                             '4. Testez avec l\'app en avant-plan, arrière-plan et fermée',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
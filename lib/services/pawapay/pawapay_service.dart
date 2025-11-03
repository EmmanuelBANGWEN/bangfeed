// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart'; // Ajoutez cette dépendance dans pubspec.yaml

// class PawaPayService {
//   final String _apiToken;
//   final String _sandboxUrl = 'https://api.sandbox.pawapay.io/v2/deposits';
//   final _uuid = const Uuid();

//   PawaPayService(this._apiToken);

//   /// Crée un paiement Mobile Money pour le montant spécifié
//   Future<bool> initiatePayment({
//     required String phoneNumber,
//     required int amount,
//     String currency = 'XAF',
//     String provider = 'ORANGE_CMR', // ou MTN_MOMO_CMR
//     String? clientReferenceId,
//     String customerMessage = 'Formule aliment', // Max 22 caractères !
//   }) async {
//     // ✅ Génération d'un UUID v4 valide (36 caractères)
//     final depositId = _uuid.v4();
    
//     // Utiliser le depositId comme clientReferenceId si non fourni
//     final refId = clientReferenceId ?? 'FORM-${DateTime.now().millisecondsSinceEpoch}';

//     final body = {
//       "depositId": depositId, // ✅ UUID v4 de 36 caractères
//       "payer": {
//         "type": "MMO",
//         "accountDetails": {
//           "phoneNumber": phoneNumber,
//           "provider": provider
//         }
//       },
//       "clientReferenceId": refId,
//       "customerMessage": customerMessage,
//       "amount": amount.toString(),
//       "currency": currency,
//       "metadata": [
//         {"orderId": "ORD-$depositId"},
//         {"customerId": phoneNumber, "isPII": true}
//       ]
//     };

//     try {
//       print('🔄 Initiation du paiement...');
//       print('📱 Téléphone: $phoneNumber');
//       print('💰 Montant: $amount $currency');
//       print('🆔 Deposit ID: $depositId');
      
//       final response = await http.post(
//         Uri.parse(_sandboxUrl),
//         headers: {
//           "Authorization": "Bearer $_apiToken",
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode(body),
//       );

//       print('📊 Status Code: ${response.statusCode}');
//       print('📄 Response: ${response.body}');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = jsonDecode(response.body);
        
//         if (data['status'] == 'ACCEPTED') {
//           print('✅ Paiement initié avec succès');
          
//           // Optionnel : Vérifier le statut après quelques secondes
//           await Future.delayed(const Duration(seconds: 3));
//           final status = await checkPaymentStatus(depositId);
//           print('📊 Statut du paiement: $status');
          
//           return status == 'COMPLETED';
//         } else {
//           print('❌ Paiement rejeté: ${data['status']}');
//           if (data['failureReason'] != null) {
//             print('Raison: ${data['failureReason']}');
//           }
//           return false;
//         }
//       } else {
//         print('❌ Erreur HTTP: ${response.statusCode} ${response.body}');
//         return false;
//       }
//     } catch (e) {
//       print('❌ Exception lors du paiement: $e');
//       return false;
//     }
//   }

//   /// Vérifie le statut d'un paiement
//   Future<String?> checkPaymentStatus(String depositId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$_sandboxUrl/$depositId'),
//         headers: {
//           "Authorization": "Bearer $_apiToken",
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
        
//         if (data['status'] == 'FOUND') {
//           return data['data']['status']; // COMPLETED, FAILED, PROCESSING, etc.
//         }
//       }
      
//       return null;
//     } catch (e) {
//       print('❌ Erreur lors de la vérification: $e');
//       return null;
//     }
//   }
// }
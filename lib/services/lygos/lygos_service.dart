import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LygosService {
  final String _apiKey = 'lygosapp-4d74643c-6bfa-4bc3-a32f-e4e8af7a9262';
// final String _apiKey = 'lygossandbox-e9195bd7-d239-4310-9510-f35c26d121f7'; //ancien

// api de la sandbox pour faire les tests
// final String _apiKey = 'lygossandbox-e9195bd7-d239-4310-9510-f35c26d121f7'; //ancien
    // final String _apiKey = 'lygossandbox-7508b693-99d3-4e80-b30d-9a5c001928b6';
  // final String _baseUrl = 'https://server-sandbox.lygosapp.com/api/v1/api/';

  final String _baseUrl = 'https://api.lygosapp.com/v1/';


  String? lastOrderId; // <-- AJOUT

  // Créer un lien de paiement
  // Future<Map<String, dynamic>> createPayment({
  //   required int amount,
  //   required String shopName,
  //   required String orderId,
  //   String message = '',
  //   String successUrl = '',
  //   String failureUrl = '',
  // }) async {
  //   final url = Uri.parse('${_baseUrl}gateway');
  //   lastOrderId = orderId; // <-- TRÈS IMPORTANT
    
  //       print('🔄 Création paiement: $orderId - $amount FCFA');

  //   await saveOrderId(orderId); // 🔥 Sauvegarde persistante

  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'api-key': _apiKey,
  //     },
  //     body: jsonEncode({
  //       'amount': amount,
  //       'shop_name': shopName,
  //       'order_id': orderId,
  //       'message': message,
  //       'success_url': successUrl,
  //       'failure_url': failureUrl,
  //     }),
  //   );

  //   // if (response.statusCode == 200) {


  //   //   return jsonDecode(response.body);
  //   // } else {
  //   //   throw Exception('Erreur LyGoS: ${response.statusCode} ${response.body}');
  //   // }
  

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print('✅ Paiement créé: ${data['link']}');
  //     return data;
  //   } else {
  //     print('❌ Erreur: ${response.statusCode} ${response.body}');
  //     throw Exception('Erreur LyGoS: ${response.statusCode} ${response.body}');
  //   }


  
  // }


// Future<Map<String, dynamic>> createPayment({
//   required int amount,
//   required String shopName,
//   required String orderId,
//   String message = '',
//   String successUrl = '',
//   String failureUrl = '',
// }) async {
//   try {
//     final url = Uri.parse('${_baseUrl}gateway');
    
//     print('🔄 Appel API Lygos: $url');
//     print('📦 Payload: amount=$amount, orderId=$orderId');

//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'api-key': _apiKey,
//       },
//       body: jsonEncode({
//         'amount': amount,
//         'shop_name': shopName,
//         'order_id': orderId,
//         'message': message,
//         'success_url': successUrl,
//         'failure_url': failureUrl,
//       }),
//     );

//     print('📥 Status Code: ${response.statusCode}');
//     print('📥 Response Body: ${response.body}');

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final data = jsonDecode(response.body);
//       print('✅ Paiement créé: ${data['link']}');
//       return data;
//     } else {
//       print('❌ Erreur API: ${response.statusCode}');
//       print('❌ Body: ${response.body}');
//       throw Exception('Erreur LyGoS (${response.statusCode}): ${response.body}');
//     }
//   } catch (e) {
//     print('❌ Exception LygosService: $e');
//     rethrow; // Propager l'erreur
//   }
// }



Future<Map<String, dynamic>> createPayment({
  required int amount,
  required String shopName,
  required String orderId,
  String message = '',
  String successUrl = 'https://bangri.site/lygos/success_lygos',
  String failureUrl = 'https://bangri.site/lygos/failed_lygos',
}) async {
  try {
    final url = Uri.parse('${_baseUrl}gateway');
    
    print('🔄 Appel API Lygos: $url');
    print('📦 Payload: amount=$amount, orderId=$orderId');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'api-key': _apiKey,
      },
      body: jsonEncode({
        'amount': amount,
        'shop_name': shopName,
        'order_id': orderId,
        'message': message,
        'success_url': successUrl,
        'failure_url': failureUrl,
      }),
    );

    print('📥 Status Code: ${response.statusCode}');
    print('📥 Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      
      // 🔥 CORRECTION : Ajouter https:// si manquant
      String paymentLink = data['link'] ?? '';
      if (paymentLink.isNotEmpty && !paymentLink.startsWith('http')) {
        paymentLink = 'https://$paymentLink';
      }
      
      // Mettre à jour le lien dans la réponse
      data['link'] = paymentLink;
      
      print('✅ Paiement créé: $paymentLink');
      return data;
    } else {
      print('❌ Erreur API: ${response.statusCode}');
      print('❌ Body: ${response.body}');
      throw Exception('Erreur LyGoS (${response.statusCode}): ${response.body}');
    }
  } catch (e) {
    print('❌ Exception LygosService: $e');
    rethrow;
  }
}

  // Vérifier le statut du paiement
  Future<String> getPayinStatus(String orderId) async {
    final url = Uri.parse('${_baseUrl}gateway/payin/$orderId');

    print('🔍 Vérification statut: $orderId');


    final response = await http.get(
      url,
      headers: {
        'api-key': _apiKey,
      },
    );


    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   return data['status'] ?? 'unknown';
    // } else {
    //   throw Exception('Erreur LyGoS: ${response.statusCode} ${response.body}');
    // }



    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final status = data['status'] ?? 'unknown';
      print('📊 Statut actuel: $status');
      return status;
    } else {
      print('❌ Erreur: ${response.statusCode} ${response.body}');
      throw Exception('Erreur LyGoS: ${response.statusCode} ${response.body}');
    }



  }





  /// 🧪 TEST: Obtenir les détails complets d'un paiement
  Future<Map<String, dynamic>> getPaymentDetails(String orderId) async {
    final url = Uri.parse('${_baseUrl}gateway/payin/$orderId');

    final response = await http.get(
      url,
      headers: {
        'api-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erreur: ${response.statusCode}');
    }
  }





Future<void> saveOrderId(String orderId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('last_order_id', orderId);
}

Future<String?> loadLastOrderId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('last_order_id');
}

Future<void> clearOrderId() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('last_order_id');
}

Future<String> checkSavedPaymentStatus() async {
  final savedOrderId = await loadLastOrderId();
  if (savedOrderId == null) return "no_order";

  final status = await getPayinStatus(savedOrderId);

  if (status == "success") {
    await clearOrderId(); // supprimer orderId
  }

  return status;
}


}

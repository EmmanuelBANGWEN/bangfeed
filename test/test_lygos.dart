import 'dart:convert';
import 'package:http/http.dart' as http;

/// Script de test rapide pour l'API Lygos
/// Exécute ce fichier avec: dart run test_lygos.dart
void main() async {
  print('🧪 TEST LYGOS SANDBOX - BANGFEED\n');
  
  final tester = LygosQuickTest();
  
  // Test 1: Création de paiement
  print('📝 Test 1: Création de paiement...');
  await tester.testCreatePayment();
  
  await Future.delayed(const Duration(seconds: 2));
  
  // Test 2: Vérification statut (avant paiement)
  print('\n📝 Test 2: Vérification statut initial...');
  await tester.testCheckStatus();
  
  print('\n✅ Tests terminés !');
  print('\n📱 Prochaine étape:');
  print('   1. Ouvre le lien de paiement dans le navigateur');
  print('   2. Utilise un numéro de test (+237 655 111111)');
  print('   3. Complète le paiement');
  print('   4. Revérifie le statut avec testCheckStatus()');
}

class LygosQuickTest {
  final String apiKey = 'lygossandbox-e9195bd7-d239-4310-9510-f35c26d121f7';
  final String baseUrl = 'https://api.lygosapp.com/v1/';
  String? lastOrderId;
  String? lastPaymentLink;

  /// Test: Créer un paiement
  Future<void> testCreatePayment() async {
    try {
      final orderId = 'QUICKTEST_${DateTime.now().millisecondsSinceEpoch}';
      lastOrderId = orderId;

      final url = Uri.parse('${baseUrl}gateway');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'api-key': apiKey,
        },
        body: jsonEncode({
          'amount': 100,
          'shop_name': 'BangFeed Test',
          'order_id': orderId,
          'message': 'Test rapide',
          'success_url': 'https://bangfeed.com/success',
          'failure_url': 'https://bangfeed.com/failure',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        lastPaymentLink = data['link'];
        
        print('   ✅ Paiement créé');
        print('   📋 Order ID: $orderId');
        print('   🔗 Lien: $lastPaymentLink');
      } else {
        print('   ❌ Erreur ${response.statusCode}');
        print('   Response: ${response.body}');
      }
    } catch (e) {
      print('   ❌ Exception: $e');
    }
  }

  /// Test: Vérifier le statut
  Future<void> testCheckStatus() async {
    if (lastOrderId == null) {
      print('   ⚠️  Aucun Order ID. Crée d\'abord un paiement.');
      return;
    }

    try {
      final url = Uri.parse('${baseUrl}gateway/payin/$lastOrderId');
      final response = await http.get(
        url,
        headers: {
          'api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final status = data['status'];
        
        print('   ✅ Statut récupéré');
        print('   📊 Status: $status');
        print('   📋 Order ID: ${data['order_id']}');
        print('   💰 Montant: ${data['amount']} FCFA');
        
        if (data['payment_method'] != null) {
          print('   💳 Méthode: ${data['payment_method']}');
        }
        
        // Interprétation
        print('\n   💡 Interprétation:');
        switch (status) {
          case 'pending':
            print('      → Paiement en attente (pas encore payé)');
            break;
          case 'success':
            print('      → ✅ Paiement réussi ! Premium à activer');
            break;
          case 'failed':
            print('      → ❌ Paiement échoué');
            break;
          default:
            print('      → Status inconnu: $status');
        }
      } else {
        print('   ❌ Erreur ${response.statusCode}');
        print('   Response: ${response.body}');
      }
    } catch (e) {
      print('   ❌ Exception: $e');
    }
  }

  /// Test: Toute la séquence
  Future<void> testFullFlow() async {
    print('🔄 Test complet du flux...\n');
    
    await testCreatePayment();
    
    print('\n⏳ Attente de 5 secondes...');
    await Future.delayed(const Duration(seconds: 5));
    
    await testCheckStatus();
  }
}

// Pour tester manuellement avec un Order ID spécifique
void testSpecificOrder(String orderId) async {
  print('🔍 Test Order ID: $orderId\n');
  
  final tester = LygosQuickTest();
  tester.lastOrderId = orderId;
  await tester.testCheckStatus();
}

// Exemples de numéros de test
void printTestNumbers() {
  print('''
📱 NUMÉROS DE TEST CAMEROUN (+237)

✅ PAIEMENT RÉUSSI (terminaison 111111):
   • +237 655 111111  (Orange Money)
   • +237 670 111111  (MTN Mobile Money)
   • +237 680 111111  (MTN Mobile Money)

❌ PAIEMENT ÉCHOUÉ (terminaison 555555):
   • +237 655 555555  (Orange Money)
   • +237 670 555555  (MTN Mobile Money)

⚠️ ERREUR STATUT (terminaison 333333):
   • +237 655 333333  (Orange Money)
   • +237 670 333333  (MTN Mobile Money)

💡 Note: Remplacez 655/670/680 par n'importe quel préfixe opérateur
  ''');
}
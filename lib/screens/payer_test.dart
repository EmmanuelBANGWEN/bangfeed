import 'package:bangfeed/services/lygos/lygos_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TestPaymentPage extends StatefulWidget {
  const TestPaymentPage({super.key});

  @override
  State<TestPaymentPage> createState() => _TestPaymentPageState();
}

class _TestPaymentPageState extends State<TestPaymentPage> {
  final LygosService _lygosService = LygosService();
  final TextEditingController _amountController = TextEditingController(text: '100');
  final TextEditingController _orderIdController = TextEditingController();
  
  bool _loading = false;
  String? _currentOrderId;
  String? _paymentLink;
  Map<String, dynamic>? _paymentDetails;

  @override
  void initState() {
    super.initState();
    _generateOrderId();
  }

  void _generateOrderId() {
    final orderId = 'TEST_${DateTime.now().millisecondsSinceEpoch}';
    _orderIdController.text = orderId;
  }

  /// Test 1: Créer un paiement
  Future<void> _testCreatePayment() async {
    setState(() {
      _loading = true;
      _paymentLink = null;
      _paymentDetails = null;
    });

    try {
      final amount = int.parse(_amountController.text);
      final orderId = _orderIdController.text;

      final paymentData = await _lygosService.createPayment(
        amount: amount,
        shopName: 'BangFeed TEST',
        orderId: orderId,
        message: 'Test paiement BangFeed',
        successUrl: 'https://bangfeed.com/success',
        failureUrl: 'https://bangfeed.com/failure',
      );

      setState(() {
        _currentOrderId = orderId;
        _paymentLink = paymentData['link'];
      });

      _showSnackBar('✅ Paiement créé avec succès', Colors.green);
    } catch (e) {
      _showSnackBar('❌ Erreur: $e', Colors.red);
    } finally {
      setState(() => _loading = false);
    }
  }

  /// Test 2: Ouvrir le lien de paiement
  Future<void> _testOpenPayment() async {
    if (_paymentLink == null) {
      _showSnackBar('⚠️ Créez d\'abord un paiement', Colors.orange);
      return;
    }

    try {
      final uri = Uri.parse(_paymentLink!);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      _showSnackBar('🌐 Lien ouvert dans le navigateur', Colors.blue);
    } catch (e) {
      _showSnackBar('❌ Erreur ouverture: $e', Colors.red);
    }
  }

  /// Test 3: Vérifier le statut
  Future<void> _testCheckStatus() async {
    if (_currentOrderId == null) {
      _showSnackBar('⚠️ Aucun paiement à vérifier', Colors.orange);
      return;
    }

    setState(() => _loading = true);

    try {
      final status = await _lygosService.getPayinStatus(_currentOrderId!);
      final details = await _lygosService.getPaymentDetails(_currentOrderId!);

      setState(() => _paymentDetails = details);

      _showSnackBar('📊 Statut: $status', Colors.blue);
    } catch (e) {
      _showSnackBar('❌ Erreur: $e', Colors.red);
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showTestNumbersInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('📱 Numéros de Test'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Cameroun (+237)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildTestNumberInfo('✅ Réussi', '+237 655 111111', Colors.green),
              _buildTestNumberInfo('✅ Réussi', '+237 670 111111', Colors.green),
              const SizedBox(height: 12),
              _buildTestNumberInfo('❌ Échoué', '+237 655 555555', Colors.red),
              _buildTestNumberInfo('❌ Échoué', '+237 670 555555', Colors.red),
              const SizedBox(height: 12),
              _buildTestNumberInfo('⚠️ Erreur', '+237 655 333333', Colors.orange),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.blue[50],
                child: const Text(
                  '💡 Remplacez 655/670 par n\'importe quel préfixe opérateur',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildTestNumberInfo(String label, String number, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SelectableText(
              number,
              style: const TextStyle(fontFamily: 'Courier', fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('🧪 Test Lygos Sandbox'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_android),
            tooltip: 'Numéros de test',
            onPressed: () {
              // Importer: import 'package:bangfeed/widgets/test_numbers_dialog.dart';
              // TestNumbersDialog.show(context);
              _showTestNumbersInfo(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bannière mode test
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: Row(
                children: const [
                  Icon(Icons.science, color: Colors.orange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '🧪 Mode TEST (Sandbox)\nAucun vrai paiement ne sera effectué',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Configuration du paiement
            _buildCard(
              title: '1️⃣ Configuration',
              child: Column(
                children: [
                  TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Montant (FCFA)',
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _orderIdController,
                    decoration: InputDecoration(
                      labelText: 'Order ID',
                      prefixIcon: const Icon(Icons.tag),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: _generateOrderId,
                        tooltip: 'Générer nouveau ID',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Actions de test
            _buildCard(
              title: '2️⃣ Actions de test',
              child: Column(
                children: [
                  _buildTestButton(
                    label: 'Créer un paiement',
                    icon: Icons.add_circle,
                    color: Colors.blue,
                    onPressed: _loading ? null : _testCreatePayment,
                  ),
                  const SizedBox(height: 12),
                  _buildTestButton(
                    label: 'Ouvrir le lien de paiement',
                    icon: Icons.open_in_browser,
                    color: Colors.green,
                    onPressed: _paymentLink == null ? null : _testOpenPayment,
                  ),
                  const SizedBox(height: 12),
                  _buildTestButton(
                    label: 'Vérifier le statut',
                    icon: Icons.refresh,
                    color: Colors.orange,
                    onPressed: _currentOrderId == null ? null : _testCheckStatus,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Résultats
            if (_paymentLink != null) ...[
              _buildCard(
                title: '3️⃣ Lien de paiement',
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _paymentLink!,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _paymentLink!));
                        _showSnackBar('📋 Lien copié', Colors.blue);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            if (_paymentDetails != null) ...[
              _buildCard(
                title: '4️⃣ Détails du paiement',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Order ID', _paymentDetails!['order_id']),
                    _buildDetailRow('Montant', '${_paymentDetails!['amount']} FCFA'),
                    _buildDetailRow('Statut', _paymentDetails!['status']),
                    _buildDetailRow('Shop', _paymentDetails!['shop_name']),
                    if (_paymentDetails!['payment_method'] != null)
                      _buildDetailRow('Méthode', _paymentDetails!['payment_method']),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Instructions
            _buildCard(
              title: '📝 Instructions',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('1. Créez un paiement', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('2. Ouvrez le lien et effectuez le paiement test'),
                  Text('3. Revenez à l\'app et vérifiez le statut'),
                  SizedBox(height: 16),
                  Text(
                    '📱 Numéros de test Cameroun (+237):',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text('✅ Paiement réussi: +237 XXX 111111', style: TextStyle(color: Colors.green)),
                  Text('   Ex: +237 655 111111 ou +237 670 111111'),
                  SizedBox(height: 4),
                  Text('❌ Paiement échoué: +237 XXX 555555', style: TextStyle(color: Colors.red)),
                  Text('   Ex: +237 655 555555 ou +237 670 555555'),
                  SizedBox(height: 4),
                  Text('⚠️ Erreur status: +237 XXX 333333', style: TextStyle(color: Colors.orange)),
                  Text('   Ex: +237 655 333333 ou +237 670 333333'),
                  SizedBox(height: 12),
                  Text(
                    '💡 XXX = préfixe opérateur (655, 670, 680, etc.)',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildTestButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value?.toString() ?? 'N/A',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _orderIdController.dispose();
    super.dispose();
  }
}
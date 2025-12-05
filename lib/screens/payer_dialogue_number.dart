import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Dialog helper pour afficher les numéros de test Lygos
class TestNumbersDialog extends StatelessWidget {
  const TestNumbersDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const TestNumbersDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.phone_android, color: Colors.white),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Numéros de Test Cameroun',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Content
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoBox(),
                  const SizedBox(height: 20),
                  _buildTestNumberCard(
                    title: '✅ Paiement Réussi',
                    subtitle: 'Terminaison: 111111',
                    color: Colors.green,
                    numbers: [
                      '+237 655 111111',
                      '+237 670 111111',
                      '+237 680 111111',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTestNumberCard(
                    title: '❌ Paiement Échoué',
                    subtitle: 'Terminaison: 555555',
                    color: Colors.red,
                    numbers: [
                      '+237 655 555555',
                      '+237 670 555555',
                      '+237 680 555555',
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTestNumberCard(
                    title: '⚠️ Erreur Statut',
                    subtitle: 'Terminaison: 333333',
                    color: Colors.orange,
                    numbers: [
                      '+237 655 333333',
                      '+237 670 333333',
                      '+237 680 333333',
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildOperatorInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.blue[700]),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Ces numéros ne fonctionnent qu\'en mode Sandbox. Cliquez sur un numéro pour le copier.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestNumberCard({
    required String title,
    required String subtitle,
    required Color color,
    required List<String> numbers,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    // color: color.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    // color: color.shade600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: numbers
                  .map((number) => _buildNumberTile(number, color))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberTile(String number, Color color) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: number));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('📋 $number copié'),
              duration: const Duration(seconds: 2),
              backgroundColor: color,
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.phone_android,
                  size: 20,
                  color: color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  number,
                  style: const TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.copy,
                size: 18,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.amber[700], size: 20),
              const SizedBox(width: 8),
              const Text(
                'Préfixes opérateurs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildOperatorRow('Orange Money', '655-659, 699'),
          const SizedBox(height: 8),
          _buildOperatorRow('MTN Mobile Money', '670-689'),
          const SizedBox(height: 12),
          const Text(
            'Vous pouvez remplacer le préfixe par n\'importe quel code opérateur valide.',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildOperatorRow(String operator, String codes) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        const Text('•', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$operator: ',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                TextSpan(text: codes),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Extension pour faciliter l'utilisation
extension TestNumbersExtension on BuildContext {
  void showTestNumbers() {
    TestNumbersDialog.show(this);
  }
}
import 'package:bangfeed/services/lygos/lygos_service.dart';
import 'package:bangfeed/services/premium_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final LygosService _lygosService = LygosService();
  bool _loading = false;

  Future<void> _pay() async {
    setState(() => _loading = true);

    try {
      final orderId = DateTime.now().millisecondsSinceEpoch.toString();

      final paymentData = await _lygosService.createPayment(
        amount: 1000,
        shopName: 'BangFeed',
        orderId: orderId,
        message: 'Abonnement premium BangFeed',
        successUrl: 'https://bangfeed.com/success',
        failureUrl: 'https://bangfeed.com/failure',
      );

      final paymentUrl = paymentData['link'];

      final uri = Uri.parse(paymentUrl);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    Future.delayed(const Duration(seconds: 3), () {
  _autoCheckPayment();
});

    
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de paiement: $e')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _confirmPayment() async {
    final orderId = _lygosService.lastOrderId;

    if (orderId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aucun paiement à vérifier")),
      );
      return;
    }

    final status = await _lygosService.getPayinStatus(orderId);

    if (status == "success") {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      await PremiumService().activatePremium(uid);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Premium activé 🎉")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Paiement non confirmé : $status")),
      );
    }
  }


@override
void initState() {
  super.initState();
  _autoCheckPayment();
}



Future<void> _autoCheckPayment() async {
  final status = await _lygosService.checkSavedPaymentStatus();

  if (status == "success") {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await PremiumService().activatePremium(uid);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✨ Paiement confirmé automatiquement ! Premium activé")),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Devenir Premium'),
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Badge promotion
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '🔥 OFFRE LIMITÉE -50%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Carte principale
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFD97706),
                      Colors.orange.shade600,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Icon(
                      Icons.workspace_premium,
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'BangFeed Premium',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Formulations illimitées',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // Prix barré
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2000',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white70,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'FCFA',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Nouveau prix
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '1000',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            'FCFA/mois',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 10),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Économisez 1000 FCFA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Avantages
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Inclus dans votre abonnement :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildFeature('Formulations illimitées', Icons.all_inclusive),
                    _buildFeature('Formations illimitées', Icons.all_inclusive),
                    _buildFeature('Accès prioritaire', Icons.star),
                    _buildFeature('Support premium', Icons.support_agent),
                    _buildFeature('Nouvelles fonctionnalités en avant-première', Icons.new_releases),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Bouton de paiement
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _loading ? null : _pay,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97706),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    shadowColor: Colors.orange.withOpacity(0.5),
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Obtenir Premium maintenant',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 15),

              // Bouton confirmation
              // TextButton.icon(
              //   onPressed: _confirmPayment,
              //   icon: const Icon(Icons.check_circle_outline),
              //   label: const Text('Confirmer mon paiement'),
              //   style: TextButton.styleFrom(
              //     foregroundColor: const Color(0xFFD97706),
              //   ),
              // ),




              const SizedBox(height: 20),

              // Note de sécurité
              Text(
                '🔒 Paiement sécurisé',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFD97706),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 20,
          ),
        ],
      ),
    );
  }
}
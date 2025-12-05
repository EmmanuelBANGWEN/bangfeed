import 'package:bangfeed/screens/payer_test.dart';
import 'package:bangfeed/services/premium_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:bangfeed/providers/formulation_provider.dart';
import 'package:bangfeed/screens/payer.dart';



class LocalUser {
  final String uid;
  final String email;
  final bool isPremium;
  final DateTime? premiumUntil;

  LocalUser({
    required this.uid,
    required this.email,
    this.isPremium = false,
    this.premiumUntil,
  });
}


class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  LocalUser? _currentUser;
  bool _isLoading = true;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }





  // Future<void> _loadUserData() async {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) {
  //       setState(() => _isLoading = false);
  //       return;
  //     }

  //     final data = await FirestoreService().getUserData(user.uid);
  //     final isPremium = data?['isPremium'] ?? false;



  //     setState(() {
  //       _currentUser = LocalUser(
  //         uid: user.uid,
  //         email: user.email ?? 'Non défini',
  //         isPremium: isPremium,
  //       );
  //       _isLoading = false;
  //     });

  //     print("✅ User loaded: ${_currentUser?.email}, Premium: ${_currentUser?.isPremium}");
  //   } catch (e) {
  //     print('❌ Erreur chargement user: $e');
  //     setState(() => _isLoading = false);
  //   }
  // }



















// Future<void> _loadUserData() async {
//   setState(() {
//     _isLoading = true;
//   });

//   final user = FirebaseAuth.instance.currentUser;
//   if (user == null) {
//     setState(() {
//       _isLoading = false;
//     });
//     return;
//   }

//   final data = await _firestore.collection('users').doc(user.uid).get();
//   final userData = data.data();

//   bool isPremium = userData?['isPremium'] ?? false;

//   // Récupération de premiumUntil
//   DateTime? premiumUntil;
//   final premiumUntilRaw = userData?['premiumUntil'];

//   if (premiumUntilRaw is Timestamp) {
//     premiumUntil = premiumUntilRaw.toDate();
//   } else if (premiumUntilRaw is String) {
//     premiumUntil = DateTime.parse(premiumUntilRaw);
//   }

//   setState(() {
//     _currentUser = LocalUser(
//       uid: user.uid,
//       email: user.email ?? "Non défini",
//       isPremium: isPremium,
//       premiumUntil: premiumUntil,
//     );

//     _isLoading = false;
//   });
// }






Future<void> _loadUserData() async {
  setState(() {
    _isLoading = true;
  });

  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    setState(() {
      _isLoading = false;
    });
    return;
  }

  // ✅ Utiliser le service centralisé
  final premiumData = await PremiumService().getUserPremiumData();

  setState(() {
    _currentUser = LocalUser(
      uid: user.uid,
      email: user.email ?? "Non défini",
      isPremium: premiumData['isPremium'],
      premiumUntil: premiumData['premiumUntil'],
    );

    _isLoading = false;
  });
}






















  @override
  Widget build(BuildContext context) {
    final formulations = context.watch<FormulationProvider>().formulations;
    final formulationCount = formulations.length;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD97706),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mon Compte',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentUser == null
              ? _buildNotConnected()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ═══════════════════════════════════════
                      // SECTION 1: PROFIL UTILISATEUR
                      // ═══════════════════════════════════════
                      _buildProfileCard(),

                      const SizedBox(height: 20),

                      // ═══════════════════════════════════════
                      // SECTION 2: STATUT ABONNEMENT
                      // ═══════════════════════════════════════
                      _buildSubscriptionCard(),

                      const SizedBox(height: 20),

                      // ═══════════════════════════════════════
                      // SECTION 3: STATISTIQUES
                      // ═══════════════════════════════════════
                      _buildStatsCard(formulationCount),

                      const SizedBox(height: 20),

                      // ═══════════════════════════════════════
                      // SECTION 4: BOUTON UPGRADE (si gratuit)
                      // ═══════════════════════════════════════
                      if (!_currentUser!.isPremium) ...[
                        _buildUpgradeButton(),
                        const SizedBox(height: 20),
                      ],

                      // ═══════════════════════════════════════
                      // SECTION 5: INFORMATIONS SUPPLÉMENTAIRES
                      // ═══════════════════════════════════════
                      _buildInfoCard(),
                    ],
                  ),
                ),
    );
  }

  // ════════════════════════════════════════════════════════════
  // WIDGETS INDIVIDUELS
  // ════════════════════════════════════════════════════════════

  Widget _buildNotConnected() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_off, size: 100, color: Colors.grey[400]),
            const SizedBox(height: 24),
            const Text(
              'Non connecté',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B2E2A),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Veuillez vous connecter pour accéder à votre compte',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: _currentUser!.isPremium
                    ? [const Color(0xFFFFD700), const Color(0xFFFFA500)]
                    : [Colors.grey[400]!, Colors.grey[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: _currentUser!.isPremium
                      ? Colors.orange.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              _currentUser!.isPremium ? Icons.diamond : Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Email
          Text(
            _currentUser!.email,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B2E2A),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // UID (version courte)
          Text(
            'ID: ${_currentUser!.uid.substring(0, 8)}...',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }














Widget _buildSubscriptionCard() {
  // final isPremium = _currentUser!.isPremium;
final now = DateTime.now();
final isPremiumActive = _currentUser!.isPremium &&
    (_currentUser!.premiumUntil == null || _currentUser!.premiumUntil!.isAfter(now));

  return Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      // gradient: isPremium
      gradient: isPremiumActive
          ? const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : LinearGradient(
              colors: [Colors.grey[300]!, Colors.grey[400]!],
            ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: isPremiumActive
              ? Colors.orange.withOpacity(0.3)
              : Colors.grey.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      children: [
        // Icon + Type de compte
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPremiumActive ? Icons.diamond : Icons.lock_outline,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    isPremiumActive ? 'COMPTE PREMIUM' : 'COMPTE GRATUIT',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (isPremiumActive && _currentUser!.premiumUntil != null) ...[
              const SizedBox(height: 6),
              Text(
                'Expire le : ${_currentUser!.premiumUntil!.day}/${_currentUser!.premiumUntil!.month}/${_currentUser!.premiumUntil!.year}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),

        const SizedBox(height: 16),

        // Info sur les fonctionnalités
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isPremiumActive
                ? '✅ Formulations illimitées\n✅ Accès complet à toutes les fonctionnalités'
                : '⚠️ Limité à 3 formulations\n⚠️ Accès restreint',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}































  Widget _buildStatsCard(int formulationCount) {
    final isPremium = _currentUser!.isPremium;
    final maxFormulations = isPremium ? '∞' : '3';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.analytics, color: Color(0xFFD97706), size: 28),
              SizedBox(width: 12),
              Text(
                'Statistiques',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Nombre de formulations
          _buildStatRow(
            icon: Icons.science,
            label: 'Formulations créées',
            value: '$formulationCount',
            color: const Color(0xFFD97706),
          ),

          const Divider(height: 24),

          // Type de compte
          _buildStatRow(
            icon: isPremium ? Icons.diamond : Icons.lock_outline,
            label: 'Type de compte',
            value: isPremium ? 'Premium' : 'Gratuit',
            color: isPremium ? Colors.orange : Colors.grey,
          ),

          const Divider(height: 24),

          // Progression (si gratuit)
          if (!isPremium)
            _buildProgressBar(formulationCount),
        ],
      ),
    );
  }

  Widget _buildStatRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4B2E2A),
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(int formulationCount) {
    final progress = (formulationCount / 3).clamp(0.0, 1.0);
    final percentage = (progress * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Limite utilisée',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4B2E2A),
              ),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD97706),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              formulationCount >= 3 ? Colors.red : const Color(0xFFD97706),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpgradeButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const PayPage()),
              MaterialPageRoute(builder: (context) => const TestPaymentPage()),


            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.diamond, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Text(
                  'PASSER À PREMIUM',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.info_outline, color: Color(0xFFD97706), size: 24),
              SizedBox(width: 10),
              Text(
                'Informations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B2E2A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Version', 'BangFeed 1.0'),
          const Divider(height: 20),
          _buildInfoRow('Support', 'bikoyemmanuel531@gmail.com'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B2E2A),
          ),
        ),
      ],
    );
  }
}
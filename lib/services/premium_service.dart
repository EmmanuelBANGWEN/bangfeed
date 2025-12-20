import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Service centralisé pour gérer le statut premium
/// Vérifie à la fois isPremium ET premiumUntil
class PremiumService {
  final FirebaseFirestore? _firestore;
  final bool _isOffline;

  // ✅ Constructeur qui gère le mode offline
  PremiumService({bool? isOffline}) 
      : _isOffline = isOffline ?? false,
        _firestore = (isOffline == true) ? null : FirebaseFirestore.instance;
  
  /// Vérifie si l'utilisateur est premium ET que son abonnement est encore valide
  Future<bool> checkPremiumStatus() async {
    // ✅ En mode offline, retourne false
    if (_isOffline || _firestore == null) {
      print('⚠️ Mode offline - Premium status non disponible');
      return false;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;

      final doc = await _firestore!.collection('users').doc(user.uid).get();
      if (!doc.exists) return false;

      final data = doc.data();
      if (data == null) return false;

      // Si pas premium dans Firestore → pas premium
      final isPremium = data['isPremium'] ?? false;
      if (!isPremium) return false;

      // Récupérer la date d'expiration
      final premiumUntilRaw = data['premiumUntil'];
      if (premiumUntilRaw == null) return false;

      DateTime premiumUntil;

      // Firestore stocke parfois un Timestamp, parfois une String
      if (premiumUntilRaw is Timestamp) {
        premiumUntil = premiumUntilRaw.toDate();
      } else if (premiumUntilRaw is String) {
        premiumUntil = DateTime.parse(premiumUntilRaw);
      } else {
        return false;
      }

      // Vérifier si premium toujours valide
      if (DateTime.now().isBefore(premiumUntil)) {
        return true;
      }

      // ❗ Premium expiré → désactiver automatiquement
      await _firestore!.collection('users').doc(user.uid).update({
        'isPremium': false,
      });

      return false;
    } catch (e) {
      print('❌ Erreur checkPremiumStatus: $e');
      return false;
    }
  }

  /// Active le premium pour 30 jours
  Future<void> activatePremium(String uid) async {
    if (_isOffline || _firestore == null) {
      throw Exception('Mode offline: activation premium impossible');
    }

    final now = DateTime.now();
    final premiumUntil = now.add(const Duration(days: 30));

    await _firestore!.collection('users').doc(uid).set({
      'isPremium': true,
      'premiumUntil': premiumUntil.toIso8601String(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  /// Récupère les données utilisateur avec statut premium validé
  Future<Map<String, dynamic>> getUserPremiumData() async {
    if (_isOffline || _firestore == null) {
      return {
        'isPremium': false,
        'premiumUntil': null,
      };
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return {
        'isPremium': false,
        'premiumUntil': null,
      };
    }

    final isPremium = await checkPremiumStatus();
    
    final doc = await _firestore!.collection('users').doc(user.uid).get();
    final data = doc.data();
    
    DateTime? premiumUntil;
    if (data != null) {
      final premiumUntilRaw = data['premiumUntil'];
      if (premiumUntilRaw is Timestamp) {
        premiumUntil = premiumUntilRaw.toDate();
      } else if (premiumUntilRaw is String) {
        premiumUntil = DateTime.parse(premiumUntilRaw);
      }
    }

    return {
      'isPremium': isPremium,
      'premiumUntil': premiumUntil,
    };
  }
}
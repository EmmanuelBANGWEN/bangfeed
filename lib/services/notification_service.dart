import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Initialiser les notifications
  static Future<void> initialize() async {
    // Demander la permission
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission accordée');
    }

    // Configuration des notifications locales
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        // Gérer le clic sur la notification
        print('Notification cliquée: ${details.payload}');
      },
    );

    // Créer un canal de notification Android
    const androidChannel = AndroidNotificationChannel(
      'formulation_channel',
      'Formulations',
      description: 'Notifications pour les formulations sauvegardées',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    // Écouter les messages en premier plan
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Gérer les messages en arrière-plan
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    // Obtenir le token FCM
    String? token = await _messaging.getToken();
    print('FCM Token: $token');
    
    // Sauvegarder le token dans Firestore si nécessaire
    if (token != null) {
      await saveTokenToFirestore(token);
    }

    // Rafraîchir le token
    _messaging.onTokenRefresh.listen(saveTokenToFirestore);
  }

  // Gérer les messages en premier plan
  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('Message reçu en premier plan: ${message.notification?.title}');
    
    await _showLocalNotification(
      title: message.notification?.title ?? 'Nouvelle notification',
      body: message.notification?.body ?? '',
      payload: message.data.toString(),
    );
  }

  // Afficher une notification locale
  static Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'formulation_channel',
      'Formulations',
      channelDescription: 'Notifications pour les formulations sauvegardées',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecond,
      title,
      body,
      details,
      payload: payload,
    );
  }

  // Envoyer une notification locale (sans serveur)
  static Future<void> sendLocalNotification({
    required String title,
    required String body,
  }) async {
    await _showLocalNotification(
      title: title,
      body: body,
    );
  }

  // Sauvegarder le token dans Firestore
  static Future<void> saveTokenToFirestore(String token) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({
          'fcmToken': token,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print('Erreur lors de la sauvegarde du token: $e');
    }
  }

  // Envoyer une notification via Cloud Function (optionnel)
  static Future<void> triggerFormulationSavedNotification({
    required String userId,
    required String animalType,
    required String stage,
    required double totalCost,
  }) async {
    // Appeler votre Cloud Function pour envoyer la notification
    // Vous devrez créer une Cloud Function Firebase pour cela
    
    // Ou envoyer directement une notification locale
    await sendLocalNotification(
      title: '✅ Formulation sauvegardée',
      body: '$animalType ($stage) - Coût: ${totalCost.toStringAsFixed(2)} FCFA',
    );
  }
}

// Gestionnaire de messages en arrière-plan (doit être une fonction top-level)
@pragma('vm:entry-point')
Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  print('Message reçu en arrière-plan: ${message.notification?.title}');
}
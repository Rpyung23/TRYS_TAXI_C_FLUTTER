import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'notifications_local.dart';

class PushNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token = "";

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("_backgroundHandler HANDLER ${message.messageId}");
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print("_onMessageHandler HANDLER ${message.messageId}");
    /*showNotifications(
        message.notification!.title!, message.notification!.body!);*/
  }

  static Future<void> _onOpenMessageOpenApp(RemoteMessage message) async {
    print("_onOpenMessageOpenApp HANDLER ${message.messageId}");
    /*showNotifications(
        message.notification!.title!, message.notification!.body!);*/
  }

  static Future initializeApp() async {
    // Push Notificarion
    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();
    print("TOKEN FIREBASE MESSAGIN");
    print(token);

    //Handlers

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
    // Local Notifications
  }
}

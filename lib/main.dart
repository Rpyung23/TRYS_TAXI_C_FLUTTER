import 'package:app/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'repositories/notifications_local.dart';
import 'repositories/push_notifications_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await PushNotificationServices.initializeApp();
  //await initNotificationsLocal();
  runApp(const MyApp());
}

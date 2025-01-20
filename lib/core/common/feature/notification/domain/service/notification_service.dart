import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../../../di/main_di.dart';
import '../../../../../service/navigation_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final notification = PushNotificationCubit.singleton();
  await notification.init();
  // Add termination state check
  await notification.showFlutterNotification(message, isBackground: true);
}

class PushNotificationCubit {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  String? _fcmToken;
  bool isFlutterLocalNotificationsInitialized = false;

  PushNotificationCubit._();

  static final PushNotificationCubit _instance = PushNotificationCubit._();

  factory PushNotificationCubit.singleton() {
    return _instance;
  }

  String? get fcm => _fcmToken;

  init() async {
    try {
      if (isFlutterLocalNotificationsInitialized) return;

      // Initialize local notifications first
      await _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('launch_background'),
          iOS: DarwinInitializationSettings(),
        ),
      );

      isFlutterLocalNotificationsInitialized = true;

      await FirebaseMessaging.instance.getToken().catchError((e) {
        log(e.toString(), name: "MSG");
      });

      await fcmInit();

      // Set up foreground message handler
      FirebaseMessaging.onMessage.listen(
        (message) => showFlutterNotification(
          message,
          isBackground: false,
        ),
      );

      // On Message Opened
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        locator<NavigationService>()
            .pushNamed("/${message.data["redirect_url"]}");
      });

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      log('Error initializing push notifications: $e', name: "MSG");
    }
  }

  String? threadUid;
  Future<void> showFlutterNotification(
    RemoteMessage message, {
    required bool isBackground,
  }) async {
    try {
      final RemoteNotification? notification = message.notification;
      if (notification != null && !kIsWeb) {
        await _flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(),
        );
        log("Notification displayed successfully", name: "MSG");
      }
    } catch (e) {
      log("Error showing notification: $e", name: "MSG");
    }
  }

  Future<void> fcmInit() async {
    await firebaseMessaging.requestPermission();
  }
}

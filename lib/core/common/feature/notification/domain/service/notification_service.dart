import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_service.dart';

class NotificationServices {
  LocalNotificationServices localNotificationServices;
  FirebaseMessaging messaging;

  NotificationServices({
    required this.localNotificationServices,
    required this.messaging,
  });

  Future<void> requestNotificationPermission() async {
    final NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {
      // AppSettings.openAppSettings();
    }
  }

  Future<void> firebaseInit() async {
    localNotificationServices.initializeNotifications();
    log("Firebase init");
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        localNotificationServices.simpleNotifications(
          message.notification!.title.toString(),
          message.notification!.body.toString(),
        );
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      log("onMessageOpenedApp data: ${event.data}");
    });
  }
}

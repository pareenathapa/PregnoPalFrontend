import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

class LocalNotificationServices {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotificationServices({required this.flutterLocalNotificationsPlugin});

  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  var iosInitializationSetting = const DarwinInitializationSettings();

  void initializeNotifications() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSetting,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        log("Notification Received: ${response.toString()}");
      },
    );
  }

  //Show Simple Notifications
  void simpleNotifications(String title, String body) {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'id',
      'Test',
      importance: Importance.max,
    );

    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Test",
      importance: Importance.max,
      priority: Priority.max,
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true,
      presentSound: true,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  //Show Big Icon on Side Of Notification
  void bigIconNotifications(String title, String body) {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "Big Icon_Notification",
      'Big Icon Notifications Channel',
      channelDescription: "This Channel is for Big Icon Notifications Only",
      importance: Importance.max,
      priority: Priority.max,
      largeIcon: DrawableResourceAndroidBitmap('drawable/notif'),
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch.remainder(20),
      title,
      body,
      notificationDetails,
    );
  }

  //Show Picture Notification
  void pictureNotifications(String title, String body) {
    const BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('notif'),
      largeIcon: DrawableResourceAndroidBitmap('notif'),
    );

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "Picture_Notification",
      "Picture Notification Channel",
      channelDescription: "This Channel is created for Picturee Notifications",
      styleInformation: bigPictureStyleInformation,
      priority: Priority.max,
      importance: Importance.max,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch.remainder(20),
      title,
      body,
      notificationDetails,
    );
  }

  //Show Payload Notifications
  void payloadNotifications(String title, String body) {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Payload_Notifications',
      'Payload Notification Channel',
      channelDescription: "This Channel is for Payload Notifications Only",
      importance: Importance.max,
      priority: Priority.max,
      styleInformation: BigPictureStyleInformation(
        DrawableResourceAndroidBitmap('notif'),
        largeIcon: DrawableResourceAndroidBitmap("notif"),
      ),
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch.remainder(20),
      title,
      body,
      notificationDetails,
      payload: "Payload Triggred By Hamza",
    );
  }

  //Show Zoned Schedule Notification
  void zonedScheduleNotifications(String title, String body) {
    const BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('notif'),
      largeIcon: DrawableResourceAndroidBitmap('notif'),
    );

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Zoned_notification',
      'Zoned Notification',
      importance: Importance.max,
      priority: Priority.max,
      channelDescription:
          "This Notification Channel is created for Zoned Notification",
      styleInformation: bigPictureStyleInformation,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    final DateTime schedule = DateTime.now().add(const Duration(seconds: 3));

    flutterLocalNotificationsPlugin.zonedSchedule(
      androidScheduleMode: AndroidScheduleMode.exact,
      DateTime.now().millisecondsSinceEpoch.remainder(20),
      title,
      body,
      TZDateTime.from(schedule, local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  print('got a message whilst in the background!');
  print('message data: $message');
}

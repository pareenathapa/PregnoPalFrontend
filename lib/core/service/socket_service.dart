import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../config/constants/api/api_endpoints_constants.dart';
import '../common/feature/notification/domain/service/local_notification_service.dart';
import '../common/feature/notification/domain/service/notification_service.dart';

class SocketService {
  late IO.Socket socket;

  void initializeSocket() {
    // Local notification initialization
    final LocalNotificationServices localNotificationServices =
        LocalNotificationServices(
      flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
    );
    final NotificationServices notificationServices = NotificationServices(
      localNotificationServices: localNotificationServices,
      messaging: FirebaseMessaging.instance,
    );
    socket = IO.io(
      ApiEndpoints.socketURL,
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    socket.onConnect((_) {
      log('Connected to the server');
    });

    socket.on('new-appointment', (data) {
      localNotificationServices.simpleNotifications(
        'New Appointment',
        data['message'],
      );
    });

    socket.on('appointment-updated', (data) {
      log(data.toString());
      localNotificationServices.simpleNotifications(
        'Appointment Updated',
        data['title'],
      );
    });

    socket.onDisconnect((_) => log('Disconnected from server'));
    socket.onError((error) => log('Error: $error'));
  }

  void dispose() {
    socket.disconnect();
  }
}

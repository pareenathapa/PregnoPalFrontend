import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../config/constants/api/api_endpoints_constants.dart';
import '../../di/main_di.dart';
import '../../features/authentication/data/models/user_model.dart';
import '../../features/profile/presentation/cubit/profile_detail_cubit.dart';
import '../common/feature/notification/domain/service/local_notification_service.dart';
import '../common/feature/notification/domain/service/notification_service.dart';

class SocketService {
  late IO.Socket socket;
  final UserModel loggedUser;

  SocketService({
    required this.loggedUser,
  });

  void initializeSocket() async {
    //  locla notification service
    final localNotificationServices = locator<LocalNotificationServices>();
    localNotificationServices.initializeNotifications();

    // Local notification initialization
    final a = PushNotificationCubit.singleton();
    await a.init();
    socket = IO.io(
      ApiEndpoints.socketURL,
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    socket.onConnect((_) {
      log('Connected to the server');
    });

    socket.on('appointment-created', (data) {
      if (loggedUser.id == data['to']) {
        localNotificationServices.simpleNotifications(
          'New Appointment',
          'You have a new appointment',
        );
      }
    });
    socket.on('appointment-rejected', (data) {
      if (loggedUser.id == data['to']) {
        localNotificationServices.simpleNotifications(
          'Appointment Rejected',
          data['appointment']['title'],
        );
      }
    });

    socket.on('appointment-updated', (data) {
      if (loggedUser!.id == data['to']) {
        localNotificationServices.simpleNotifications(
          'Appointment Updated',
          data['appointment']['title'],
        );
      }
    });

    socket.on('appointment-accepted', (data) {
      if (loggedUser!.id == data['to']) {
        log('Appointment Accepted $data');
        localNotificationServices.simpleNotifications(
          'Appointment Accepted',
          "Your appointment has been accepted",
        );
      }
    });

    socket.onDisconnect((_) => log('Disconnected from server'));
    socket.onError((error) => log('Error: $error'));
  }

  void dispose() {
    socket.disconnect();
  }
}

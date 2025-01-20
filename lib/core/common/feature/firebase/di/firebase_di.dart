import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../../di/main_di.dart';
import '../../../../utils/token_storage.dart';
import '../../notification/domain/service/local_notification_service.dart';
import '../../notification/domain/service/notification_service.dart';
import '../domain/usecase/get_device_token_usecase.dart';

class FirebaseDI {
  void register() {
    // Services
    locator.registerSingleton<FlutterLocalNotificationsPlugin>(
      FlutterLocalNotificationsPlugin(),
    );
    locator.registerSingleton<LocalNotificationServices>(
      LocalNotificationServices(
        flutterLocalNotificationsPlugin:
            locator<FlutterLocalNotificationsPlugin>(),
      ),
    );

    // Usecase
    locator.registerSingleton<GetDeviceTokenUsecase>(
      GetDeviceTokenUsecase(
        tokenStorage: locator<TokenStorage>(),
      ),
    );
  }
}

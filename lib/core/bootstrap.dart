//  Initializer
import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../di/main_di.dart';
import '../firebase_options.dart';
import '../generated/assets.gen.dart';
import 'bloc/bloc_observer.dart';
import 'common/feature/notification/domain/service/local_notification_service.dart';
import 'common/feature/notification/domain/service/notification_service.dart';
import 'service/socket_service.dart';
import 'utils/extensions/svg_extension.dart';

/// Initializes the main dependencies and configurations required to run the app.
///
/// The `bootstrap` function is responsible for setting up the essential components
/// of the application, including initializing bindings, configuring services,
/// and handling uncaught errors. It ensures that the app starts with all required
/// settings in place, such as dependency injection, Hive database, Amplify configuration,
/// and Bloc observers.
///
/// The function also sets up error handling within a `runZonedGuarded` environment
/// to capture and log errors that occur outside of the standard Flutter error handling.
///
/// ### Key Functionalities:
/// - Initializes Flutter bindings to ensure widgets and plugins are ready.
/// - Sets up the Bloc observer for monitoring Bloc events and transitions.
/// - Initializes the Hive database for local storage.
/// - Configures Amplify for backend services such as authentication and data storage.
/// - Registers main dependencies using a dependency injection container.
/// - Handles uncaught errors by logging them to the console with a stack trace.
///
/// ### Usage:
/// Call this function at the entry point of the application, passing the desired
/// `AppFlavor` to configure the app environment (development, staging, or production).
///
/// ```dart
/// Future<void> main() async {
///   await bootstrap(appFlavor: AppFlavor.development());
/// }
/// ```
///
/// ### Parameters:
/// - [appFlavor]: An instance of [AppFlavor] to determine which environment-specific
///   configurations should be loaded. This can be development, staging, or production.
///
/// ### Error Handling:
/// Errors occurring during the initialization process are caught and logged using
/// `runZonedGuarded`, ensuring that the app remains stable and that initialization errors
/// are reported appropriately.
///
/// ### Example:
/// ```dart
/// bootstrap(appFlavor: AppFlavor.production());
/// ```
///
/// ### Dependencies:
/// - HiveService: Handles initialization of local storage.
/// - AmplifyService: Configures Amplify for app services.
/// - MainDI: Handles dependency injection setup.
///
/// ```dart
FutureOr<void> bootstrap({
  required FutureOr<Widget> Function() builder,
}) async {
  await runZonedGuarded(() async {
    BindingBase.debugZoneErrorsAreFatal = true;
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await dotenv.load(
      fileName: Assets.local,
    );
    // Main Bloc observer initialization
    // ! Comment this line to disable bloc observer
    Bloc.observer = AppBlocObserver();
    // Amplify initialization
    // Firebase initialization
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Local notification initialization
    final LocalNotificationServices localNotificationServices =
        LocalNotificationServices(
      flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
    );
    final NotificationServices notificationServices = NotificationServices(
      localNotificationServices: localNotificationServices,
      messaging: FirebaseMessaging.instance,
    );

    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();

    SocketService().initializeSocket();

    // Main app dependency injection container initialization
    MainDI().register();

    // Run the app
    final app = await builder();
    runApp(app);
  }, (error, stackTrace) {
    log(error.toString(), stackTrace: stackTrace, name: "BOOTSTRAP");
  });
}

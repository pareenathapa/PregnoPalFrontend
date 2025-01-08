import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../failure/error_handler.dart';
import '../../../../../usecase/usecase.dart';
import '../../../../../utils/token_storage.dart';
import '../../../../models/token_model.dart';

class GetDeviceTokenUsecase extends UseCase<String?, void> {
  final TokenStorage _tokenStorage;

  GetDeviceTokenUsecase({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  @override
  FutureOr<Either<AppErrorHandler, String?>> call(void params) async {
    late String? deviceToken;

    if (Platform.isIOS) {
      deviceToken = await FirebaseMessaging.instance.getAPNSToken();
      log('APNS token: $deviceToken');
    } else {
      deviceToken = await FirebaseMessaging.instance.getToken();
      log('FCM token: $deviceToken');
    }

    log('Device token: $deviceToken');

    if (deviceToken != null) {
      await _tokenStorage.setToken(
        TokenModel(
          deviceToken: deviceToken,
        ),
      );
      return Right(deviceToken);
    }

    return const Right(null);
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../di/main_di.dart';
import '../../utils/token_storage.dart';

class AuthenticationInterceptor extends Interceptor {
  const AuthenticationInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await locator<TokenStorage>().accessToken;
    log('Token: $token');
    if (token != null) {
      options.headers.addAll({"Authorization": "Bearer $token"});
    } else {
      super.onRequest(options, handler);
      return;
    }

    super.onRequest(options, handler);
  }
}

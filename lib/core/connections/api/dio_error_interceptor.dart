import 'dart:developer';

import "package:dio/dio.dart";
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage;
    DioExceptionType errorType;

    if (err.response != null) {
      log("The Response is not null ::${err.response}");
      if (err.response!.statusCode! >= 400) {
        errorMessage = LocaleKeys.commonErrors_serverError.tr();
        errorType = DioExceptionType.badResponse;
      } else if (err.response!.statusCode! >= 200 &&
          err.response!.statusCode! < 400) {
        log("Something went wrong despite receiving status: ${err.response!.statusCode}");
        errorMessage = LocaleKeys.commonErrors_somethingWentWrong.tr();
        errorType = DioExceptionType.badResponse;
      } else {
        errorMessage = LocaleKeys.commonErrors_somethingWentWrong.tr();
        errorType = DioExceptionType.badResponse;
      }
    } else {
      log("The Response is null ::${err.response}");
      errorMessage = LocaleKeys.commonErrors_noInternetConnection.tr();
      errorType = DioExceptionType.connectionError;
    }

    debugPrint('DioErrorInterceptor: $errorMessage');
    super.onError(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: errorMessage,
        type: errorType,
      ),
      handler,
    );
  }
}

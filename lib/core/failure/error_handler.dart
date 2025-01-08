import 'dart:developer';

import "package:dio/dio.dart";
import 'package:freezed_annotation/freezed_annotation.dart';

// ! DO NOT MODIFY THIS FILE
part 'error_handler.freezed.dart';
part 'error_handler.g.dart';

@freezed
class AppErrorHandler with _$AppErrorHandler {
  const factory AppErrorHandler({
    required String message,
    String? code,
    String? data,
  }) = _AppErrorHandler;

  factory AppErrorHandler.fromDioException(DioException e) {
    try {
      throw "";
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
    }
    return AppErrorHandler(
      message: e.response?.data['message'] ?? e.message,
      code: e.response?.data['httpCode'].toString(),
      data: e.response?.data.toString(),
    );
  }

  factory AppErrorHandler.fromException(dynamic e) {
    try {
      throw "";
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
    }
    return AppErrorHandler(
      message: e.toString(),
    );
  }

  factory AppErrorHandler.fromJson(Map<String, dynamic> json) =>
      _$AppErrorHandlerFromJson(json);
}

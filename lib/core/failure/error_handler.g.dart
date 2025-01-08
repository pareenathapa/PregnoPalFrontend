// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_handler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppErrorHandlerImpl _$$AppErrorHandlerImplFromJson(
        Map<String, dynamic> json) =>
    _$AppErrorHandlerImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$AppErrorHandlerImplToJson(
        _$AppErrorHandlerImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationModelImpl _$$PaginationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginationModelImpl(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      nextToken: json['nextToken'] as String?,
      previousToken: json['previousToken'] as String?,
      filter: json['filter'] as String?,
      hasNext: json['hasNext'] as bool?,
    );

Map<String, dynamic> _$$PaginationModelImplToJson(
        _$PaginationModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'offset': instance.offset,
      'nextToken': instance.nextToken,
      'previousToken': instance.previousToken,
      'filter': instance.filter,
      'hasNext': instance.hasNext,
    };

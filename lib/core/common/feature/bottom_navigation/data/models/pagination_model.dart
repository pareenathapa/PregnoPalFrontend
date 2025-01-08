import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    int? page,
    int? limit,
    int? offset,
    String? nextToken,
    String? previousToken,
    String? filter,
    bool? hasNext,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

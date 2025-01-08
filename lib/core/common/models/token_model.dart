import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    @JsonKey(name: "access_token") String? accessToken,
    @JsonKey(name: "refresh_token") String? refreshToken,
    @JsonKey(name: "device_token") String? deviceToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic>? json) =>
      _$TokenModelFromJson(json ?? {});
}

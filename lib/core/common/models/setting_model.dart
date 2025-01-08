import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
class SettingModel with _$SettingModel {
  const factory SettingModel({
    @JsonKey(name: "has_opened") bool? hasOpened,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, dynamic>? json) =>
      _$SettingModelFromJson(json ?? {});
}

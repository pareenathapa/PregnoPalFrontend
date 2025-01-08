part of 'profile_detail_cubit.dart';

@freezed
class ProfileDetailState with _$ProfileDetailState {
  const ProfileDetailState._();

  const factory ProfileDetailState({
    UserModel? userData,
    ProfileModel? profileData,
    AppErrorHandler? error,
    @Default(false) bool loginCheckSuccess,
    @Default(false) bool isLoading,
    @Default(false) bool canUpdate,
    @Default(false) bool addChildSuccess,
    @Default([]) List<File> images,
  }) = _ProfileDetailState;

  // Initial state
  factory ProfileDetailState.initial() => const ProfileDetailState();
}

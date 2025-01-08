import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/loaders/dialog_loader.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/helper/image_picker_helper.dart';
import '../../../../core/utils/token_storage.dart';
import '../../../../di/main_di.dart';
import '../../../authentication/data/models/user_model.dart';
import '../../data/model/profile_model.dart';
import '../../domain/usecase/add_child_usecase.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import '../../domain/usecase/update_user_profile.dart';

part 'profile_detail_state.dart';
part 'profile_detail_cubit.freezed.dart';

class ProfileDetailCubit extends Cubit<ProfileDetailState> {
  final TokenStorage _tokenStorage;
  final GetProfileDetailUseCase _getProfileDetailUseCase;
  final ImagePickerHelper _imagePickerHelper;
  final UpdateUserProfile _updateUserProfile;
  final AddChildUsecase _addChildUsecase;
  ProfileDetailCubit({
    required TokenStorage tokenStorage,
    required GetProfileDetailUseCase getProfileDetailUseCase,
    required ImagePickerHelper imagePickerHelper,
    required UpdateUserProfile updateUserProfile,
    required AddChildUsecase addChildUsecase,
  })  : _getProfileDetailUseCase = getProfileDetailUseCase,
        _tokenStorage = tokenStorage,
        _imagePickerHelper = imagePickerHelper,
        _updateUserProfile = updateUserProfile,
        _addChildUsecase = addChildUsecase,
        super(ProfileDetailState.initial());

  Future<void> getProfileDetail() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getProfileDetailUseCase.call(null);
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isLoading: false,
            error: error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            profileData: data,
            userData: data.user,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> onCheckLoginStatus() async {
    final String? token = await _tokenStorage.accessToken;
    if (token == null) {
      emit(
        state.copyWith(
          loginCheckSuccess: false,
          error: const AppErrorHandler(
            message: "Please Re-Login",
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          loginCheckSuccess: true,
          error: null,
          isLoading: false,
        ),
      );
      getProfileDetail();
    }
  }

  Future<void> selectProfilePicture() async {
    final file = await _imagePickerHelper.openImagePicker(
      ImageSource.gallery,
    );

    if (file != null) {
      emit(
        state.copyWith(
          images: [file],
        ),
      );
    }
  }

  Future<void> removeProfilePicture() async {
    emit(
      state.copyWith(
        images: [],
      ),
    );
  }

  void canUpdate({
    required String name,
    required String email,
  }) {
    if (state.userData!.name == name &&
        state.userData!.email == email &&
        state.images.isEmpty) {
      emit(
        state.copyWith(
          error: null,
          canUpdate: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          error: null,
          canUpdate: true,
        ),
      );
    }
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
  }) async {
    locator<DialogLoader>().show();
    emit(state.copyWith(isLoading: true));
    log("file: ${state.images.isNotEmpty ? state.images.first.path : null}");
    final result = await _updateUserProfile.call(
      UpdateUserProfileParams(
        name: name,
        email: email,
        image: state.images.isNotEmpty ? state.images.first : null,
      ),
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isLoading: false,
            error: error,
          ),
        );
      },
      (data) {
        getProfileDetail();
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            // profileData: data,
            images: [],
          ),
        );
      },
    );
    locator<DialogLoader>().hide();
  }

  Future<void> addChild({
    required String name,
    required String dateOfBirth,
    required String sex,
    required double height,
    required double weight,
  }) async {
    locator<DialogLoader>().show();
    emit(state.copyWith(isLoading: true));
    final result = await _addChildUsecase.call(
      AddChildParams(
        name: name,
        dateOfBirth: dateOfBirth,
        height: height,
        sex: sex,
        weight: weight,
      ),
    );
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isLoading: false,
            error: error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            addChildSuccess: true,
          ),
        );
      },
    );
    locator<DialogLoader>().hide();
  }
}

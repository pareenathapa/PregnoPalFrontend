import '../../../core/connections/api/dio_service.dart';
import '../../../core/helper/image_picker_helper.dart';
import '../../../core/utils/token_storage.dart';
import '../../../di/main_di.dart';
import '../data/data_source/remote/profile_remote_data_source.dart';
import '../data/repository/profile_repository_impl.dart';
import '../domain/repository/profile_repository.dart';
import '../domain/usecase/add_child_usecase.dart';
import '../domain/usecase/get_profile_usecase.dart';
import '../domain/usecase/update_user_profile.dart';
import '../presentation/cubit/profile_detail_cubit.dart';

class ProfileDI {
  void register() {
    // Data Source
    locator.registerLazySingleton(
      () => ProfileRemoteDataSource(
        dioService: locator<DioService>(),
      ),
    );

    // Repository
    locator.registerLazySingleton<IProfileRepository>(
      () => ProfileRepositoryImpl(
        remoteDataSource: locator<ProfileRemoteDataSource>(),
      ),
    );

    // Use Case
    locator.registerLazySingleton(
      () => GetProfileDetailUseCase(
        repository: locator<IProfileRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => UpdateUserProfile(
        locator<IProfileRepository>(),
      ),
    );
    locator.registerLazySingleton(
      () => AddChildUsecase(
        locator<IProfileRepository>(),
      ),
    );

    // Bloc
    locator.registerFactory(
      () => ProfileDetailCubit(
        addChildUsecase: locator<AddChildUsecase>(),
        updateUserProfile: locator<UpdateUserProfile>(),
        tokenStorage: locator<TokenStorage>(),
        getProfileDetailUseCase: locator<GetProfileDetailUseCase>(),
        imagePickerHelper: locator<ImagePickerHelper>(),
      ),
    );
  }
}

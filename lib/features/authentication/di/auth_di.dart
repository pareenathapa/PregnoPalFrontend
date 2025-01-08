import '../../../di/main_di.dart';
import '../data/data_source/remote/auth_remote_data_source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../presentation/cubit/authentication_cubit.dart';

class AuthDi {
  void register() {
    // data source
    locator.registerLazySingleton(() => AuthRemoteDataSource(api: locator()));
    // Repository
    locator.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: locator(),
        tokenStorage: locator(),
      ),
    );

    // Usecase
    locator.registerLazySingleton(() => RegisterUsecase(repository: locator()));
    locator.registerLazySingleton(() => LoginUsecase(repository: locator()));

    // Cubit
    locator.registerFactory(
      () => AuthenticationCubit(
        registerUsecase: locator(),
        loginUsecase: locator(),
        getDeviceTokenUsecase: locator(),
      ),
    );
  }
}

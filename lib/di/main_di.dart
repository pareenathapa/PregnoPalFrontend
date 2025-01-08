import 'package:get_it/get_it.dart';
import 'package:secure_storage/secure_storage.dart';

import '../config/routes/app_route_oserver.dart';
import '../config/routes/routes.dart';
import '../core/bloc/timer/timer_bloc.dart';
import '../core/cache/asset_png_cache_service.dart';
import '../core/common/feature/firebase/di/firebase_di.dart';
import '../core/common/loaders/dialog_loader.dart';
import '../core/connections/api/dio_service.dart';
import '../core/helper/date_time_helper.dart';
import '../core/helper/file_picker_helper.dart';
import '../core/helper/file_upload_helper.dart';
import '../core/helper/image_picker_helper.dart';
import '../core/helper/url_launcher_helper.dart';
import '../core/service/navigation_service.dart';
import '../core/utils/app_ticker.dart';
import '../core/utils/auth_guard.dart';
import '../core/utils/setting_storage.dart';
import '../core/utils/token_storage.dart';
import '../features/appointment/di/appointment_di.dart';
import '../features/appointment/presentation/cubit/appointment_cubit.dart';
import '../features/articles/di/article_di.dart';
import '../features/authentication/di/auth_di.dart';
import '../features/profile/di/profile_di.dart';

final locator = GetIt.instance;

class MainDI {
  void register() {
    // Services
    locator.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );
    locator.registerLazySingleton(
      () => NavigationService(
        locator<AppRouter>(),
      ),
    );
    locator.registerLazySingleton(
      () => DioService(),
    );

    locator.registerLazySingleton(
      () => AuthGuard(),
    );
    locator.registerLazySingleton<SecureStorage>(
      () => const SecureStorage(),
    );
    locator.registerLazySingleton(
      () => TokenStorage(
        secureStorage: locator<SecureStorage>(),
      ),
    );
    locator.registerLazySingleton(
      () => SettingStorage(
        secureStorage: locator<SecureStorage>(),
      ),
    );
    locator.registerLazySingleton(
      () => DialogLoader(),
    );

    // Blocs
    locator.registerFactory<TimerBloc>(
      () => TimerBloc(
        ticker: locator<AppTicker>(),
      ),
    );

    // Utilities
    locator.registerLazySingleton<AppTicker>(
      () => const AppTicker(),
    );
    locator.registerFactory<AppRouteObserver>(
      () => AppRouteObserver(),
    );

    // Helpers
    locator.registerLazySingleton<ImagePickerHelper>(
      () => ImagePickerHelper(),
    );
    locator.registerLazySingleton<FilePickerHelper>(
      () => FilePickerHelper(),
    );
    locator.registerLazySingleton<DateTimeHelper>(
      () => DateTimeHelper(),
    );
    locator.registerLazySingleton<UrlLauncherHelper>(
      () => UrlLauncherHelper(),
    );
    locator.registerLazySingleton<FileUploadHelper>(
      () => FileUploadHelper(),
    );
    locator.registerLazySingleton<AssetPngCacheService>(
      () => AssetPngCacheService(),
    );

    // Feature Containers
    FirebaseDI().register();
    AuthDi().register();
    ProfileDI().register();
    ArticleDI().register();
    AppointmentDI().register();
  }
}

import '../../../core/connections/api/dio_service.dart';
import '../../../di/main_di.dart';
import '../data/data_source/remote/appointment_remote_data_source.dart';
import '../data/repository/appointment_repository_impl.dart';
import '../domain/usecase/add_appointment_usecase.dart';
import '../domain/usecase/delete_appointment_usecase.dart';
import '../domain/usecase/get_all_appointment_usecase.dart';
import '../domain/usecase/get_dates_appointment_usecase.dart';
import '../domain/usecase/get_single_appointment_usecase.dart';
import '../domain/usecase/update_appointment_usecase.dart';
import '../presentation/cubit/appointment_cubit.dart';

class AppointmentDI {
  void register() {
    // Datastore
    locator.registerLazySingleton<AppointmentRemoteDataSource>(
      () => AppointmentRemoteDataSource(
        locator<DioService>(),
      ),
    );

    // Repository
    locator.registerFactory<AppointmentRepositoryImpl>(
      () => AppointmentRepositoryImpl(
        remoteDataSource: locator<AppointmentRemoteDataSource>(),
      ),
    );

    // Usecase
    locator.registerFactory<GetAllAppointmentUsecase>(
      () => GetAllAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );
    locator.registerFactory<GetSingleAppointmentUsecase>(
      () => GetSingleAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );
    locator.registerFactory<DeleteAppointmentUsecase>(
      () => DeleteAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );
    locator.registerFactory<AddAppointmentUsecase>(
      () => AddAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );
    locator.registerFactory<UpdateAppointmentUsecase>(
      () => UpdateAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );
    locator.registerFactory<GetDatesAppointmentUsecase>(
      () => GetDatesAppointmentUsecase(
        repository: locator<AppointmentRepositoryImpl>(),
      ),
    );

    // Bloc
    locator.registerFactory<AppointmentCubit>(
      () => AppointmentCubit(
        getAllAppointmentUsecase: locator<GetAllAppointmentUsecase>(),
        getSingleAppointmentUsecase: locator<GetSingleAppointmentUsecase>(),
        updateAppointmentUsecase: locator<UpdateAppointmentUsecase>(),
        deleteAppointmentUsecase: locator<DeleteAppointmentUsecase>(),
        getDatesAppointmentUsecase: locator<GetDatesAppointmentUsecase>(),
        addAppointmentUsecase: locator<AddAppointmentUsecase>(),
      ),
    );
  }
}

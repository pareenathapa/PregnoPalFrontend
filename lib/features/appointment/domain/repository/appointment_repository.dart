import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';

abstract class IAppointmentRepository {
  Future<Either<AppErrorHandler, List<Map<String, dynamic>>>>
      getAllAppointments({
    String? status,
  });

  Future<Either<AppErrorHandler, dynamic>> getSingleAppointment({
    required String id,
  });

  Future<Either<AppErrorHandler, dynamic>> createAppointment({
    required String description,
    required String title,
    required String doctorId,
    required String childId,
    required DateTime date,
    required DateTime time,
    required String mode,
    String? meetingLink,
  });

  Future<Either<AppErrorHandler, dynamic>> updateAppointment({
    String? meetingLink,
    String? mode,
    String? title,
    String? description,
    String? doctorId,
    String? childId,
    DateTime? date,
    DateTime? time,
    required String id,
  });

  Future<Either<AppErrorHandler, dynamic>> deleteAppointment({
    required String id,
  });

  Future<Either<AppErrorHandler, dynamic>> getAppointmentDatesAndTimes();
}

import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';

abstract class IAppointmentRepository {
  Future<Either<AppErrorHandler, dynamic>> getAllAppointments();

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
    required String id,
    required String parentId,
    required String doctorId,
    required String childId,
    required DateTime appointmentDate,
    required String mode,
    String? meetingLink,
  });

  Future<Either<AppErrorHandler, dynamic>> deleteAppointment({
    required String id,
  });

  Future<Either<AppErrorHandler, dynamic>> getAppointmentDatesAndTimes();
}

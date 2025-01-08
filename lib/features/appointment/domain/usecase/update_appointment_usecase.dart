import '../../../../core/failure/error_handler.dart';
import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/appointment_repository.dart';

class UpdateAppointmentUsecase
    extends UseCase<dynamic, UpdateAppointmentParams> {
  final IAppointmentRepository repository;

  UpdateAppointmentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, dynamic>> call(
    UpdateAppointmentParams params,
  ) async {
    return await repository.updateAppointment(
      id: params.id,
      parentId: params.parentId,
      doctorId: params.doctorId,
      childId: params.childId,
      appointmentDate: params.appointmentDate,
      mode: params.mode,
      meetingLink: params.meetingLink,
    );
  }
}

class UpdateAppointmentParams {
  final String id;
  final String parentId;
  final String doctorId;
  final String childId;
  final DateTime appointmentDate;
  final String mode;
  final String? meetingLink;

  UpdateAppointmentParams({
    required this.id,
    required this.parentId,
    required this.doctorId,
    required this.childId,
    required this.appointmentDate,
    required this.mode,
    this.meetingLink,
  });
}

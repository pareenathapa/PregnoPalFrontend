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
      description: params.description,
      doctorId: params.doctorId,
      childId: params.childId,
      mode: params.mode,
      meetingLink: params.meetingLink,
      date: params.date,
      time: params.time,
      title: params.title,
    );
  }
}

class UpdateAppointmentParams {
  final String id;
  final String? description;
  final String? doctorId;
  final String? childId;
  final DateTime? date;
  final String? mode;
  final String? meetingLink;
  final String? title;
  final DateTime? time;

  UpdateAppointmentParams({
    required this.id,
    this.doctorId,
    this.childId,
    this.mode,
    this.meetingLink,
    this.date,
    this.time,
    this.title,
    this.description,
  });
}

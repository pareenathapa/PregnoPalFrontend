import '../../../../core/failure/error_handler.dart';
import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/appointment_repository.dart';

class AddAppointmentUsecase extends UseCase<dynamic, AddAppointmentParams> {
  final IAppointmentRepository repository;

  AddAppointmentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, dynamic>> call(
    AddAppointmentParams params,
  ) async {
    return await repository.createAppointment(
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

class AddAppointmentParams {
  final String description;
  final String doctorId;
  final String childId;
  final DateTime date;
  final String mode;
  final String? meetingLink;
  final String title;
  final DateTime time;

  AddAppointmentParams({
    required this.description,
    required this.doctorId,
    required this.childId,
    required this.date,
    required this.time,
    required this.title,
    required this.mode,
    this.meetingLink,
  });
}

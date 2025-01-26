import '../../../../core/failure/error_handler.dart';
import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/appointment_repository.dart';

class GetAllAppointmentUsecase
    extends UseCase<List<Map<String, dynamic>>, AppointmentFilterParams> {
  final IAppointmentRepository repository;

  GetAllAppointmentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<Map<String, dynamic>>>> call(
      AppointmentFilterParams params) async {
    return await repository.getAllAppointments(
      status: params.status,
      doctorId: params.doctorId,
      childId: params.childId,
      sort: params.sort,
    );
  }
}

class AppointmentFilterParams {
  final String? status;
  final String? doctorId;
  final String? childId;
  final String? sort;

  AppointmentFilterParams({
    this.status,
    this.doctorId,
    this.childId,
    this.sort,
  });
}

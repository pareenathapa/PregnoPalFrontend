import '../../../../core/failure/error_handler.dart';
import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/appointment_repository.dart';

class GetAllAppointmentUsecase extends UseCase<dynamic, void> {
  final IAppointmentRepository repository;

  GetAllAppointmentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, dynamic>> call(void params) async {
    return await repository.getAllAppointments();
  }
}

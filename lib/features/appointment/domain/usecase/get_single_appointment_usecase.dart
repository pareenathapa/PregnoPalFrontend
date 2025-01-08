import '../../../../core/failure/error_handler.dart';
import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/appointment_repository.dart';

class GetSingleAppointmentUsecase extends UseCase<dynamic, String> {
  final IAppointmentRepository repository;

  GetSingleAppointmentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, dynamic>> call(String params) async {
    return await repository.getSingleAppointment(
      id: params,
    );
  }
}

import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';

import '../../domain/repository/appointment_repository.dart';
import '../data_source/remote/appointment_remote_data_source.dart';

class AppointmentRepositoryImpl implements IAppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, dynamic>> createAppointment({
    required String description,
    required String title,
    required String doctorId,
    required String childId,
    required DateTime date,
    required DateTime time,
    required String mode,
    String? meetingLink,
  }) {
    return remoteDataSource.createAppointment(
      description: description,
      doctorId: doctorId,
      childId: childId,
      date: date,
      time: time,
      title: title,
      mode: mode,
      meetingLink: meetingLink,
    );
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> deleteAppointment(
      {required String id}) {
    return remoteDataSource.deleteAppointment(id: id);
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> getAllAppointments() {
    return remoteDataSource.getAllAppointments();
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> getAppointmentDatesAndTimes() {
    return remoteDataSource.getAppointmentDatesAndTimes();
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> getSingleAppointment(
      {required String id}) {
    return remoteDataSource.getSingleAppointment(id: id);
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> updateAppointment(
      {required String id,
      required String parentId,
      required String doctorId,
      required String childId,
      required DateTime appointmentDate,
      required String mode,
      String? meetingLink}) {
    return remoteDataSource.updateAppointment(
      id: id,
      parentId: parentId,
      doctorId: doctorId,
      childId: childId,
      appointmentDate: appointmentDate,
      mode: mode,
      meetingLink: meetingLink,
    );
  }
}

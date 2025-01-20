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
  Future<Either<AppErrorHandler, List<Map<String, dynamic>>>>
      getAllAppointments({
    String? status,
  }) {
    return remoteDataSource.getAllAppointments(
      status: status,
    );
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
  Future<Either<AppErrorHandler, dynamic>> updateAppointment({
    required String id,
    String? meetingLink,
    String? mode,
    String? title,
    String? description,
    String? doctorId,
    String? childId,
    DateTime? date,
    DateTime? time,
  }) {
    return remoteDataSource.updateAppointment(
      id: id,
      meetingLink: meetingLink,
      mode: mode,
      title: title,
      description: description,
      doctorId: doctorId,
      childId: childId,
      date: date,
      time: time,
      
    );
  }
}

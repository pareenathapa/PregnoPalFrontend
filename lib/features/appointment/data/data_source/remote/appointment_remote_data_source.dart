import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../../core/connections/api/dio_service.dart';
import '../../../../../core/failure/error_handler.dart';

class AppointmentRemoteDataSource {
  final DioService api;

  AppointmentRemoteDataSource(this.api);

  Future<Either<AppErrorHandler, dynamic>> getAllAppointments() async {
    try {
      final response = await api.dio.get(
        ApiEndpoints.appointmentsURL,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> getSingleAppointment({
    required String id,
  }) async {
    try {
      final response = await api.dio.get(
        '${ApiEndpoints.appointmentsURL}/$id',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> createAppointment({
    required String description,
    required String title,
    required String doctorId,
    required String childId,
    required DateTime date,
    required DateTime time,
    required String mode,
    String? meetingLink,
  }) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.appointmentsURL,
        data: {
          'title': title,
          'doctor_id': doctorId,
          'child_id': childId,
          'appointment_date': date,
          'appointment_time': time,
          'mode': mode,
          'meeting_link': meetingLink,
          "description": description,
        },
      );
      return Right(response.data);
    } catch (e) {
      log('DioException: $e');
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> updateAppointment({
    required String id,
    required String parentId,
    required String doctorId,
    required String childId,
    required DateTime appointmentDate,
    required String mode,
    String? meetingLink,
  }) async {
    try {
      final response = await api.dio.put(
        '${ApiEndpoints.appointmentsURL}/$id',
        data: {
          'parent_id': parentId,
          'doctor_id': doctorId,
          'child_id': childId,
          'appointment_date': appointmentDate,
          'mode': mode,
          'meeting_link': meetingLink,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> deleteAppointment({
    required String id,
  }) async {
    try {
      final response = await api.dio.delete(
        '${ApiEndpoints.appointmentsURL}/$id',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> getAppointmentDatesAndTimes() async {
    try {
      final response = await api.dio.get(
        '${ApiEndpoints.appointmentsURL}/dates-and-times',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }
}

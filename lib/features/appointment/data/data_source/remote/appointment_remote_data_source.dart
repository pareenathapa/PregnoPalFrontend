import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../../core/connections/api/dio_service.dart';
import '../../../../../core/failure/error_handler.dart';

class AppointmentRemoteDataSource {
  final DioService api;

  AppointmentRemoteDataSource(this.api);

  Future<Either<AppErrorHandler, List<Map<String, dynamic>>>>
      getAllAppointments({
    String? status,
  }) async {
    try {
      final response = await api.dio.get(
        ApiEndpoints.appointmentsURL,
        queryParameters: {
          'status': status,
        },
      );
      if (response.statusCode == 200 || response.data != null) {
        return Right(response.data
            .map<Map<String, dynamic>>(
              (item) => item as Map<String, dynamic>,
            )
            .toList());
      } else {
        return Left(AppErrorHandler(message: "Error fetching appointments"));
      }
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
          'appointment_date': date.toString(),
          'time': time.toString(),
          'mode': mode,
          'meeting_link': meetingLink,
          'description': description,
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> updateAppointment({
    required String id,
    String? description,
    String? title,
    String? doctorId,
    String? childId,
    DateTime? date,
    DateTime? time,
    String? mode,
    String? meetingLink,
  }) async {
    try {
      final response = await api.dio.put(
        '${ApiEndpoints.appointmentsURL}/$id',
        data: {
          if (title != null && title.isNotEmpty) 'title': title,
          if (doctorId != null && doctorId.isNotEmpty) 'doctor_id': doctorId,
          if (childId != null && childId.isNotEmpty) 'child_id': childId,
          if (date != null) 'appointment_date': date.toString(),
          if (time != null) 'time': time.toString(),
          if (mode != null && mode.isNotEmpty) 'mode': mode,
          if (meetingLink != null && meetingLink.isNotEmpty)
            'meeting_link': meetingLink,
          if (description != null && description.isNotEmpty)
            'description': description,
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

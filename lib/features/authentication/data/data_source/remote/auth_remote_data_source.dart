import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../../core/connections/api/dio_service.dart';
import '../../../../../core/failure/error_handler.dart';
import '../../models/user_model.dart';

class AuthRemoteDataSource {
  final DioService api;

  AuthRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.registerURL,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.dio.post(
        ApiEndpoints.loginURL,
        data: {
          'email': email,
          'password': password,
        },
      );
      return Right(UserModel.fromMap(response.data['user']));
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }
}

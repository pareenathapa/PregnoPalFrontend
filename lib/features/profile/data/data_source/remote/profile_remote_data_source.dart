import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../../core/connections/api/dio_service.dart';
import '../../../../../core/failure/error_handler.dart';
import '../../model/profile_model.dart';

class ProfileRemoteDataSource {
  final DioService _dioService;

  ProfileRemoteDataSource({
    required DioService dioService,
  }) : _dioService = dioService;

  Future<Either<AppErrorHandler, ProfileModel>> fetchProfileDetail() async {
    try {
      final response = await _dioService.dio.get(
        ApiEndpoints.profileURL,
      );
      return Right(ProfileModel.fromMap(response.data));
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> updateProfile({
    String? name,
    String? email,
    File? image,
  }) async {
    try {
      final data = FormData.fromMap({
        'name': name,
        'email': email,
        'picture': image != null
            ? await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
              )
            : null,
      });
      final response = await _dioService.dio.put(
        ApiEndpoints.profileURL,
        data: data,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }
  // const { name, date_of_birth, sex, height, weight } = req.body;

  Future<Either<AppErrorHandler, dynamic>> postChildren({
    required String name,
    required String dateOfBirth,
    required String sex,
    required double height,
    required double weight,
  }) async {
    try {
      final response = await _dioService.dio.post(
        ApiEndpoints.childrenURL,
        data: {
          'name': name,
          'date_of_birth': dateOfBirth,
          "sex": sex,
          "height": height,
          "weight": weight,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }
}

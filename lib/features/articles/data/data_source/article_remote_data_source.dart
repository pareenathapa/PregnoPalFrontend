import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/failure/error_handler.dart';

class ArticleRemoteDataSource {
  final DioService api;

  ArticleRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, dynamic>> getAllArticle({
    String? filter = "newest",
  }) async {
    try {
      final response = await api.dio.get(
        ApiEndpoints.articlesURL,
        queryParameters: {
          "sort": filter,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }

  Future<Either<AppErrorHandler, dynamic>> getSingleArticle({
    required String id,
  }) async {
    try {
      final response = await api.dio.get(
        '${ApiEndpoints.articlesURL}/$id',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(AppErrorHandler.fromDioException(e));
    } catch (e) {
      return Left(AppErrorHandler.fromException(e));
    }
  }
}

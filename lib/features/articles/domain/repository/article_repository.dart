import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';

abstract class IArticleRepository {
  IArticleRepository();

  Future<Either<AppErrorHandler, dynamic>> getAllArticle({
    String? filter = "newest",
  });

  Future<Either<AppErrorHandler, dynamic>> getSingleArticle({
    required String id,
  });
}

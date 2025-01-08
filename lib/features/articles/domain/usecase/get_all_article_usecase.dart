import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/article_repository.dart';

class GetAllArticleUsecase extends UseCase<dynamic, String> {
  final IArticleRepository repository;

  GetAllArticleUsecase({required this.repository});

  @override
  FutureOr<Either<AppErrorHandler, dynamic>> call(String params) {
    return repository.getAllArticle(
      filter: params,
    );
  }
}

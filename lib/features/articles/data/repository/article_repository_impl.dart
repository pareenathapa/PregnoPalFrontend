import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';
import '../../domain/repository/article_repository.dart';
import '../data_source/article_remote_data_source.dart';

class ArticleRepositoryImpl extends IArticleRepository {
  final ArticleRemoteDataSource dataSource;

  ArticleRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppErrorHandler, dynamic>> getAllArticle({
    String? filter = "newest",
  }) {
    return dataSource.getAllArticle(filter: filter);
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> getSingleArticle({
    required String id,
  }) {
    return dataSource.getSingleArticle(id: id);
  }
}

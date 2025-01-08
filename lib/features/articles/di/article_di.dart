import '../../../core/connections/api/dio_service.dart';
import '../../../di/main_di.dart';
import '../data/data_source/article_remote_data_source.dart';
import '../data/repository/article_repository_impl.dart';
import '../domain/repository/article_repository.dart';
import '../domain/usecase/get_all_article_usecase.dart';
import '../domain/usecase/get_single_article_usecase.dart';
import '../presentation/cubit/article_cubit.dart';

class ArticleDI {
  void register() {
    // Data Sources
    locator.registerLazySingleton(
      () => ArticleRemoteDataSource(
        api: locator<DioService>(),
      ),
    );

    // Repositories
    locator.registerLazySingleton<IArticleRepository>(
      () => ArticleRepositoryImpl(dataSource: locator()),
    );

    // Use Cases
    locator.registerLazySingleton(
      () => GetAllArticleUsecase(repository: locator()),
    );
    locator.registerLazySingleton(
      () => GetSingleArticleUsecase(repository: locator()),
    );

    // Blocs
    locator.registerFactory<ArticleCubit>(
      () => ArticleCubit(
        getAllArticleUsecase: locator(),
        getSingleArticleUsecase: locator(),
      ),
    );
  }
}

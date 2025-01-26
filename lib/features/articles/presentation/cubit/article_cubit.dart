import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../di/main_di.dart';
import '../../domain/usecase/get_all_article_usecase.dart';
import '../../domain/usecase/get_single_article_usecase.dart';
part 'article_state.dart';
part 'article_cubit.freezed.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final GetAllArticleUsecase _getAllArticleUsecase;
  final GetSingleArticleUsecase _getSingleArticleUsecase;

  ArticleCubit({
    required GetAllArticleUsecase getAllArticleUsecase,
    required GetSingleArticleUsecase getSingleArticleUsecase,
  })  : _getAllArticleUsecase = getAllArticleUsecase,
        _getSingleArticleUsecase = getSingleArticleUsecase,
        super(ArticleState.initial());

  Future<void> addArticle({
    required String title,
    required String description,
    required String author,
    String? authorImage,
    required String articleCover,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        createdAticle: false,
      ),
    );
    // const { author, title, content, author_image, article_cover } = req.body;

    try {
      final response = await locator<DioService>().dio.post(
        '/articles',
        data: {
          'title': title,
          'content': description,
          'author': author,
          if (authorImage != null) 'author_image': authorImage,
          'article_cover': articleCover,
        },
      );
      if (response.statusCode == 201) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            createdAticle: true,
          ),
        );
        getAllArticle();
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          createdAticle: false,
          error: AppErrorHandler(message: "Failed to add article"),
        ),
      );
    }
  }

  Future<void> changeFilter({
    required String filter,
  }) async {
    emit(
      state.copyWith(
        filter: filter,
      ),
    );
    getAllArticle();
  }

  Future<void> getAllArticle() async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _getAllArticleUsecase(state.filter);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            data: success,
          ),
        );
      },
    );
  }

  Future<void> getSingleArticle({
    required String id,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _getSingleArticleUsecase(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            selectedArticle: success,
          ),
        );
      },
    );
  }
}

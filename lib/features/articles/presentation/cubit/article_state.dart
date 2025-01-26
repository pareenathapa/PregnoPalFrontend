part of 'article_cubit.dart';

@freezed
class ArticleState with _$ArticleState {
  const ArticleState._();

  const factory ArticleState({
    @Default(false) bool isLoading,
    AppErrorHandler? error,
    dynamic data,
    dynamic selectedArticle,
    @Default("newest") String filter,
    @Default(false) bool createdAticle,
  }) = _ArticleState;

  // Initial state
  factory ArticleState.initial() => const ArticleState();
}

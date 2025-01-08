import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../config/routes/routes.gr.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/helper/date_time_formatter_string.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../di/main_di.dart';
import '../cubit/article_cubit.dart';
import '../widgets/article_widget.dart';

@RoutePage(name: 'ArticlesScreen')
class ArticlesView extends StatelessWidget implements AutoRouteWrapper {
  const ArticlesView({super.key});

  _filterDialog(BuildContext context, ArticleCubit articleCubit) {
    // Show filter dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // filter by , alphaetical, newst, oldest
        return AlertDialog(
          title: const Text('Filter by'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Alphabetical'),
                onTap: () {
                  articleCubit.changeFilter(
                    filter: 'alphabetical',
                  );
                  locator<NavigationService>().maybePopTop();
                },
              ),
              ListTile(
                title: const Text('Newest'),
                onTap: () {
                  articleCubit.changeFilter(
                    filter: 'newest',
                  );
                  locator<NavigationService>().maybePopTop();
                },
              ),
              ListTile(
                title: const Text('Oldest'),
                onTap: () {
                  articleCubit.changeFilter(
                    filter: 'oldest',
                  );
                  locator<NavigationService>().maybePopTop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: "Articles",
            actions: [
              // Filter button
              IconButton(
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
                onPressed: () {
                  _filterDialog(context, context.read<ArticleCubit>());
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                ),
                onPressed: () {
                  context.router.pushNamed('NotificationScreen');
                },
              ),
              horizontalMargin8,
            ],
          ),
          body: BlocConsumer<ArticleCubit, ArticleState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return state.error != null
                  ? Center(
                      child: Text(state.error.toString()),
                    )
                  : state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.data != null || state.data.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: () async {
                                context.read<ArticleCubit>().getAllArticle();
                              },
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    verticalMargin8,
                                padding: horizontalPadding16,
                                itemCount: state.data.length,
                                itemBuilder: (context, index) {
                                  final article = state.data[index];
                                  return ArticleCardWidget(
                                    onTap: () {
                                      locator<NavigationService>().push(
                                        ArticleDetailRoute(
                                          id: article["_id"],
                                        ),
                                      );
                                    },
                                    articleId: article["_id"],
                                    authorLogo: article["author_image"],
                                    authorName: article["author"],
                                    articleTitle: article["title"],
                                    publishedDate: DateTime.parse(
                                      article["published_date"],
                                    ).formatDateTime(
                                      DateTimeFormatterString
                                          .abbreviatedMonthDayYear,
                                    ),
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: Text("No data"),
                            );
            },
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ArticleCubit>()..getAllArticle(),
      child: this,
    );
  }
}

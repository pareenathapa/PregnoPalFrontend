import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../../config/constants/size/app_size.dart';
import '../../../../../core/common/app_components/app_cached_network_image.dart';
import '../../../../../core/common/app_components/app_text.dart';
import '../../../../../core/service/navigation_service.dart';
import '../../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../../di/main_di.dart';
import '../../cubit/article_cubit.dart';

@RoutePage()
class ArticleDetailPage extends StatefulWidget implements AutoRouteWrapper {
  const ArticleDetailPage({super.key, required this.id});
  final String id;

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ArticleCubit>(),
      child: this,
    );
  }
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleCubit>().getSingleArticle(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        if (state.error != null) {
          context.showSnackBar(
            message: state.error!.message,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final article = state.selectedArticle;

        return Scaffold(
          backgroundColor: PrimitiveColors.grayG30,
          body: article != null
              ? Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<ArticleCubit>()
                            .getSingleArticle(id: widget.id);
                      },
                      child: CustomScrollView(
                        slivers: [
                          CustomSliverAppBar(image: article['article_cover']),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding:
                                      horizontalPadding16 + verticalPadding24,
                                  decoration: const BoxDecoration(
                                    color: PrimitiveColors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Company Name , Follow Button, Email Button
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Company Logo Name
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Company Logo
                                              AppCachedNetworkImage.avatar(
                                                imageUrl:
                                                    article['author_image'],
                                                fit: BoxFit.cover,
                                                height: 40.h,
                                                width: 40.w,
                                                alt: article['author'] ?? "A",
                                              ),
                                              horizontalMargin8,
                                              // Company Name
                                              AppText(
                                                article['author'] ?? "",
                                                style:
                                                    AllTextStyle.f20W6.copyWith(
                                                  color:
                                                      PrimitiveColors.grayG700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                verticalMargin8,
                                Container(
                                  width: double.infinity,
                                  padding:
                                      horizontalPadding16 + verticalPadding24,
                                  decoration: const BoxDecoration(
                                    color: PrimitiveColors.white,
                                    borderRadius: allRadius12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Article Title
                                      AppText(
                                        article['title'] ?? "",
                                        style: AllTextStyle.f24W6.copyWith(
                                          color: PrimitiveColors.grayG900,
                                        ),
                                      ),
                                      verticalMargin16,
                                      // Article Content markdown
                                      Markdown(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        selectable: true,
                                        data: article['content'] ?? "",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.image,
    this.onStretchTrigger,
  });
  final String image;
  final Future<void> Function()? onStretchTrigger;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      flexibleSpace: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: horizontalLeftRadius12 + horizontalRightRadius12,
        ),
        child: FlexibleSpaceBar(
          centerTitle: true,
          background: AppCachedNetworkImage.custom(
            imageUrl: image,
            fit: BoxFit.cover,
            height: 320.h,
            width: double.infinity,
          ),
        ),
      ),
      expandedHeight: 320.h,
      backgroundColor: PrimitiveColors.purpleP0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
        onPressed: () {
          // locator<CampaignBloc>().add(InfluencerCampaignListGetEvent('active'));
          locator<NavigationService>().maybePop();
        },
      ),
    );
  }
}

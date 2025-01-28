import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/constants/size/app_size.dart';
import '../../../../../core/common/app_components/app_button.dart';
import '../../../../../core/common/app_components/app_text.dart';
import '../../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../../core/service/navigation_service.dart';
import '../../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../../di/main_di.dart';
import '../../../../profile/presentation/cubit/profile_detail_cubit.dart';
import '../../cubit/article_cubit.dart';

@RoutePage()
class AddArticlePage extends StatelessWidget implements AutoRouteWrapper {
  AddArticlePage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<ArticleCubit>()..getAllArticle(),
        ),
        BlocProvider(
          create: (context) =>
              locator<ProfileDetailCubit>()..getProfileDetail(),
        ),
      ],
      child: this,
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _articleCoverController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ProfileDetailCubit>()..getProfileDetail(),
      child: BlocConsumer<ArticleCubit, ArticleState>(
        listener: (context, state) {
          if (state.createdAticle) {
            // clear the form
            _titleController.clear();
            _descriptionController.clear();
            _articleCoverController.clear();

            context.showSnackBar(message: "Article Created Successfully");
            
          }
          if (state.error != null) {
            context.showSnackBar(
              message: state.error!.message,
              isError: true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Article'),
            ),
            body: Padding(
              padding: allPadding16,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      AppText(
                        "Add Article",
                        style: AllTextStyle.f24W6,
                      ),
                      verticalMargin6,
                      AppText(
                        "Add articles that you want to share with the world",
                        style: AllTextStyle.f14W4,
                      ),
                      verticalMargin12,
                      KTextFormField(
                        controller: _titleController,
                        hintText: "Article Title",
                        titleText: "Title",
                        validator: (value) {
                          final result = value!.validateNotEmpty(
                            "Title",
                          );
                          return result.fold(
                            (error) => error,
                            (success) => null,
                          );
                        },
                      ),
                      verticalMargin12,
                      KTextFormField(
                        controller: _articleCoverController,
                        hintText: "Paste Image URL",
                        titleText: "Cover Image",
                        validator: (value) {
                          final result = value!.validateNotEmpty(
                            "Cover Image",
                          );
                          return result.fold(
                            (error) => error,
                            (success) => null,
                          );
                        },
                      ),
                      verticalMargin12,
                      KTextFormField(
                        controller: _descriptionController,
                        hintText: "Article Description",
                        titleText: "Description",
                        maxLines: 18,
                        validator: (value) {
                          final result = value!.validateNotEmpty(
                            "Description",
                          );
                          return result.fold(
                            (error) => error,
                            (success) => null,
                          );
                        },
                      ),
                      verticalMargin12,
                      AppButton.primary(
                        isLoading: state.isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<ArticleCubit>().addArticle(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  articleCover: _articleCoverController.text,
                                  author: context
                                          .read<ProfileDetailCubit>()
                                          .state
                                          .profileData
                                          ?.user
                                          .name ??
                                      "",
                                  authorImage: context
                                      .read<ProfileDetailCubit>()
                                      .state
                                      .profileData
                                      ?.user
                                      .picture,
                                );
                          }
                        },
                        label: "Add Article",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

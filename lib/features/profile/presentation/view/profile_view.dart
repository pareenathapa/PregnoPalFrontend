import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../config/routes/routes.gr.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_divider.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../core/common/loaders/common_loader.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../di/main_di.dart';
import '../../../authentication/presentation/cubit/authentication_cubit.dart';
import '../cubit/profile_detail_cubit.dart';
import '../widget/profile_children_section_widget.dart';
import '../widget/profile_image_section_widget.dart';

@RoutePage(name: "ProfileScreen")
class ProfileView extends StatefulWidget implements AutoRouteWrapper {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              locator<ProfileDetailCubit>()..getProfileDetail(),
        ),
        BlocProvider(
          create: (context) => locator<AuthenticationCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.isLoggedOut) {
          locator<NavigationService>().replaceAll([BottomNavWrapperRoute()]);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppText('Profile'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthenticationCubit>().logout();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        floatingActionButton:
            BlocBuilder<ProfileDetailCubit, ProfileDetailState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomRight,
              child: AppButton.primary(
                width: 0.92.sw,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ProfileDetailCubit>().updateUserProfile(
                          name: nameController.text,
                          email: emailController.text,
                        );
                  }
                },
                label: "Save",
                isDisabled: !state.canUpdate,
              ),
            );
          },
        ),
        body: BlocConsumer<ProfileDetailCubit, ProfileDetailState>(
          listener: (context, state) {
            if (state.userData != null) {
              nameController =
                  TextEditingController(text: state.userData!.name);
              emailController =
                  TextEditingController(text: state.userData!.email);
            }
          },
          builder: (context, state) {
            if (state.isLoading && state.userData == null) {
              return const CommonLoader();
            } else if (state.error != null) {
              return Center(
                child: AppText(
                  state.error!.message,
                ),
              );
            } else if (state.userData != null) {
              return _profileBuild(
                context: context,
              );
            }

            return emptyWidget;
          },
        ),
      ),
    );
  }

  Widget _profileBuild({
    required BuildContext context,
  }) {
    return BlocConsumer<ProfileDetailCubit, ProfileDetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileDetailCubit>().getProfileDetail();
          },
          child: Padding(
            padding: horizontalPadding16,
            child: ListView(
              children: [
                // Profile Image Section
                ProfileImageSection(
                  data: state.userData!,
                  state: state,
                  showPreview: state.images.isNotEmpty,
                ),
                verticalMargin16,
                // Profile User Data Section
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Full Name Field
                      KTextFormField(
                        controller: nameController,
                        hintText: "Full Name",
                        titleText: "Full Name",
                        onChanged: (p0) =>
                            context.read<ProfileDetailCubit>().canUpdate(
                                  name: nameController.text,
                                  email: emailController.text,
                                ),
                        validator: (value) {
                          final result = value!.validateName(
                            fieldName: "Full Name",
                          );
                          return result.fold(
                            (error) => error,
                            (success) => null,
                          );
                        },
                      ),
                      verticalMargin12,
                      // Email Field
                      KTextFormField(
                        controller: emailController,
                        hintText: "Email",
                        titleText: "Your Email",
                        onChanged: (p0) =>
                            context.read<ProfileDetailCubit>().canUpdate(
                                  name: nameController.text,
                                  email: emailController.text,
                                ),
                        validator: (value) {
                          final result = value!.validateEmail(
                            fieldName: "Email",
                          );
                          return result.fold(
                            (error) => error,
                            (success) => null,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalMargin12,
                AppDivider.horizontal(),
                verticalMargin12,
                // Children Section
                const ProfileChildrenSectionWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

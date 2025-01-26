import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../../../config/constants/size/app_size.dart';
import '../../../../../../core/common/app_components/app_button.dart';
import '../../../../../../core/common/app_components/app_text.dart';
import '../../../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../../../core/service/navigation_service.dart';
import '../../../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../../../di/main_di.dart';
import '../../../../../config/routes/route_paths.dart';
import '../../../../../config/routes/routes.gr.dart';
import '../../../../../generated/assets.gen.dart';
import '../../cubit/authentication_cubit.dart';

@RoutePage(name: "ForgotPasswordScreen")
class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.isPasswordChanged) {
          context.showSnackBar(
            message: "Password Changed Successfully",
          );
          locator<NavigationService>().replaceAll([LoginRoute()]);
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
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: horizontalPadding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mifu Logo
                  Center(
                    child: Image.asset(
                      Assets.logo.path,
                      height: 56.h,
                      width: 140.w,
                    ),
                  ),
                  verticalMargin48,
                  // Welcome Message
                  AppText(
                    "Change Password",
                    style: AllTextStyle.f26W7.copyWith(
                      color: PrimitiveColors.secondaryDark,
                    ),
                  ),
                  AppText(
                    "Enter your email and password and Confirm password to change your password",
                    style: AllTextStyle.f14W4.copyWith(
                      color: PrimitiveColors.secondary,
                    ),
                  ),
                  verticalMargin32,
                  // Form Fields for Email and Password
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // Email Field
                        KTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          titleText: "Your Email",
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
                        verticalMargin12,
                        // Password Field
                        KTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          titleText: "Password",
                          isPasswordField: true,
                          validator: (value) {
                            final result = value!.validatePassword(
                              fieldName: "Password",
                            );
                            return result.fold(
                              (error) => error,
                              (success) => null,
                            );
                          },
                        ),

                        verticalMargin12,
                        // Confirm Password Field
                        KTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          titleText: "Confirm Password",
                          isPasswordField: true,
                          validator: (value) {
                            final result = value!.validateConfirmPassword(
                              passwordController.text,
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

                  verticalMargin20,
                  // Login Button
                  AppButton.primary(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthenticationCubit>().changePassword(
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            );
                      }
                    },
                    label: "Change Password",
                    isLoading: state.isLoading,
                  ),

                  verticalMargin24,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

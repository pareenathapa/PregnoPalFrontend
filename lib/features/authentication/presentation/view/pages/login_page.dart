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
import '../../../../../generated/assets.gen.dart';
import '../../cubit/authentication_cubit.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: "aayushpandey616@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "@ppleWas123",
  );

  void _textFieldChanged(BuildContext context) {
    context.read<AuthenticationCubit>().validateLoginForm(
          email: emailController.text,
          password: passwordController.text,
        );
  }

  void _onLoginButtonPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().login(
            email: emailController.text,
            password: passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.isLoggedIn) {
          context.showSnackBar(
            message: "Logged In Successfully",
          );
          locator<NavigationService>()
              .replaceNamed(AppRoutePaths.bottomNavWrapper());
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
          body: SingleChildScrollView(
            child: Padding(
              padding: horizontalPadding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalMargin50 + verticalMargin16,
                  // pregnopal Logo
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
                    "Sign In",
                    style: AllTextStyle.f26W7.copyWith(
                      color: PrimitiveColors.secondaryDark,
                    ),
                  ),
                  AppText(
                    "Enter your email and password to sign in your account",
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
                          onChanged: (value) {
                            _textFieldChanged(context);
                          },
                        ),
                        verticalMargin12,
                        // Password Field
                        KTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          titleText: "Password",
                          isPasswordField: true,
                          onChanged: (value) {
                            _textFieldChanged(context);
                          },
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
                      ],
                    ),
                  ),
                  verticalMargin8,
                  // Forgot Password
                  InkWell(
                    onTap: () {
                      // locator<NavigationService>().push(ForgotPasswordRoute());
                    },
                    child: Text(
                      "Forgot your password?",
                      style: AllTextStyle.f14W4.copyWith(
                        color: PrimitiveColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  verticalMargin20,
                  // Login Button
                  AppButton.primary(
                    onPressed: () {
                      _onLoginButtonPressed(context);
                    },
                    label: "Sign In",
                    isLoading: state.isLoading,
                    isDisabled: !state.isLoginFormValid,
                  ),
                  verticalMargin8,
                  // Don't have an account? Register
                  Center(
                    child: InkWell(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(AppRoutePaths.register());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: AllTextStyle.f14W5.copyWith(
                            color: PrimitiveColors.secondaryLight,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Register",
                              style: AllTextStyle.f14W7.copyWith(
                                color: PrimitiveColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

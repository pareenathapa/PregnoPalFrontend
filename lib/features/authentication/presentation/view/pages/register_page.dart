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
import '../../../../../core/helper/date_time_formatter_string.dart';
import '../../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../appointment/presentation/view/appointment_detail_page.dart';
import '../../cubit/authentication_cubit.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController fullName = TextEditingController(
    text: "John Doe",
  );
  final TextEditingController emailController = TextEditingController(
    text: "aayushpandey616@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "@ppleWas123",
  );

  final TextEditingController confirmPasswordController = TextEditingController(
    text: "@ppleWas123",
  );

  final TextEditingController specializationController =
      TextEditingController();
  DateTime availableFromController = DateTime.now();
  DateTime availableToController = DateTime.now();
  final TextEditingController availableFromTextController =
      TextEditingController(
    text: DateTime.now().formatDateTime(
      DateTimeFormatterString.abbreviatedDayMonthDayTimeFormat,
    ),
  );
  final TextEditingController availableToTextController = TextEditingController(
    text: DateTime.now().formatDateTime(
      DateTimeFormatterString.abbreviatedDayMonthDayTimeFormat,
    ),
  );

  void _textFieldChanged(BuildContext context) {
    context.read<AuthenticationCubit>().validateRegisterForm(
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          name: fullName.text,
          availableFrom: availableFromController,
          availableTo: availableToController,
          specialization: specializationController.text,
        );
  }

  void _onSignUpButtonPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().register(
            email: emailController.text,
            password: passwordController.text,
            name: fullName.text,
            specialization: specializationController.text,
            availableFrom: availableFromController,
            availableTo: availableToController,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.isRegisterSuccess) {
          context.showSnackBar(
            message: "Registered Successfully",
          );
          locator<NavigationService>().pushNamed(AppRoutePaths.login());
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
                    "Create account",
                    style: AllTextStyle.f26W7.copyWith(
                      color: PrimitiveColors.secondaryDark,
                    ),
                  ),
                  AppText(
                    "Sing up to start using our application",
                    style: AllTextStyle.f14W4.copyWith(
                      color: PrimitiveColors.secondary,
                    ),
                  ),
                  verticalMargin32,
                  // Switch to Doctor
                  Row(
                    children: [
                      // Switch to Doctor
                      InkWell(
                        onTap: () {
                          context.read<AuthenticationCubit>().selectRole(
                                role: "doctor",
                              );
                          context
                              .read<AuthenticationCubit>()
                              .validateRegisterForm(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                name: fullName.text,
                              );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: state.selectedRole == "doctor"
                                ? PrimitiveColors.primary
                                : PrimitiveColors.lightGrey,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AppText(
                            "Doctor",
                            style: AllTextStyle.f14W5.copyWith(
                              color: state.selectedRole == "doctor"
                                  ? Colors.white
                                  : PrimitiveColors.grayG600,
                            ),
                          ),
                        ),
                      ),
                      horizontalMargin8,
                      // Switch to User
                      InkWell(
                        onTap: () {
                          context.read<AuthenticationCubit>().selectRole(
                                role: "user",
                              );
                          context
                              .read<AuthenticationCubit>()
                              .validateRegisterForm(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                name: fullName.text,
                              );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: state.selectedRole == "user"
                                ? PrimitiveColors.primary
                                : PrimitiveColors.lightGrey,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: AppText(
                            "User",
                            style: AllTextStyle.f14W5.copyWith(
                              color: state.selectedRole == "user"
                                  ? Colors.white
                                  : PrimitiveColors.grayG600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Form Fields for Email and Password
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // Full Name Field
                        KTextFormField(
                          controller: fullName,
                          hintText: "Full Name",
                          titleText: "Full Name",
                          validator: (value) {
                            final result = value!.validateName(
                              fieldName: "Full Name",
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
                        verticalMargin12,
                        // Confirm Password Field
                        KTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          titleText: "Confirm Password",
                          isPasswordField: true,
                          onChanged: (value) {
                            _textFieldChanged(context);
                          },
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
                        if (state.selectedRole == "doctor")
                          // Specialization Field
                          Column(
                            children: [
                              verticalMargin12,
                              KTextFormField(
                                controller: specializationController,
                                hintText: "Specialization",
                                titleText: "Specialization",
                                validator: (value) {
                                  final result = value!.validateNotEmpty(
                                    "Specialization",
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
                              // Available From Field (Date Time Picker)
                              KTextFormField(
                                controller: availableFromTextController,
                                hintText: "Available From",
                                titleText: "Available From",
                                validator: (value) {
                                  final result = value!.validateNotEmpty(
                                    "Available From",
                                  );
                                  return result.fold(
                                    (error) => error,
                                    (success) => null,
                                  );
                                },
                                onChanged: (value) {
                                  availableFromTextController.text = value!;
                                  _textFieldChanged(context);
                                },
                                onTap: () async {
                                  // show both date and time picker
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  );

                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (date != null && time != null) {
                                    availableFromController = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    );
                                    availableFromTextController.text =
                                        availableFromController.formatDateTime(
                                      DateTimeFormatterString
                                          .abbreviatedDayMonthDayTimeFormat,
                                    );
                                    _textFieldChanged(context);
                                  }
                                },
                              ),
                              verticalMargin12,
                              // Available To Field (Date Time Picker)
                              KTextFormField(
                                controller: availableToTextController,
                                hintText: "Available To",
                                titleText: "Available To",
                                validator: (value) {
                                  final result = value!.validateNotEmpty(
                                    "Available To",
                                  );
                                  return result.fold(
                                    (error) => error,
                                    (success) => null,
                                  );
                                },
                                onChanged: (value) {
                                  availableToTextController.text = value!;
                                  _textFieldChanged(context);
                                },
                                onTap: () async {
                                  // show both date and time picker
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: availableFromController,
                                    lastDate: DateTime(2100),
                                  );

                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  if (date != null && time != null) {
                                    availableToController = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    );
                                    availableToTextController.text =
                                        availableToController.formatDateTime(
                                      DateTimeFormatterString
                                          .abbreviatedDayMonthDayTimeFormat,
                                    );
                                    _textFieldChanged(context);
                                  }
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  verticalMargin8,
                  // I have read and agree to the Terms and Conditions
                  Row(
                    children: [
                      // Checkbox
                      Checkbox(
                        value: state.isAgreed,
                        onChanged: (value) {
                          context
                              .read<AuthenticationCubit>()
                              .agreeTermsAndConditions(value!);

                          context
                              .read<AuthenticationCubit>()
                              .validateRegisterForm(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                name: fullName.text,
                              );
                        },
                      ),
                      AppText(
                        "I Agree to the Terms and Conditions",
                        style: AllTextStyle.f14W4.copyWith(
                          color: PrimitiveColors.grayG600,
                        ),
                      ),
                    ],
                  ),
                  verticalMargin20,
                  // Login Button
                  AppButton.primary(
                    onPressed: () {
                      _onSignUpButtonPressed(context);
                    },
                    label: "Sign Up",
                    isLoading: state.isLoading,
                  ),
                  verticalMargin8,
                  // Don't have an account? Register
                  Center(
                    child: InkWell(
                      onTap: () {
                        locator<NavigationService>()
                            .pushNamed(AppRoutePaths.login());
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: AllTextStyle.f14W5.copyWith(
                            color: PrimitiveColors.secondaryLight,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
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

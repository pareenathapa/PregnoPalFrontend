import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';

/// A utility class that defines various text styles used throughout the application.
/// This class cannot be instantiated or extended.
class AppTextStyles {
  AppTextStyles._();

  /// Heading 1 style with a font size of 36 and bold weight.
  static CustomTextStyle h1 = CustomTextStyle(
    fontSize: 38.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// Heading 2 style with a font size of 32 and bold weight.
  static CustomTextStyle h2 = CustomTextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// Heading 3 style with a font size of 28 and bold weight.
  static CustomTextStyle h3 = CustomTextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// Heading 4 style with a font size of 24 and bold weight.
  static CustomTextStyle h4 = CustomTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// Heading 5 style with a font size of 20 and bold weight.
  static CustomTextStyle h5 = CustomTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// Heading 6 style with a font size of 16 and bold weight.
  static CustomTextStyle h6 = CustomTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static CustomTextStyle mainText = CustomTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
  static CustomTextStyle secondaryText = CustomTextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );
  static CustomTextStyle descriptionText = CustomTextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
  static CustomTextStyle descriptionTextSmall = CustomTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );
  static CustomTextStyle additionalText = CustomTextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );
}

/// A custom text style class that extends the Flutter [TextStyle].
/// Provides a standardized way to define text styles across the application,
/// with options for setting font size, weight, color, letter spacing, height, and family.
///
/// Use this class to create consistent text styling in your Flutter app.
///
/// Example:
/// ```dart
/// Text(
///   'Hello World',
///   style: AppTextStyles.mBM.copyWith(
///                color: AppColor.text,
///              ),
/// );
/// ```
class CustomTextStyle extends TextStyle {
  /// Creates a [CustomTextStyle] with the given parameters.
  ///
  /// [fontSize] is required to set the size of the text.
  /// Optional parameters include [fontWeight], [color], [letterSpacing],
  /// [height], and [fontFamily].
  const CustomTextStyle({
    required super.fontSize,
    super.fontWeight,
    super.color,
    super.letterSpacing,
    super.height,
    super.fontFamily,
  });

  /// Factory method to create a [CustomTextStyle] based on another [TextStyle],
  /// with an optional [CustomAppColor].
  ///
  /// This can be used to adapt existing text styles to the application's theme colors.
  ///
  /// Example:
  /// ```dart
  /// CustomTextStyle customStyle = CustomTextStyle._style(
  ///   TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  ///   AppColor.primary,
  /// );
  /// ```
  factory CustomTextStyle._style(
    TextStyle textStyle, [
    CustomAppColor? color,
  ]) {
    return CustomTextStyle(
      fontSize: textStyle.fontSize,
      fontWeight: textStyle.fontWeight,
      color: color ?? OldPrimitiveColors.grey0,
      letterSpacing: textStyle.letterSpacing,
      fontFamily: textStyle.fontFamily,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../themes/text_theme/all_text_styles.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final String label;
  final bool isLoading;
  final bool isDisabled;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final CustomAppColor? backgroundColor;
  final CustomAppColor? foregroundColor;
  final CustomAppColor? backgroundDisabledColor;
  final CustomAppColor? foregroundDisabledColor;
  final bool translate;
  final bool fixHeight;
  final bool showBorder;
  final Widget? prefix;
  final Widget? suffix;
  final BorderSide? border;

  const AppButton._({
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isDisabled = false,
    this.radius,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundDisabledColor,
    this.foregroundDisabledColor,
    this.height,
    this.width,
    this.translate = true,
    this.fixHeight = true,
    this.showBorder = false,
    this.prefix,
    this.suffix,
    this.border,
  });

  factory AppButton.primary({
    required void Function()? onPressed,
    double? height,
    double? width,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    BorderRadius? radius,
    EdgeInsets? padding,
    bool translate = true,
    bool fixHeight = true,
    bool border = false,
    Widget? prefix,
    Widget? suffix,
  }) {
    return AppButton._(
      height: height,
      width: width,
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      radius: radius,
      padding: padding,
      backgroundColor: PrimitiveColors.primary,
      foregroundColor: PrimitiveColors.purpleP0,
      backgroundDisabledColor: PrimitiveColors.primaryLight,
      foregroundDisabledColor: PrimitiveColors.purpleP0,
      translate: translate,
      fixHeight: fixHeight,
      prefix: prefix,
      suffix: suffix,
    );
  }

  factory AppButton.secondary({
    required void Function()? onPressed,
    double? height,
    double? width,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    BorderRadius? radius,
    EdgeInsets? padding,
    bool translate = true,
    bool fixHeight = true,
    bool border = false,
    Widget? prefix,
    Widget? suffix,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      radius: radius,
      padding: padding,
      backgroundColor: PrimitiveColors.purpleP40,
      foregroundColor: PrimitiveColors.primary,
      backgroundDisabledColor: PrimitiveColors.purpleP30,
      foregroundDisabledColor: PrimitiveColors.primary,
      height: height,
      width: width,
      translate: translate,
      fixHeight: fixHeight,
      prefix: prefix,
      suffix: suffix,
    );
  }

  factory AppButton.stroke({
    required void Function()? onPressed,
    double? height,
    double? width,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    BorderRadius? radius,
    EdgeInsets? padding,
    bool translate = true,
    bool fixHeight = true,
    bool border = true,
    Widget? prefix,
    Widget? suffix,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      radius: radius,
      padding: padding,
      backgroundColor: PrimitiveColors.purpleP0,
      foregroundColor: PrimitiveColors.primary,
      backgroundDisabledColor: PrimitiveColors.purpleP0,
      foregroundDisabledColor: PrimitiveColors.darkGrayD200,
      height: height,
      width: width,
      translate: translate,
      fixHeight: fixHeight,
      showBorder: border,
      prefix: prefix,
      suffix: suffix,
    );
  }

  factory AppButton.ghost({
    required void Function()? onPressed,
    double? height,
    double? width,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    BorderRadius? radius,
    EdgeInsets? padding,
    bool translate = true,
    bool fixHeight = true,
    bool border = false,
    Widget? prefix,
    Widget? suffix,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      radius: radius,
      padding: padding,
      backgroundColor: PrimitiveColors.purpleP0,
      foregroundColor: PrimitiveColors.primary,
      backgroundDisabledColor: PrimitiveColors.purpleP0,
      foregroundDisabledColor: PrimitiveColors.primary,
      height: height,
      width: width,
      translate: translate,
      fixHeight: fixHeight,
      prefix: prefix,
      suffix: suffix,
    );
  }

  // Custom button can set background

  factory AppButton.custom({
    required void Function()? onPressed,
    double? height,
    double? width,
    required String label,
    bool isLoading = false,
    bool isDisabled = false,
    BorderRadius? radius,
    EdgeInsets? padding,
    CustomAppColor? backgroundColor,
    CustomAppColor? foregroundColor,
    CustomAppColor? backgroundDisabledColor,
    CustomAppColor? foregroundDisabledColor,
    bool translate = true,
    bool fixHeight = true,
    Widget? prefix,
    Widget? suffix,
    bool? showBorder,
    BorderSide? border,
  }) {
    return AppButton._(
      onPressed: onPressed,
      label: label,
      isLoading: isLoading,
      isDisabled: isDisabled,
      radius: radius,
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      backgroundDisabledColor: backgroundDisabledColor,
      foregroundDisabledColor: foregroundDisabledColor,
      height: height,
      width: width,
      translate: translate,
      fixHeight: fixHeight,
      prefix: prefix,
      suffix: suffix,
      showBorder: showBorder ?? false,
      border: border,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: radius ?? allRadius12,
          side: showBorder
              ? border ??
                  BorderSide(
                    color: isDisabled
                        ? PrimitiveColors.darkGrayD200
                        : PrimitiveColors.primary,
                  )
              : BorderSide.none,
        ),
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundDisabledColor,
        foregroundColor: foregroundColor,
        disabledForegroundColor: foregroundDisabledColor,
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: fixHeight ? Size(width ?? 1.sw, height ?? 60.h) : null,
        padding: padding ?? horizontalPadding16 + verticalPadding16,
        textStyle: AllTextStyle.f14W6,
      ),
      onPressed: isLoading ? () {} : (isDisabled ? null : onPressed),
      child: isLoading
          ? SizedBox(
              height: 30.h,
              width: 30.w,
              child: const CircularProgressIndicator(
                color: PrimitiveColors.lightPurple,
                strokeWidth: 3,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) horizontalMargin8,
                AppText(
                  label,
                  style: AllTextStyle.f14W6,
                  translate: translate,
                ),
                if (suffix != null) horizontalMargin8,
                if (suffix != null) suffix!,
              ],
            ),
    );
  }
}

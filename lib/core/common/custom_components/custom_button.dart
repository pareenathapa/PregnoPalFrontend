import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../themes/text_theme/all_text_styles.dart';

@Deprecated('Use AppButton instead')
class KButton extends StatelessWidget {
  final void Function()? onPressed;
  final CustomAppColor? backgroundColor;
  final CustomAppColor? foregroundColor;
  final double? elevation;
  final Size? fixedSize;
  final CustomAppColor? disabledForegroundColor;
  final CustomAppColor? disabledBackgroundColor;
  final CustomAppColor? iconColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final IconData? iconData;
  final double? iconSize;
  final String? label;
  final double? borderRadius;
  final String? svg;
  final BorderSide? borderSide;
  final bool? isLoading;
  final bool? isDisabled;

  const KButton({
    super.key,
    required this.onPressed,
    this.elevation,
    this.fixedSize,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledForegroundColor,
    this.disabledBackgroundColor,
    this.iconColor,
    this.textStyle,
    this.iconSize,
    this.iconData,
    this.label,
    this.borderRadius,
    this.svg,
    this.borderSide,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buildRowChildren() {
      final List<Widget> widgets = [];

      // Helper function to add widget and a spacer
      void addWidgetWithSpacer(Widget widget) {
        if (widgets.isNotEmpty) {
          widgets.add(horizontalMargin8); // Spacer
        }
        widgets.add(widget);
      }

      // Add SVG if not null
      if (svg != null) {
        addWidgetWithSpacer(
          SvgPicture.asset(
            svg!,
            width: iconSize ?? 20.w,
            height: iconSize ?? 20.h,
            // ignore: deprecated_member_use
            color: iconColor ?? PrimitiveColors.white,
          ),
        );
      }

      // Add Icon if not null
      if (iconData != null) {
        addWidgetWithSpacer(
          Icon(
            iconData,
            color: iconColor ?? PrimitiveColors.white,
            size: iconSize ?? 20.w,
          ),
        );
      }

      // Add Text if not null
      if (label != null) {
        addWidgetWithSpacer(
          Flexible(
            child: Text(
              label!,
              style: textStyle ??
                  AllTextStyle.f14W4.copyWith(
                    color: foregroundColor ?? PrimitiveColors.white,
                  ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
        );
      }

      return widgets;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12), // User input
          side: borderSide ?? BorderSide.none,
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation ?? 0, // User input
        alignment: Alignment.center,
        fixedSize: fixedSize ?? Size(MediaQuery.of(context).size.width, 60.h),
        padding: padding ?? horizontalPadding16,
      ),
      onPressed: isLoading == true
          ? () {}
          : isDisabled == true
              ? null
              : onPressed,
      child: isLoading == true
          ? SizedBox(
              height: 30.h,
              width: 30.w,
              child: CircularProgressIndicator(
                color: PrimitiveColors.lightPurple,
                strokeWidth: 3.r,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildRowChildren(),
            ),
    );
  }
}

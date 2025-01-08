import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/custom_app_color.dart';

/// A customizable divider widget that can be either vertical or horizontal.
///
/// The [AppDivider] class provides a way to create dividers with customizable
/// properties such as thickness, indent, end indent, height, and color. It can
/// be used to create both vertical and horizontal dividers.
///
/// Example usage:
///
/// ```dart
/// // Horizontal Divider
/// AppDivider.horizontal(
///   thickness: 2.0,
///   indent: 16.0,
///   endIndent: 16.0,
///   height: 20.0,
///   color: CustomAppColor.primary,
/// );
///
/// // Vertical Divider
/// AppDivider.vertical(
///   thickness: 2.0,
///   indent: 16.0,
///   endIndent: 16.0,
///   color: CustomAppColor.primary,
/// );
/// ```
///
/// The [isVertical] parameter determines whether the divider is vertical or
/// horizontal. The [indent] and [endIndent] parameters specify the amount of
/// space to leave before and after the divider, respectively. The [height]
/// parameter is only applicable for horizontal dividers, and the [thickness]
/// parameter specifies the thickness of the divider. The [color] parameter
/// allows you to set the color of the divider.
class AppDivider extends StatelessWidget {
  final bool isVertical;
  final double? indent;
  final double? endIndent;
  final double? height;
  final double? thickness;
  final CustomAppColor? color;
  const AppDivider._({
    this.isVertical = false,
    this.indent,
    this.endIndent,
    this.height,
    this.thickness,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? VerticalDivider(
            thickness: thickness ?? 1.w,
            indent: indent,
            endIndent: endIndent,
            color: color,
          )
        : Divider(
            thickness: thickness ?? 1.h,
            indent: indent,
            endIndent: endIndent,
            height: height,
            color: color,
          );
  }

  // Vertical Divider
  factory AppDivider.vertical({
    double? thickness,
    double? indent,
    double? endIndent,
    CustomAppColor? color,
  }) {
    return AppDivider._(
      isVertical: true,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }

  // Horizontal Divider
  factory AppDivider.horizontal({
    double? thickness,
    double? indent,
    double? endIndent,
    double? height,
    CustomAppColor? color,
  }) {
    return AppDivider._(
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      height: height,
      color: color,
    );
  }
}

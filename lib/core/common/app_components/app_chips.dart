import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../../generated/assets.gen.dart';
import '../../themes/text_theme/all_text_styles.dart';
import 'app_svg_picture.dart';
import 'app_text.dart';

/// A custom Chip widget with all possible attributes for customization.
///
/// The `AppChips` widget can be customized with the following attributes:
/// - [label] to specify the text inside the chip.
/// - [avatar] to display an optional leading icon or image.
/// - [selectedIcon] to show a delete icon inside the chip.
/// - [onTap] callback when the delete icon is tapped.
/// - [backgroundColor] to customize the chip's background color.
/// - [padding] to set the padding inside the chip.
/// - [elevation] to add elevation/shadow effect.
/// - [shape] to define the shape and border.
/// - [shadowColor] to customize the color of the shadow.
/// - [labelStyle] to customize the style of the chip label.
/// - [labelPadding] to set the padding around the label inside the chip.
/// - [autoColor] to enable automatic color selection from a predefined list.
/// - [colorIndex] to specify the index for the automatic color selection.
/// - [translate] to enable or disable text translation.
///
/// Example usage:
/// ```dart
/// AppChips(
///   label: 'Example Chip',
///   backgroundColor: Colors.blue,
///   labelStyle: TextStyle(color: Colors.white),
///   avatar: Icon(Icons.star, color: Colors.white),
///   deleteIcon: Icon(Icons.close, color: Colors.white),
///   onDeleted: () {
///     print('Chip deleted');
///   },
///   elevation: 4.0,
///   shadowColor: Colors.grey,
///   padding: EdgeInsets.all(8.0),
///   labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
///   shape: BoxShape.rectangle,
///   autoColor: true,
///   colorIndex: 2,
///   translate: false,
/// )
/// ```
class AppChips extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? selectedColor;
  final TextStyle? labelStyle;
  final Widget? selectedIcon;
  final VoidCallback? onTap;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final BoxShape? shape;
  final bool autoColor;
  final int colorIndex;
  final bool translate;
  final bool isSelected;

  AppChips({
    super.key,
    required this.label,
    this.backgroundColor,
    this.selectedColor,
    this.labelStyle,
    this.selectedIcon,
    this.onTap,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.labelPadding,
    this.shape,
    this.autoColor = false,
    this.colorIndex = 0,
    this.translate = true,
    this.isSelected = false,
  });

  final autoColorList = [
    PrimitiveColors.additionalLightBlue,
    PrimitiveColors.additionalLightOrange,
    PrimitiveColors.additionalLightPink,
    PrimitiveColors.additionalLightRed,
    PrimitiveColors.additionalLightPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: autoColor
              ? autoColorList[colorIndex % autoColorList.length]
              : isSelected
                  ? selectedColor
                  : backgroundColor ?? PrimitiveColors.primary,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: allRadius50,
        ),
        padding: padding ?? horizontalPadding12 + verticalPadding2,
        margin: verticalPadding4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (isSelected && selectedIcon != null)
                ? selectedIcon!
                : (isSelected && selectedIcon == null)
                    ? AppSvgPicture.fromAsset(
                        Assets.icon.check,
                        width: 26.w,
                        height: 26.h,
                        color: PrimitiveColors.grayG700,
                      )
                    : emptyWidget,
            if (isSelected) horizontalMargin4,
            AppText(
              maxLines: 1,
              label,
              translate: translate,
              style: autoColor
                  ? AllTextStyle.f12W6.copyWith(
                      color: PrimitiveColors.grayG700,
                    )
                  : labelStyle ?? AllTextStyle.f12W6,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

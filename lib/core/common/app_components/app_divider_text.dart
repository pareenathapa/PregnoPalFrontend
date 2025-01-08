import 'package:flutter/material.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../themes/text_theme/app_text_styles.dart';
import 'app_divider.dart';
import 'app_text.dart';

/// A widget that displays a text with dividers on both sides.
///
/// The [AppDividerText] widget is a row that contains a text widget
/// with horizontal dividers on both sides. It is useful for visually
/// separating sections of content with a labeled divider.
///
/// The [text] parameter is required and specifies the text to be displayed.
///
/// The [textStyle] parameter allows customization of the text style.
/// If not provided, a default style is used.
///
/// The [dividerColor] parameter specifies the color of the dividers.
///
/// The [dividerThickness] parameter specifies the thickness of the dividers.
///
/// The [translate] parameter indicates whether the text should be translated.
/// It defaults to `true`.
///
/// Example usage:
///
/// ```dart
/// AppDividerText(
///   text: 'Section Title',
///   textStyle: AllTextStyles.f14W6,
///   dividerColor: PrimitiveColors.grayG100,
///   dividerThickness: 2.0.h,
///   translate: false,
/// )
/// ```

class AppDividerText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final CustomAppColor? dividerColor;
  final double? dividerThickness;
  final bool translate;

  const AppDividerText({
    super.key,
    required this.text,
    this.textStyle,
    this.dividerColor,
    this.dividerThickness,
    this.translate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppDivider.horizontal(
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
        horizontalMargin12,
        AppText(
          text,
          style: textStyle ??
              AppTextStyles.descriptionText.copyWith(
                color: PrimitiveColors.grayG100,
              ),
          translate: translate,
        ),
        horizontalMargin12,
        Expanded(
          child: AppDivider.horizontal(
            color: dividerColor,
            thickness: dividerThickness,
          ),
        ),
      ],
    );
  }
}

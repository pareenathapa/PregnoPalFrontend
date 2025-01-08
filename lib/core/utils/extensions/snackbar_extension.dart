import 'package:flutter/material.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../helper/snackbar_helper.dart';
import '../../themes/text_theme/app_text_styles.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = PrimitiveColors.green,
    CustomTextStyle? textStyle,
    bool isError = false,
  }) {
    SnackbarHelper.show(
      context: this,
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      isError: isError,
    );
  }
}

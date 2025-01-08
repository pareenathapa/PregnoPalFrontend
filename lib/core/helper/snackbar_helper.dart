import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../config/constants/colors/primitive_colors_constants.dart';
import '../common/app_components/app_text.dart';
import '../themes/text_theme/all_text_styles.dart';
import '../themes/text_theme/app_text_styles.dart';

class SnackbarHelper {
  // Store the reference to the current overlay entry
  static OverlaySupportEntry? _overlaySupportEntry;

  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = PrimitiveColors.green,
    CustomTextStyle? textStyle,
    bool isError = false,
  }) {
    // Dismiss any existing overlay before showing a new one
    _overlaySupportEntry?.dismiss();

    // Show the notification using showSimpleNotification
    _overlaySupportEntry = showSimpleNotification(
      Center(
        child: AppText(
          message,
          style: textStyle ??
              AllTextStyle.f14W4.copyWith(
                color: PrimitiveColors.purpleP0,
              ),
        ),
      ),
      background: isError ? PrimitiveColors.red : backgroundColor,
      duration: duration,
      slideDismissDirection: DismissDirection.vertical,
      context: context,
      elevation: 1,
    );

    // Automatically dismiss the notification after the specified duration
    Future.delayed(duration, () {
      _overlaySupportEntry?.dismiss();
      _overlaySupportEntry = null;
    });
  }
}

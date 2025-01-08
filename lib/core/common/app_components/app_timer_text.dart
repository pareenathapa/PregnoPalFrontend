import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../generated/locale_keys.g.dart';
import '../../themes/text_theme/app_text_styles.dart';
import 'app_text.dart';

class AppTimerText extends StatelessWidget {
  final int duration;
  const AppTimerText({
    super.key,
    required this.duration,
  });
  @override
  Widget build(BuildContext context) {
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).toString().padLeft(2, '0');
    return AppText(
      LocaleKeys.appTimerText_resendCodeIn.tr(
        namedArgs: {
          'min': minutesStr,
          'sec': secondsStr,
        },
      ),
      style: AppTextStyles.descriptionText.copyWith(
        color: PrimitiveColors.statusRed,
      ),
    );
  }
}

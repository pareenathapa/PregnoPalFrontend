import 'package:flutter/material.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../themes/text_theme/all_text_styles.dart';
import '../../utils/extensions/title_case_extension.dart';
import '../app_components/app_text.dart';

class NoLogoWidget extends StatelessWidget {
  const NoLogoWidget({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    // trim the title and get the first letter
    final trimmedTitle = title?.trim().replaceAll(" ", '');
    return Center(
      child: AppText(
        (trimmedTitle != null && trimmedTitle.isNotEmpty)
            ? title![0].toTitleCase()
            : 'C',
        style: AllTextStyle.f16W6.copyWith(
          color: PrimitiveColors.primary,
        ),
      ),
    );
  }
}

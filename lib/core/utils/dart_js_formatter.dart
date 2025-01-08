import 'package:flutter/material.dart';
import 'package:flutter_draft/view/draft_text_view.dart';

import '../../config/constants/colors/primitive_colors_constants.dart';
import '../themes/text_theme/all_text_styles.dart';

Widget formatText(String? jsonString) {
  if (jsonString == null) return const SizedBox();

  try {
    return DraftTextView.jsonString(
      jsonString,
      controller: ScrollController(),
      defaultStyle: AllTextStyle.f12W6.copyWith(
        color: PrimitiveColors.grayG900,
        overflow: TextOverflow.visible,
      ),
    );
  } catch (e) {
    return const SizedBox();
  }
}

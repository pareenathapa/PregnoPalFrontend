import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../../generated/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';
import '../../themes/text_theme/all_text_styles.dart';
import 'app_svg_picture.dart';
import 'app_text.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
    required this.onTap,
    this.color = PrimitiveColors.darkGrayD700,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final Null Function() onTap;
  final CustomAppColor? color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        // Text
        Expanded(
          child: AppText(
            LocaleKeys.commonText_viewAll,
            style: AllTextStyle.f14W6.copyWith(
              color: color,
            ),
          ),
        ),
        horizontalMargin8,
        // Arrow Icon
        AppSvgPicture.fromAsset(
          Assets.icon.chevronRight,
          color: color,
          onTap: onTap,
          height: 20.h,
          width: 20.w,
        ),
      ],
    );
  }
}

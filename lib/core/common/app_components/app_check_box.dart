import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final bool showIcon;

  const AppCheckBox({
    super.key,
    this.onChanged,
    required this.value,
    this.borderRadius = allRadius6,
    this.showIcon = true,
  });
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: Container(
        width: 24.0.w,
        height: 24.0.h,
        margin: horizontalPadding4,
        decoration: BoxDecoration(
          color: value ? PrimitiveColors.primary : PrimitiveColors.transparent,
          borderRadius: borderRadius,
          border: Border.all(
            color: value ? PrimitiveColors.primary : PrimitiveColors.grayG60,
            width: 2.0,
          ),
        ),
        child: value
            ? showIcon
                ? Icon(
                    Icons.check,
                    size: 18.0.r,
                    color: PrimitiveColors.white,
                  )
                : null
            : null,
      ),
    );
  }
}

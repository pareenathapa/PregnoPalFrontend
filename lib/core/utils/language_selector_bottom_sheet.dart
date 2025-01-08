import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/colors/primitive_colors_constants.dart';
import '../../config/constants/locales/app_locales.dart';
import '../../di/main_di.dart';
import '../../generated/locale_keys.g.dart';
import '../common/app_components/app_text.dart';
import '../service/navigation_service.dart';
import '../themes/text_theme/app_text_styles.dart';

Future<dynamic> languageSelectorBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: PrimitiveColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: 300.h,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                child: AppText(
                  LocaleKeys.language_language.tr(),
                  style: AppTextStyles.h5.copyWith(
                    color: PrimitiveColors.textMain,
                  ),
                ),
              ),
            ),
            const Divider(
              color: PrimitiveColors.stroke,
              height: 0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: appLocalesNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: AppText(
                      appLocalesNames[index],
                      style: AppTextStyles.descriptionText.copyWith(
                        color: PrimitiveColors.textMain,
                      ),
                    ),
                    onTap: () {
                      context.setLocale(appLocales[index]);
                      locator<NavigationService>().maybePop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

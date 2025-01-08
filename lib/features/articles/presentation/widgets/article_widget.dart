import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_cached_network_image.dart';
import '../../../../core/common/app_components/app_svg_picture.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/themes/text_theme/app_text_styles.dart';
import '../../../../core/utils/extensions/title_case_extension.dart';
import '../../../../generated/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.articleId,
    this.authorLogo,
    this.authorName,
    this.articleTitle,
    this.publishedDate,
    this.onTap,
  });
  final String articleId;
  final String? authorLogo;
  final String? authorName;
  final String? articleTitle;
  final String? publishedDate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: verticalPadding16,
        decoration: BoxDecoration(
          borderRadius: allRadius16,
          color: PrimitiveColors.purpleP0,
          border: Border.all(
            color: PrimitiveColors.darkGrayD200,
          ),
        ),
        child: Column(
          children: [
            // Campaign Details
            Padding(
              padding: horizontalPadding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalMargin4,
                  // Campaign Title with Logo
                  Row(
                    children: [
                      // Campaign Logo
                      AppCachedNetworkImage.avatar(
                        imageUrl: authorLogo,
                        height: 30.h,
                        width: 30.w,
                        borderWidth: 0.5.r,
                        borderColor: PrimitiveColors.transparent,
                        fit: BoxFit.cover,
                        alt: authorName ?? "C",
                      ),
                      horizontalMargin8,
                      // TODO: Brand Name is not available from API
                      Expanded(
                        child: AppText(
                          authorName.toTitleCase(),
                          style: AllTextStyle.f14W6.copyWith(
                            color: PrimitiveColors.grayG600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalMargin4,
                  // Campaign Name
                  AppText(
                    articleTitle.toTitleCase(),
                    style: AppTextStyles.h5.copyWith(
                      color: PrimitiveColors.secondaryDark,
                    ),
                  ),

                  verticalMargin12,
                  // Platform, Time and Users
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Time
                      Row(
                        children: [
                          Container(
                            height: 28.h,
                            width: 28.h,
                            padding: horizontalPadding4 + verticalPadding2,
                            decoration: const BoxDecoration(
                              borderRadius: allRadius50,
                              color: PrimitiveColors.statusLightPurple,
                            ),
                            child: AppSvgPicture.fromAsset(
                              Assets.icon.clock,
                              fit: BoxFit.contain,
                              color: PrimitiveColors.statusPurple,
                            ),
                          ),
                          horizontalMargin4,
                          AppText(
                            publishedDate ?? LocaleKeys.commonText_na.tr(),
                            style: AllTextStyle.f12W6.copyWith(
                              color: PrimitiveColors.grayG600,
                            ),
                          ),
                        ],
                      ),
                      AppText(
                        'Read More',
                        style: AllTextStyle.f12W6.copyWith(
                          color: PrimitiveColors.grayG600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

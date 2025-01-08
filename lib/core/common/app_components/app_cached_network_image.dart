import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/images/image_constant.dart';
import '../../../config/constants/size/app_size.dart';
import '../loaders/common_loader.dart';
import 'no_logo_widget.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage._({
    super.key,
    this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.placeholder,
    this.errorWidget,
    this.imageBuilder,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? imageUrl;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final CustomAppColor? borderColor;
  final double? borderWidth;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  // Avatar factory constructor: circular shape with border and default image
  factory AppCachedNetworkImage.avatar({
    double? width,
    double? height,
    BoxFit? fit,
    String? imageUrl,
    required String alt,
    CustomAppColor borderColor = PrimitiveColors.grayG300,
    double borderWidth = 2.0,
    Widget? errorWidget,
    CustomAppColor? backgroundColor,
  }) {
    return AppCachedNetworkImage._(
      width: width?.w,
      height: height?.h,
      fit: fit ?? BoxFit.cover,
      imageUrl: imageUrl,
      shape: BoxShape.circle,
      borderColor: borderColor,
      borderWidth: borderWidth,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width?.w,
          height: height?.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? PrimitiveColors.purpleP40,
            border: Border.all(
              color: borderColor,
              width: borderWidth.r,
            ),
            image: imageUrl != null
                ? DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null ? NoLogoWidget(title: alt) : null,
        );
      },
      placeholder: const Padding(
        padding: allPadding8,
        child: Center(child: CommonLoader()),
      ),
      errorWidget: errorWidget ??
          Container(
            width: width?.w,
            height: height?.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? PrimitiveColors.purpleP40,
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            child: NoLogoWidget(title: alt),
          ),
    );
  }

  // Custom factory constructor for allowing full customization
  factory AppCachedNetworkImage.custom({
    Key? key,
    required double width,
    required double height,
    required BoxFit fit,
    String? imageUrl,
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomAppColor borderColor = PrimitiveColors.transparent,
    double borderWidth = 0.0,
    Widget? placeholder,
    Widget? errorWidget,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
  }) {
    return AppCachedNetworkImage._(
      key: key,
      width: width.w,
      height: height.h,
      fit: fit,
      imageUrl: imageUrl,
      shape: shape,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth.r,
      placeholder: placeholder,
      errorWidget: errorWidget,
      imageBuilder: imageBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheKey: imageUrl?.split('?').first,
      key: ValueKey(imageUrl), // Ensure the key is properly integrated
      imageUrl: imageUrl ?? AppDefaultImages.urlPlaceholderImage,
      width: width?.w,
      height: height?.h,
      fit: fit,
      // set https header to origin
      /*When embedding Logo Link, HTTP requests must include the Referer header with the request origin. 
      Your HTTP Referrer-Policy header must be set to one of: origin, origin-when-cross-origin, strict-origin, 
      strict-origin-when-cross-origin (browser default), or unsafe-url. */
      httpHeaders: const {
        'Referer': 'origin-when-cross-origin',
      },

      imageBuilder: imageBuilder,
      placeholder: (context, url) =>
          placeholder ??
          const Padding(
            padding: allPadding8,
            child: Center(child: CommonLoader()),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: width?.w,
            height: height?.h,
            decoration: BoxDecoration(
              shape: shape,
              borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
              border: Border.all(
                color: borderColor ?? PrimitiveColors.transparent,
                width: borderWidth?.r ?? 0,
              ),
              image: DecorationImage(
                image: AssetImage(AppDefaultImages.assetPlaceholderImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
      useOldImageOnUrlChange: true,
      errorListener: (value) {
        log('Cached Network Error: $value');
      },
    );
  }
}

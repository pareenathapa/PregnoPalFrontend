import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/constants/colors/custom_app_color.dart';
import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';

/// A widget that displays an SVG picture from either a network URL or an asset path.
///
/// The [AppSvgPicture] widget provides multiple constructors to create an SVG picture
/// from a network URL, an asset path, or as an icon with default dimensions.
///
/// The widget supports customization of dimensions, color, alignment, fit, and tap handling.
///
/// ## Constructors:
///
/// - `AppSvgPicture.fromNetwork`: Creates an SVG picture from a network URL.
/// - `AppSvgPicture.fromAsset`: Creates an SVG picture from an asset path.
/// - `AppSvgPicture.icon`: Creates an SVG picture with default icon dimensions (24x24).
///
/// ## Parameters:
///
/// - `path`: The path to the SVG picture (either a network URL or an asset path).
/// - `width`: The width of the SVG picture.
/// - `height`: The height of the SVG picture.
/// - `color`: The color to apply to the SVG picture.
/// - `onTap`: A callback function to handle tap events.
/// - `fit`: How the SVG picture should be inscribed into the space allocated during layout.
/// - `isNetwork`: A boolean indicating whether the SVG picture is from a network URL.
/// - `alignment`: How to align the SVG picture within its bounds.
/// - `semanticsLabel`: A semantic label for the SVG picture.
/// - `matchTextDirection`: Whether to match the text direction.
///
/// ## Example:
///
/// ```dart
/// // Creating an SVG picture from a network URL
/// AppSvgPicture.fromNetwork(
///   'https://example.com/image.svg',
///   width: 100,
///   height: 100,
///   color: CustomAppColor.primary,
///   onTap: () {
///     print('SVG tapped!');
///   },
/// );
///
/// // Creating an SVG picture from an asset path
/// AppSvgPicture.fromAsset(
///   'assets/images/image.svg',
///   width: 100,
///   height: 100,
///   color: CustomAppColor.primary,
///   onTap: () {
///     print('SVG tapped!');
///   },
/// );
///
/// // Creating an SVG icon
/// AppSvgPicture.icon(
///   'assets/icons/icon.svg',
///   color: CustomAppColor.primary,
///   onTap: () {
///     print('Icon tapped!');
///   },
/// );
/// ```
class AppSvgPicture extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final CustomAppColor? color;
  final VoidCallback? onTap;
  final BoxFit fit;
  final bool isNetwork;
  final bool isIcon;
  final Alignment alignment;
  final String? semanticsLabel;
  final bool matchTextDirection;
  final CustomAppColor? backgroundColor;
  final double? containerHeight;
  final double? containerWidth;
  final EdgeInsets? containerPadding;
  final CustomAppColor? borderColor;
  final double? borderWidth;

  const AppSvgPicture.fromNetwork(
    String url, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.onTap,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.matchTextDirection = false,
  })  : path = url,
        isNetwork = true,
        backgroundColor = null,
        containerHeight = null,
        containerWidth = null,
        containerPadding = null,
        borderColor = null,
        borderWidth = null,
        isIcon = false;

  const AppSvgPicture.fromAsset(
    String assetPath, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.onTap,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.matchTextDirection = false,
  })  : path = assetPath,
        isNetwork = false,
        backgroundColor = null,
        containerHeight = null,
        containerWidth = null,
        containerPadding = null,
        borderWidth = null,
        borderColor = null,
        isIcon = false;

  const AppSvgPicture.icon(
    String assetIconPath, {
    super.key,
    this.width = 24,
    this.height = 24,
    this.color,
    this.onTap,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.matchTextDirection = false,
    this.backgroundColor,
    this.containerHeight,
    this.containerWidth,
    this.containerPadding,
    this.borderColor,
    this.borderWidth = 2,
  })  : path = assetIconPath,
        isNetwork = false,
        fit = BoxFit.contain,
        isIcon = true;

  const AppSvgPicture.networkIcon(
    String url, {
    super.key,
    this.width = 24,
    this.height = 24,
    this.color,
    this.onTap,
    this.alignment = Alignment.center,
    this.semanticsLabel,
    this.matchTextDirection = false,
    this.backgroundColor,
    this.containerHeight,
    this.containerWidth,
    this.containerPadding,
    this.borderColor,
    this.borderWidth = 2,
  })  : path = url,
        isNetwork = true,
        fit = BoxFit.contain,
        isIcon = true;

  double get _defaultHeight => height ?? lg;
  double get _defaultWidth => width ?? lg;

  ColorFilter? get _colorFilter => color != null
      ? ColorFilter.mode(
          color!,
          BlendMode.srcIn,
        )
      : null;

  ImageProvider getImageProvider() {
    return isNetwork ? NetworkImage(path) : AssetImage(path) as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    final child = (isIcon)
        ? Container(
            padding: containerPadding ?? allPadding4,
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor ?? PrimitiveColors.transparent,
                width: borderWidth ?? 0,
              ),
            ),
            child: isNetwork
                ? SvgPicture.network(
                    path,
                    width: _defaultWidth,
                    height: _defaultHeight,
                    fit: fit,
                    alignment: alignment,
                    colorFilter: _colorFilter,
                    semanticsLabel: semanticsLabel,
                    matchTextDirection: matchTextDirection,
                  )
                : SvgPicture.asset(
                    path,
                    width: _defaultWidth,
                    height: _defaultHeight,
                    fit: fit,
                    alignment: alignment,
                    colorFilter: _colorFilter,
                    semanticsLabel: semanticsLabel,
                    matchTextDirection: matchTextDirection,
                  ),
          )
        : (isNetwork)
            ? SvgPicture.network(
                path,
                width: _defaultWidth,
                height: _defaultHeight,
                fit: fit,
                alignment: alignment,
                colorFilter: _colorFilter,
                semanticsLabel: semanticsLabel,
                matchTextDirection: matchTextDirection,
              )
            : SvgPicture.asset(
                path,
                width: _defaultWidth,
                height: _defaultHeight,
                fit: fit,
                alignment: alignment,
                colorFilter: _colorFilter,
                semanticsLabel: semanticsLabel,
                matchTextDirection: matchTextDirection,
              );

    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            child: child,
          )
        : child;
  }
}

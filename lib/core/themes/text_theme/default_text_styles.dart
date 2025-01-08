import 'package:flutter/material.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';

class KTextThemes {
  // Styles for body text
  static TextStyle bodyLarge = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle bodySmall = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  // Styles for headings
  static TextStyle headingLarge = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle headingMedium = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle headingSmall = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  // Styles for captions
  static TextStyle captionLarge = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle captionMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextStyle captionSmall = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: PrimitiveColors.textMain,
  );

  static TextTheme lightTextTheme() {
    return TextTheme(
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      headlineLarge: headingLarge,
      headlineMedium: headingMedium,
      headlineSmall: headingSmall,
      labelLarge: captionLarge,
      labelMedium: captionMedium,
      labelSmall: captionSmall,
    ).apply(
      displayColor: PrimitiveColors.textMain,
      bodyColor: PrimitiveColors.textMain,
    );
  }
}

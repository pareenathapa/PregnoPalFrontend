import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/constants/colors/primitive_colors_constants.dart';
import '../../config/constants/size/app_size.dart';
import '../../generated/assets.gen.dart';
import 'text_theme/all_text_styles.dart';
import 'text_theme/default_text_styles.dart';

/// A class responsible for defining the application's light theme settings.
/// The `AppTheme` class provides a static method `appLightTheme` which returns
/// a `ThemeData` object configured for light mode, including custom fonts,
/// text themes, button styles, and more.
class AppTheme {
  /// Creates and returns the light theme configuration for the application.
  ///
  /// This method defines various visual aspects of the app's UI, such as
  /// brightness, font, text styles, colors, and the appearance of widgets
  /// like AppBar, Scaffold, ElevatedButton, Scrollbar, Drawer, TextButton,
  /// and Icons.
  static appLightTheme() {
    return ThemeData(
      // Set the overall brightness of the theme to light
      brightness: Brightness.light,
      // Use Material Design 3 features
      useMaterial3: true,

      // Set the global font family for the app to 'Lexend'
      fontFamily: Assets.fonts.montserratRegular,

      // Define the text theme with specific colors and font family
      textTheme: KTextThemes.lightTextTheme().apply(
        displayColor: PrimitiveColors
            .textMain, // Color for display text (e.g., headlines)
        bodyColor:
            PrimitiveColors.textMain, // Color for body text (e.g., paragraphs)
        fontFamily: "Montserrat",
      ),

      // TextFormField theme for the app
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 1,
        errorStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.additionalRed,
        ),
        hintFadeDuration: const Duration(milliseconds: 400),
        hintStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.grayG50, // Set the border color
        ),
        activeIndicatorBorder: const BorderSide(
          color: PrimitiveColors.primary, // Set the border color
        ),
        contentPadding: verticalPadding16 + horizontalPadding16,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.darkGrayD200, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.darkGrayD200, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.primary, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.additionalRed, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.additionalRed, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: PrimitiveColors.darkGrayD200, // Set the border color
          ),
          borderRadius: allRadius8, // Set the border radius
        ),
        fillColor: PrimitiveColors.purpleP0,
        filled: true,
        focusColor: PrimitiveColors.primary,
        hoverColor: PrimitiveColors.primary,
        iconColor: PrimitiveColors.additionalDark,
        helperStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.textSecondary,
        ),
        labelStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.textMain,
        ),
        prefixStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.textMain,
        ),
        suffixStyle: AllTextStyle.f14W5.copyWith(
          color: PrimitiveColors.textMain,
        ),
        outlineBorder: const BorderSide(
          color: PrimitiveColors.stroke,
        ),
        prefixIconColor: PrimitiveColors.additionalDark,
        suffixIconColor: PrimitiveColors.additionalDark,
        helperMaxLines: 2,
      ),

      // Customize the appearance of the AppBar
      appBarTheme: AppBarTheme(
        backgroundColor:
            PrimitiveColors.white, // Set the background color of the AppBar
        elevation: 0, // Remove shadow under the AppBar
        scrolledUnderElevation: 0, // Remove elevation when scrolled
        toolbarHeight: 50.h, // Set the height of the toolbar
        iconTheme: const IconThemeData(
          color: PrimitiveColors.dark, // Set the color of icons in the AppBar
        ),
      ),

      // Set the background color for the Scaffold widget
      scaffoldBackgroundColor: PrimitiveColors.white,

      // Customize the appearance of scroll bars
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(
          OldPrimitiveColors.primary550,
        ), // Color of the scrollbar thumb
        trackColor: WidgetStateProperty.all(
          PrimitiveColors.textMain,
        ), // Color of the scrollbar track
        interactive: true, // Allow interaction with the scrollbar
        thumbVisibility:
            WidgetStateProperty.all(true), // Make the scrollbar thumb visible
        radius: const Radius.circular(
          12,
        ), // Rounded corners for the scrollbar thumb
        trackVisibility: WidgetStateProperty.all(
          false,
        ), // Hide the scrollbar track by default
      ),

      // Customize the appearance of the Drawer widget
      drawerTheme: const DrawerThemeData(
        elevation: 0, // Remove shadow under the drawer
        backgroundColor:
            PrimitiveColors.white, // Background color of the drawer
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            // Rounded corners on the right side of the drawer
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),

      // Define the default style for TextButton widgets
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: AllTextStyle.f16W8.copyWith(
            color: PrimitiveColors.white, // Text color of the button
          ),
          elevation: 5, // Elevation (shadow) of the button
          backgroundColor:
              PrimitiveColors.transparent, // Transparent background
        ),
      ),

      // Set the default color for icons in the app
      iconTheme: const IconThemeData(
        color: PrimitiveColors.white, // Color of icons
      ),

      // Set the default color for primary icons (e.g., in the AppBar)
      primaryIconTheme: const IconThemeData(
        color: PrimitiveColors.white, // Primary color for icons
      ),
    );
  }
}

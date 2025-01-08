import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../config/constants/size/app_size.dart';
import '../../../config/routes/routes.dart';
import '../../../di/main_di.dart';
import 'common_loader.dart';

class DialogLoader {
  static final DialogLoader _instance = DialogLoader._internal();
  factory DialogLoader() => _instance;

  DialogLoader._internal();

  bool _isShowing = false;

  void show() {
    if (_isShowing) return;
    _isShowing = true;

    final navigatorContext = locator<AppRouter>().navigatorKey.currentContext!;
    showDialog(
      context: navigatorContext,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (context) {
        return Center(
          child: Container(
            width: 150.w,
            height: 100.h,
            decoration: const BoxDecoration(
              color: PrimitiveColors.purpleP30,
              borderRadius: allRadius12,
            ),
            child: const Center(
              child: CommonLoader(),
            ),
          ),
        );
      },
    );
  }

  void hide() {
    if (!_isShowing) return;
    _isShowing = false;

    final navigatorContext = locator<AppRouter>().navigatorKey.currentContext!;
    Navigator.of(navigatorContext, rootNavigator: true).pop();
  }
}

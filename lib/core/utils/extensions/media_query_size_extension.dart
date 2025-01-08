import 'package:flutter/material.dart';

extension MediaQuerySize on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  TextScaler get textScaler => MediaQuery.textScalerOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Orientation get orientation => MediaQuery.orientationOf(this);
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);
}

import 'package:flutter/material.dart';

import 'custom_app_color.dart';

class AppGradients {
  // Image Overlay Gradient
  static LinearGradient imageOverlayGradient = LinearGradient(
    colors: [
      const CustomAppColor(0xFF000000).withOpacity(0.0),
      const CustomAppColor(0xFF000000).withOpacity(0.5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

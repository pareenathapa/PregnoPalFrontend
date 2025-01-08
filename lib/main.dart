import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/constants/locales/app_locales.dart';
import 'core/app.dart';
import 'core/bootstrap.dart';

void main() async {
  bootstrap(
    builder: () => EasyLocalization(
      supportedLocales: appLocales,
      startLocale: const Locale('en', 'GB'),
      path: "assets/translations",
      fallbackLocale: const Locale('en', 'GB'),
      child: const App(),
    ),
  );
}

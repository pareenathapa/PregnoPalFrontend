import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../config/routes/app_route_oserver.dart';
import '../config/routes/routes.dart';
import '../di/main_di.dart';
import 'themes/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        428,
        926,
      ), // Uses the current device size for design reference.
      minTextAdapt: true, // Enables text scaling based on the screen size.
      splitScreenMode: true, // Adapts the UI for split-screen mode if needed.

      builder: (_, child) {
        final router = locator<
            AppRouter>(); // Retrieves the app router from the service locator.

        return OverlaySupport(
          child: MaterialApp.router(
            // Main MaterialApp configuration using Flutter's router.
            debugShowCheckedModeBanner: false, // Hides the debug banner.
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // Sets the theme of the app to light theme using custom AppTheme.
            theme: AppTheme.appLightTheme(),
            themeMode: ThemeMode.light, // Forces the app to use light mode.
            routerConfig: router.config(
              navigatorObservers: () => [
                locator<AppRouteObserver>(),
              ],
            ), // Configures the router for navigation management.
          ),
        );
      },
    );
  }
}

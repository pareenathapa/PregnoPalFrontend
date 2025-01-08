class AppRoutePoints {
  AppRoutePoints._();

  static const String initialRoute = '/';

  static const String bottomNavWrapperRoute = '/app';

  static const String authenticationRoute = '/auth';
  static const String loginRoute = 'login';
  static const String registerRoute = 'register';

  static const String profile = '/profile';

  static const String articleDetailRoute = '/article-detail';
}

class AppRoutePaths {
  AppRoutePaths._();

  static String initial() => AppRoutePoints.initialRoute;

  static String bottomNavWrapper() => AppRoutePoints.bottomNavWrapperRoute;

  static String login() =>
      "${AppRoutePoints.authenticationRoute}/${AppRoutePoints.loginRoute}";

  static String register() =>
      "${AppRoutePoints.authenticationRoute}/${AppRoutePoints.registerRoute}";

  static String profile() => AppRoutePoints.profile;
}

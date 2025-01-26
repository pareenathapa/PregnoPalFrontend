import 'package:auto_route/auto_route.dart';

import '../../../../config/routes/route_paths.dart';
import '../../../../config/routes/routes.gr.dart';

final authenticationRoute = AutoRoute(
  path: AppRoutePoints.authenticationRoute,
  page: AuthenticationWrapperRoute.page,
  children: [
    AutoRoute(
      path: AppRoutePoints.loginRoute,
      page: LoginRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: ForgotPasswordScreen.page,
    ),
    AutoRoute(
      path: AppRoutePoints.registerRoute,
      page: RegisterRoute.page,
    ),
  ],
);

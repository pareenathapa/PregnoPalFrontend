import 'package:auto_route/auto_route.dart';

import '../../core/common/feature/bottom_navigation/presentation/view/bottom_navigation_route.dart';
import '../../features/appointment/presentation/route/appointment_route.dart';
import '../../features/articles/presentation/route/article_route.dart';
import '../../features/authentication/presentation/route/authentication_route.dart';
import '../../features/profile/presentation/route/profile_route.dart';
import 'route_paths.dart';
import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashScreen.page,
          path: AppRoutePoints.initialRoute,
        ),
        authenticationRoute,
        bottomNavigationRoute,
        appointmentDetailRoute,
        profileRoute,
        articleDetailPage,
        AutoRoute(
          page: NotificationScreen.page,
        ),
      ];
}

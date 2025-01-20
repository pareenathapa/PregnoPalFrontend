import 'package:auto_route/auto_route.dart';

import '../../../../../../config/routes/route_paths.dart';
import '../../../../../../config/routes/routes.gr.dart';
import '../../../../../../di/main_di.dart';
import '../../../../../utils/auth_guard.dart';

final bottomNavigationRoute = AutoRoute(
  path: AppRoutePoints.bottomNavWrapperRoute,
  page: BottomNavWrapperRoute.page,
  guards: [locator<AuthGuard>()],
  children: [
    AutoRoute(page: HomeScreen.page),
    AutoRoute(page: CalenderScreen.page),
    AutoRoute(page: AppointmentScreen.page),
    AutoRoute(page: HistoryScreen.page),
    AutoRoute(page: ArticlesScreen.page),
  ],
);

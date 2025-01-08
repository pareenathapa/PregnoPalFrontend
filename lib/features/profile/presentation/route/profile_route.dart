import 'package:auto_route/auto_route.dart';

import '../../../../config/routes/route_paths.dart';
import '../../../../config/routes/routes.gr.dart';

final profileRoute = AutoRoute(
  path: AppRoutePoints.profile,
  page: ProfileScreen.page,
);

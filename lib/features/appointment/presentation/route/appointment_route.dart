import 'package:auto_route/auto_route.dart';

import '../../../../config/routes/routes.gr.dart';
import '../view/appointment_detail_page.dart';

final appointmentDetailRoute = AutoRoute(
  page: AppointmentDetailRoute.page,
  path: '/appointment-detail',
);

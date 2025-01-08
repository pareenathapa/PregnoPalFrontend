import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/default_app_bar.dart';

@RoutePage(name: 'HomeScreen')
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
            ),
            onPressed: () {
              context.router.pushNamed('NotificationScreen');
            },
          ),
          horizontalMargin8,
        ],
      ),
      body: const Placeholder(),
    );
  }
}

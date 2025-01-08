import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/route_paths.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../di/main_di.dart';
import '../../../profile/presentation/cubit/profile_detail_cubit.dart';

@RoutePage(name: 'SplashScreen')
class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileDetailCubit, ProfileDetailState>(
      listener: (context, state) {
        log('SplashScreen: $state');
        if (state.error != null) {
          context.showSnackBar(message: state.error!.message, isError: true);
          locator<NavigationService>().replaceNamed(AppRoutePaths.login());
        }

        if (state.profileData != null) {
          locator<NavigationService>()
              .replaceNamed(AppRoutePaths.bottomNavWrapper());
        }
      },
      child: const Scaffold(
        body: Center(
          child: AppText(
            'Splash Screen',
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileDetailCubit>(
          create: (_) => locator<ProfileDetailCubit>()..onCheckLoginStatus(),
        ),
      ],
      child: this,
    );
  }
}

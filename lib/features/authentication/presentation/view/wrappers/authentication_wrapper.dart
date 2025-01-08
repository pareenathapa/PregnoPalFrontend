import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di/main_di.dart';
import '../../cubit/authentication_cubit.dart';

@RoutePage(name: "AuthenticationWrapperRoute")
class AuthenticationWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => locator<AuthenticationCubit>(),
        ),
      ],
      child: this,
    );
  }
}

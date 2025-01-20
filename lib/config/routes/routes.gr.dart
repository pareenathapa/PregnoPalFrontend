// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:pregnopal/core/common/feature/bottom_navigation/presentation/view/bottom_navigation_wrapper.dart'
    as _i6;
import 'package:pregnopal/features/appointment/presentation/view/appointment_detail_page.dart'
    as _i1;
import 'package:pregnopal/features/appointment/presentation/view/appointment_view.dart'
    as _i2;
import 'package:pregnopal/features/articles/presentation/view/articles_view.dart'
    as _i4;
import 'package:pregnopal/features/articles/presentation/view/pages/article_detail_page.dart'
    as _i3;
import 'package:pregnopal/features/authentication/presentation/view/pages/login_page.dart'
    as _i10;
import 'package:pregnopal/features/authentication/presentation/view/pages/register_page.dart'
    as _i13;
import 'package:pregnopal/features/authentication/presentation/view/wrappers/authentication_wrapper.dart'
    as _i5;
import 'package:pregnopal/features/calender/presentation/view/calender_view.dart'
    as _i7;
import 'package:pregnopal/features/history/presentation/view/history.dart'
    as _i8;
import 'package:pregnopal/features/home/presentation/view/home_view.dart'
    as _i9;
import 'package:pregnopal/features/notifications/presentation/view/notification_view.dart'
    as _i11;
import 'package:pregnopal/features/profile/presentation/view/profile_view.dart'
    as _i12;
import 'package:pregnopal/features/splash/presentation/view/splash_screen.dart'
    as _i14;

/// generated route for
/// [_i1.AppointmentDetailPage]
class AppointmentDetailRoute
    extends _i15.PageRouteInfo<AppointmentDetailRouteArgs> {
  AppointmentDetailRoute({
    _i16.Key? key,
    required String appointmentId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          AppointmentDetailRoute.name,
          args: AppointmentDetailRouteArgs(
            key: key,
            appointmentId: appointmentId,
          ),
          initialChildren: children,
        );

  static const String name = 'AppointmentDetailRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppointmentDetailRouteArgs>();
      return _i15.WrappedRoute(
          child: _i1.AppointmentDetailPage(
        key: args.key,
        appointmentId: args.appointmentId,
      ));
    },
  );
}

class AppointmentDetailRouteArgs {
  const AppointmentDetailRouteArgs({
    this.key,
    required this.appointmentId,
  });

  final _i16.Key? key;

  final String appointmentId;

  @override
  String toString() {
    return 'AppointmentDetailRouteArgs{key: $key, appointmentId: $appointmentId}';
  }
}

/// generated route for
/// [_i2.AppointmentView]
class AppointmentScreen extends _i15.PageRouteInfo<void> {
  const AppointmentScreen({List<_i15.PageRouteInfo>? children})
      : super(
          AppointmentScreen.name,
          initialChildren: children,
        );

  static const String name = 'AppointmentScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i2.AppointmentView());
    },
  );
}

/// generated route for
/// [_i3.ArticleDetailPage]
class ArticleDetailRoute extends _i15.PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    _i16.Key? key,
    required String id,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleDetailRouteArgs>();
      return _i15.WrappedRoute(
          child: _i3.ArticleDetailPage(
        key: args.key,
        id: args.id,
      ));
    },
  );
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.ArticlesView]
class ArticlesScreen extends _i15.PageRouteInfo<void> {
  const ArticlesScreen({List<_i15.PageRouteInfo>? children})
      : super(
          ArticlesScreen.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i4.ArticlesView());
    },
  );
}

/// generated route for
/// [_i5.AuthenticationWrapper]
class AuthenticationWrapperRoute extends _i15.PageRouteInfo<void> {
  const AuthenticationWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AuthenticationWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationWrapperRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i5.AuthenticationWrapper());
    },
  );
}

/// generated route for
/// [_i6.BottomNavWrapperPage]
class BottomNavWrapperRoute extends _i15.PageRouteInfo<void> {
  const BottomNavWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          BottomNavWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavWrapperRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i6.BottomNavWrapperPage());
    },
  );
}

/// generated route for
/// [_i7.CalenderView]
class CalenderScreen extends _i15.PageRouteInfo<void> {
  const CalenderScreen({List<_i15.PageRouteInfo>? children})
      : super(
          CalenderScreen.name,
          initialChildren: children,
        );

  static const String name = 'CalenderScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.CalenderView();
    },
  );
}

/// generated route for
/// [_i8.HistoryView]
class HistoryScreen extends _i15.PageRouteInfo<void> {
  const HistoryScreen({List<_i15.PageRouteInfo>? children})
      : super(
          HistoryScreen.name,
          initialChildren: children,
        );

  static const String name = 'HistoryScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i8.HistoryView());
    },
  );
}

/// generated route for
/// [_i9.HomeView]
class HomeScreen extends _i15.PageRouteInfo<void> {
  const HomeScreen({List<_i15.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i9.HomeView());
    },
  );
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return _i10.LoginPage(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.NotificationView]
class NotificationScreen extends _i15.PageRouteInfo<void> {
  const NotificationScreen({List<_i15.PageRouteInfo>? children})
      : super(
          NotificationScreen.name,
          initialChildren: children,
        );

  static const String name = 'NotificationScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.NotificationView();
    },
  );
}

/// generated route for
/// [_i12.ProfileView]
class ProfileScreen extends _i15.PageRouteInfo<void> {
  const ProfileScreen({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i12.ProfileView());
    },
  );
}

/// generated route for
/// [_i13.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i13.RegisterPage(key: args.key);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.SplashScreen]
class SplashScreen extends _i15.PageRouteInfo<void> {
  const SplashScreen({List<_i15.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i14.SplashScreen());
    },
  );
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/general/pages/splash_page/splash_screen_page.dart';
import '../utils/helper/go_router_refresh_stream.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  /// Home Page
  dashboard("/dashboard"),
  settings("/settings"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => SplashScreenPage(),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.dashboard.path,
      ),
      // GoRoute(
      //   path: Routes.login.path,
      //   name: Routes.login.name,
      //   builder: (_, __) => const LoginPage(),
      // ),
      // GoRoute(
      //   path: Routes.register.path,
      //   name: Routes.register.name,
      //   builder: (_, __) => BlocProvider(
      //     create: (_) => sl<RegisterCubit>(),
      //     child: const RegisterPage(),
      //   ),
      // ),
      // ShellRoute(
      //   builder: (_, __, child) => BlocProvider(
      //     create: (context) => sl<MainCubit>(),
      //     child: MainPage(child: child),
      //   ),
      //   routes: [
      //     GoRoute(
      //       path: Routes.dashboard.path,
      //       name: Routes.dashboard.name,
      //       builder: (_, __) => BlocProvider(
      //         create: (_) => sl<UsersCubit>()..fetchUsers(const UsersParams()),
      //         child: const DashboardPage(),
      //       ),
      //     ),
      //     GoRoute(
      //       path: Routes.settings.path,
      //       name: Routes.settings.name,
      //       builder: (_, __) => const SettingsPage(),
      //     ),
      //   ],
      // ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    // refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path;


      // if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
      //     false)) {
      //   return isLoginPage ? null : Routes.login.path;
      // }
      //
      //
      // if (isLoginPage &&
      //     ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
      //         false)) {
      //   return Routes.root.path;
      // }

      /// No direct
      return null;
    },
  );
}

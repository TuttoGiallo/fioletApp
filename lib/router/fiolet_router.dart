import 'package:fiolet/feature/home/home_cubit.dart';
import 'package:fiolet/feature/splash/splash_cubit.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_router.dart';

class FioletRouter extends BaseRouter {
  FioletRouter(GlobalKey<NavigatorState> navigatorKey) : super(navigatorKey);

  @override
  Route buildRoute(RouteSettings settings, Widget child) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }

  @override
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FioletRoutes.splash:
        return buildRoute(
          settings,
           BlocProvider(
             create: (_) =>
                 SplashCubit(),
             child: SplashScreen(),
           ),
        );
      case FioletRoutes.home:
        return buildRoute(
          settings,
              BlocProvider(
                create: (_) => HomeCubit(),
                child: HomeScreen(),
              ),
        );
      default:
        throw PlatformException(code: '404 - Route not found');
    }
  }
}

import 'package:fiolet/feature/home/home_cubit.dart';
import 'package:fiolet/feature/player/player_cubit.dart';
import 'package:fiolet/feature/players/players_cubit.dart';
import 'package:fiolet/feature/splash/splash_cubit.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/stub_objects.dart';
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
            create: (_) => SplashCubit(),
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
      case FioletRoutes.player:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => PlayerCubit(StubObjects.stubPlayerState2021),
                child: PlayerScreen()));
      case FioletRoutes.players:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => PlayersCubit(),
                child: PlayersScreen()));

      default:
        throw PlatformException(code: '404 - Route not found');
    }
  }
}

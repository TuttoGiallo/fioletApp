import 'package:fiolet/feature/home/home_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/feature/player/player_cubit.dart';
import 'package:fiolet/feature/players/players_cubit.dart';
import 'package:fiolet/feature/splash/splash_cubit.dart';
import 'package:fiolet/feature/team/team_cubit.dart';
import 'package:fiolet/feature/teams/teams_cubit.dart';
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
                create: (_) => PlayerCubit(settings.arguments as PlayerInSeason),
                child: PlayerScreen()));
      case FioletRoutes.players:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => PlayersCubit(),
                child: PlayersScreen()));
      case FioletRoutes.team:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => TeamCubit(settings.arguments as Team),
                child: TeamScreen()));
      case FioletRoutes.teams:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => TeamsCubit(),
                child: TeamsScreen()));

      default:
        throw PlatformException(code: '404 - Route not found');
    }
  }
}

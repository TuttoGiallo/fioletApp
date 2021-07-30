import 'package:fiolet/feature/model/match.dart';
import 'package:fiolet/feature/pages/home/home_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/feature/pages/match/match_cubit.dart';
import 'package:fiolet/feature/pages/matches/matches_cubit.dart';
import 'package:fiolet/feature/pages/player/player_cubit.dart';
import 'package:fiolet/feature/pages/players/players_cubit.dart';
import 'package:fiolet/feature/pages/splash/splash_cubit.dart';
import 'package:fiolet/feature/pages/team/team_cubit.dart';
import 'package:fiolet/feature/pages/teams/teams_cubit.dart';
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
      case FioletRoutes.match:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => MatchCubit(settings.arguments as Match),
                child: MatchScreen()));
      case FioletRoutes.matches:
        return buildRoute(
            settings,
            BlocProvider(
                create: (_) => MatchesCubit(),
                child: MatchesScreen()));

      default:
        throw PlatformException(code: '404 - Route not found');
    }
  }
}

import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/graphic_app_components/widget/player_in_season_cart.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_screen.dart';
part 'team_state.dart';

class TeamCubit extends BaseCubit<TeamState> {
  TeamCubit(Team initialTeam) : super(TeamState(initialTeam));

  navigateToPlayer(PlayerInSeason player) {
    router.pushNamed(FioletRoutes.player, player);
  }
}

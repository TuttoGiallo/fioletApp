import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/graphic_app_components/widget/season_drop_down.dart';
import 'package:fiolet/graphic_app_components/widget/team_card.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/player_service.dart';
import 'package:fiolet/utils/stub_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_screen.dart';
part 'player_state.dart';

class PlayerCubit extends BaseCubit<PlayerState> {
  PlayerCubit(PlayerInSeason player) : super(PlayerState(player));

  PlayerService _playerService = injector.get<PlayerService>();

  Season get currentSeason => state.playerInSeason.currentSeason;

  void changeSeason(Season? newSeason) {
    emit(PlayerState(_playerService.getPlayerInSeason(state.playerInSeason.player, newSeason!)));
  }

  navigateToTeam(Team team) {
    router.pushNamed(FioletRoutes.team, team);
  }

}
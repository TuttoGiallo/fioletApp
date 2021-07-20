import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/graphic_app_components/widget/player_in_season_cart.dart';
import 'package:fiolet/graphic_app_components/widget/season_drop_down.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/player_service.dart';
import 'package:fiolet/utils/stub_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'players_screen.dart';

part 'players_state.dart';

class PlayersCubit extends BaseCubit<PlayersState> {
  PlayersCubit()
      : super(PlayersState(
            injector
                .get<PlayerService>()
                .getAllPlayerInASeason(StubObjects.season2021sp),
            StubObjects.season2021sp));

  final PlayerService playerService = injector.get<PlayerService>();

  void changeSeason(Season? newSeason) {
    emit(PlayersState(playerService.getAllPlayerInASeason(newSeason!), newSeason));
  }

  navigateToPlayer(PlayerInSeason player) {
    router.pushNamed(FioletRoutes.player, player);
  }
}

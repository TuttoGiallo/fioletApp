import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/utils/stub_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'players_screen.dart';

part 'players_state.dart';

class PlayersCubit extends BaseCubit<PlayersState> {
  PlayersCubit() : super(PlayersState(_filterPlayersForSeason(StubObjects.season2021sp), StubObjects.season2021sp));

  void changeSeason(Season? newSeason) {
    emit(PlayersState(_filterPlayersForSeason(newSeason!), newSeason));
  }

  static List<Player> _filterPlayersForSeason(Season season){
    return StubObjects.allStubPlayers.where((player) => player.currentSeason == season).toList();
  }

}

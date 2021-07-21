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
      : super(PlayersState.initial(
            injector
                .get<PlayerService>()
                .getAllPlayerInASeason(StubObjects.season2021sp),
            StubObjects.season2021sp)) {
    _initializeFilterMap();
  }

  final PlayerService playerService = injector.get<PlayerService>();
  Map<FilterType, FilteringPlayersFunction> _functionsFilter = {};

  void _initializeFilterMap() {
    _functionsFilter.addAll({
      FilterType.season: seasonFilterFunction,
      FilterType.minAverage: minAverageFilterFunction,
    });
  }

  void _filterAndEmitNewState(
      {Season? season,
      double? filterMinAverage,
      Set<FilterType> forceTrueEnable = const {},
      Set<FilterType> forceFalseEnable = const {}}) {
    Set<FilterType> enabledFilter = state.enableFilterSet
      ..addAll(forceTrueEnable)
      ..removeAll(forceFalseEnable);

    PlayersState newPlayersState = PlayersState(
      season ?? state.season,
      enabledFilter,
      filterMinAverage: filterMinAverage ?? state.filterMinAverage,
    );

    print('filter');

    newPlayersState.filteredPlayers =
        playerService.allPlayersInAllSeason.where((playerInSeason) {
      for (FilterType filterType in _functionsFilter.keys) {
        if (newPlayersState.filterEnable[filterType]! &&
            !_functionsFilter[filterType]!(playerInSeason, newPlayersState)) {
          return false;
        }
      }
      return true;
    }).toList();
    emit(newPlayersState);
  }

  navigateToPlayer(PlayerInSeason player) {
    router.pushNamed(FioletRoutes.player, player);
  }

  //season filter
  static FilteringPlayersFunction seasonFilterFunction =
      (playerInSeason, playersState) =>
          playerInSeason.currentSeason == playersState.season;

  void changeFilterSeason(Season? newSeason) {
    _filterAndEmitNewState(season: newSeason);
  }

  //minAverage filter
  static FilteringPlayersFunction minAverageFilterFunction =
      (playerInSeason, playersState) =>
          playerInSeason.average > playersState.filterMinAverage!;

  void subscribeMinAverageFilter(bool subscribeUnsubscribe) {
    subscribeUnsubscribe
        ? _filterAndEmitNewState(forceTrueEnable: {FilterType.minAverage})
        : _filterAndEmitNewState(forceFalseEnable: {FilterType.minAverage});
  }

  void changeFilterMinAverage(String minAverage) {
    _filterAndEmitNewState(filterMinAverage: double.tryParse(minAverage));
  }
}

typedef bool FilteringPlayersFunction(
    PlayerInSeason playerInSeason, PlayersState playersState);

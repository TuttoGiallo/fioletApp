part of 'players_cubit.dart';

class PlayersState extends BaseState {
  @override
  List<Object?> get props => [filteredPlayers, minAverageEnable, maxAverageEnable, nameSurnameEnable];

  late final List<PlayerInSeason> filteredPlayers;
  late final Map<FilterType, bool> filterEnable;

  Set<FilterType> get enableFilterSet =>
      filterEnable.keys.where((type) => filterEnable[type]!).toSet();

  final Season season;

  //filter name and surname
  final String filterNameSurname;

  set nameSurnameEnable(bool enable) =>
      this.filterEnable[FilterType.nameSurname] = enable;

  bool get nameSurnameEnable => this.filterEnable[FilterType.nameSurname]!;

  //filter min average
  final double? filterMinAverage;

  set minAverageEnable(bool enable) =>
      this.filterEnable[FilterType.minAverage] = enable;

  bool get minAverageEnable => this.filterEnable[FilterType.minAverage]!;

  //filter max average
  final double? filterMaxAverage;

  set maxAverageEnable(bool enable) =>
      this.filterEnable[FilterType.maxAverage] = enable;

  bool get maxAverageEnable => this.filterEnable[FilterType.maxAverage]!;


  PlayersState(this.season, Set<FilterType> enableFilter,
      {this.filterNameSurname = '',
      this.filterMinAverage = 0,
      this.filterMaxAverage = 0}) {
    _buildInitState(enableFilter);
  }

  PlayersState.initial(this.filteredPlayers, this.season,
      {this.filterNameSurname = '',
      this.filterMinAverage = 0,
      this.filterMaxAverage = 0}) {
    _buildInitState({});
  }

  void _buildInitState(Set<FilterType> enableFilter) {
    filterEnable = {};
    for (var type in FilterType.values) {
      filterEnable[type] = enableFilter.contains(type);
    }
    filterEnable[FilterType.season] = true;
  }
}


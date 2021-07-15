part of 'players_cubit.dart';

class PlayersState extends BaseState {
  @override
  List<Object?> get props =>
      [season, filterNameSurname, filterMaxAverage, filterMinAverage];

  final List<Player> filteredPlayers;
  final Season season;
  final String filterNameSurname;
  final double? filterMinAverage;
  final double? filterMaxAverage;

  PlayersState(this.filteredPlayers, this.season,
      {this.filterNameSurname = '',
        this.filterMinAverage = 0,
        this.filterMaxAverage = 0}) {
  }

}

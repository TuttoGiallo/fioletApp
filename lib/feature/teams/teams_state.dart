part of 'teams_cubit.dart';


class TeamsState extends BaseState {
  @override
  List<Object?> get props =>
      [season, filterNameSurname, filterMaxAverage, filterMinAverage];

  final List<Team> filteredTeams;
  final Season season;
  final String filterNameSurname;
  final double? filterMinAverage;
  final double? filterMaxAverage;

  TeamsState(this.filteredTeams, this.season,
      {this.filterNameSurname = '',
        this.filterMinAverage = 0,
        this.filterMaxAverage = 0});

}

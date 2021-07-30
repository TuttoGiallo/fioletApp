part of 'matches_cubit.dart';

class MatchesState extends BaseState {
  @override
  List<Object?> get props =>
      [season];

  final List<Match> filteredMatches;
  final Season season;

  MatchesState(this.filteredMatches, this.season);

}

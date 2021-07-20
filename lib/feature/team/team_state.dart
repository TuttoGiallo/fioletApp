part of 'team_cubit.dart';

class TeamState extends BaseState {
  final Team team;

  TeamState(this.team);

  @override
  List<Object?> get props => [team.players];
}

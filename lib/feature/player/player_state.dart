part of 'player_cubit.dart';

class PlayerState  extends BaseState{
  @override
  List<Object?> get props => [playerInSeason.name, playerInSeason.surname, playerInSeason.currentSeason];

  final PlayerInSeason playerInSeason;

  PlayerState(this.playerInSeason);
}


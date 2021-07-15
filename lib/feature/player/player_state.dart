part of 'player_cubit.dart';

class PlayerState  extends BaseState{
  @override
  List<Object?> get props => [player.name, player.surname, player.currentSeason];

  Player player;

  PlayerState(this.player);
}


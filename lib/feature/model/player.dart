import 'package:fiolet/feature/model/season.dart';

class Player extends PlayerBase {
  Player(
      String name, String surname, this.team, this.average, this.currentSeason)
      : super(name, surname);

  String team;
  double average;
  Season currentSeason;
}

class PlayerBase {
  @override
  List<Object?> get props => [name, surname];

  final String name;
  final String surname;

  PlayerBase(this.name, this.surname);
}

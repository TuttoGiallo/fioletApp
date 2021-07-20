import 'package:fiolet/feature/model/season.dart';

class PlayerInSeason {
  PlayerInSeason(
      this.player, this.team, this._average, this.currentSeason);

  Player player;
  String team;
  double _average;
  Season currentSeason;

  double get average => _average < 3 ? 3 : double.parse(_average.toStringAsFixed(2));
  set average(double average) => _average = average;

  String get name => this.player.name;
  String get surname => this.player.surname;
}

class Player {

  final String name;
  final String surname;

  Player(this.name, this.surname);
}

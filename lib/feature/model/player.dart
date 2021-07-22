import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/team.dart';

class PlayerInSeason {
  PlayerInSeason(
      this.player, this._average, this.currentSeason);

  Player player;
  double _average;
  Season currentSeason;
  late Team _team;

  double get average => _average < 3 ? 3 : double.parse(_average.toStringAsFixed(2));
  set average(double average) => _average = average;

  String get name => this.player.name;
  String get surname => this.player.surname;

  set team(Team team) => this._team = team;
  Team get team => this._team;
}

class Player {

  final String name;
  final String surname;

  Player(this.name, this.surname);
}

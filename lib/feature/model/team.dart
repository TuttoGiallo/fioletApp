import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/section.dart';

class Team {
  late List<PlayerInSeason> players;

  String name;
  Season season;
  Section section;
  late double subscriptionAverage;

  Team(this.name, this.season, this.section) {
    players = [];
  }

  void addPlayer(PlayerInSeason player) {
    this.players.add(player);
    player.team = this;
  }

  void addPlayers(List<PlayerInSeason> players) {
    this.players.addAll(players);
    players.forEach((player) => player.team = this);
  }
}

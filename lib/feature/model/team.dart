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

  Team.withPlayer(this.name, this.players, this.season, this.section);

  void addPlayer(PlayerInSeason player) {
    this.players.add(player);
  }

  void addPlayers(List<PlayerInSeason> players) {
    this.players.addAll(players);
  }
}

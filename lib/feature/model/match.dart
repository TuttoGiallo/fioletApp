import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/team.dart';

class Match {
  Team homeTeam;
  Team foreignTeam;
  Season season;
  DateTime data;
  late Map<PlayerInSeason, List<int?>> points;

  Match(this.homeTeam, this.foreignTeam, this.season, this.data) {
    _checkTeamsSeason();
    _initMatch();
  }

  void _initMatch() {
    points = {};
    homeTeam.players.forEach((player) => _initPlayerPoints(player));
    foreignTeam.players.forEach((player) => _initPlayerPoints(player));
  }

  void _initPlayerPoints(PlayerInSeason player) {
    points[player] = [];
  }

  void _checkTeamsSeason() {
    if (season != homeTeam.season || season != foreignTeam.season)
      throw new Exception('The Match teams must have the same season of match '
          ' homeTeam.season = ${homeTeam.season}, foreignTeam = ${foreignTeam.season},'
          ' seasonMatch = ${season}');
  }
}

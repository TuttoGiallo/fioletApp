import 'dart:math';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/section.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/feature/model/match.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/player_service.dart';

class StubObjects {
  static Season season2019au = Season(2019, 'autumn');
  static Season season2020sp = Season(2020, 'spring');
  static Season season2020au = Season(2020, 'autumn');
  static Season season2021sp = Season(2021, 'spring');

  static List<Season> stubSeasons = [
    season2019au,
    season2020sp,
    season2020au,
    season2021sp
  ];

  static List<Player> _generatePlayerStub({int number = 12}) {
    List<Player> players = [];
    for (int i = 0; i < number; i++) {
      players.add(Player('StubPlayerName#$i', 'StubPlayerSurname#$i'));
    }
    return players;
  }

  static List<Player> allStubPlayers = _generatePlayerStub();

  static List<PlayerInSeason> _generatePlayersInSeasonStub() {
    List<PlayerInSeason> playersInS = [];
    for (Season season in stubSeasons) {
      for (Player player in allStubPlayers) {
        playersInS
            .add(PlayerInSeason(player, Random().nextDouble() * 11, season));
      }
    }
    return playersInS;
  }

  static List<PlayerInSeason> allStubPlayersInSeason =
      _generatePlayersInSeasonStub();

  static List<Team> allStubTeams = _generateTeams();

  static List<Team> _generateTeams() {
    PlayerService playerService = injector.get<PlayerService>();

    int numberOfTeam = (allStubPlayers.length / 6).truncate();
    List<Team> genTeams = [];
    for (Season season in stubSeasons) {
      for (int i = 0; i < numberOfTeam; i++) {
        List<Player> subPlayer = allStubPlayers.sublist(i * 6, (i + 1) * 6);
        genTeams.add(Team('team$i', season, Section('section$i'))
          ..addPlayers(
            subPlayer
                .map(
                    (player) => playerService.getPlayerInSeason(player, season))
                .toList(),
          ));
      }
    }
    return genTeams;
  }

  static List<Match> allStubMatches = _generateMatch();

  static List<Match> _generateMatch() {
    
    allStubTeams.forEach((team) {print('${team.name}, ${team.season}');});
    
    print('${allStubTeams
        .where((team) => team.season == season2021sp)
        .elementAt(0).name}');
    print('${allStubTeams
        .where((team) => team.season == season2021sp)
        .elementAt(1).name}');

    return [
      Match(
          allStubTeams
              .where((team) => team.season == season2021sp)
              .elementAt(0),
          allStubTeams
              .where((team) => team.season == season2021sp)
              .elementAt(1),
          season2021sp, DateTime.utc(2021, 05, 9)),
      Match(
          allStubTeams
              .where((team) => team.season == season2021sp)
              .elementAt(1),
          allStubTeams
              .where((team) => team.season == season2021sp)
              .elementAt(0),
          season2021sp, DateTime.utc(2021, 06, 21)),
    ];
  }
}

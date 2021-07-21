import 'dart:math';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/section.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/player_service.dart';

class StubObjects {
  static Season season2019au = Season(2019, 'autumn');
  static Season season2020sp = Season(2020, 'spring');
  static Season season2020au = Season(2020, 'autumn');
  static Season season2021sp = Season(2021, 'spring');

  static List<Season> stubSeasons = [season2019au, season2020sp, season2020au, season2021sp];

  static List<Player> generatePlayerStub({int number = 216}) {
    List<Player> players = [];
    for (int i = 0; i < number; i++) {
      players.add(Player('StubPlayerName#$i', 'StubPlayerSurname#$i'));
    }
    return players;
  }

  static List<Player> allStubPlayers = generatePlayerStub();

  static List<PlayerInSeason> generatePlayersInSeasonStub() {
    List<PlayerInSeason> playersInS = [];
    for (Season season in stubSeasons) {
      for (Player player in allStubPlayers) {
        playersInS.add(PlayerInSeason(
            player, 'teamName', Random().nextDouble() * 11, season));
      }
    }
    return playersInS;
  }

  static List<PlayerInSeason> allStubPlayersInSeason =
      generatePlayersInSeasonStub();

  static List<Team> allStubTeams = generateTeams();

  static List<Team> generateTeams() {
    PlayerService playerService = injector.get<PlayerService>();

    int numberOfTeam = (allStubPlayers.length / 6).truncate();
    List<Team> genTeams = [];
    for (Season season in stubSeasons) {
      for (int i = 0; i < numberOfTeam; i++) {
        List<Player> subPlayer = allStubPlayers.sublist(i * 6, (i + 1) * 6);
        genTeams.add(Team.withPlayer(
            'team$i',
            subPlayer
                .map(
                    (player) => playerService.getPlayerInSeason(player, season))
                .toList(),
            season,
            Section('section$i')));
      }
    }
    return genTeams;
  }
}

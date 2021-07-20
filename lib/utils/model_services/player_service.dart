import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/utils/stub_objects.dart';

class PlayerService{
  Map<Player, Map<Season, PlayerInSeason>> playersMap = {};

  PlayerService._();

  static PlayerService createForGetItRegistration() {
    return PlayerService._();
  }

  Future<void> loadRes() async {
    //intMap
    StubObjects.allStubPlayers.forEach((player) {
      playersMap[player] = {};
    });

    for (Season season in StubObjects.stubSeasons) {
      for (PlayerInSeason playerInSeason
          in StubObjects.allStubPlayersInSeason) {
        if (playerInSeason.currentSeason == season) {
          playersMap[playerInSeason.player]![season] = playerInSeason;
        }
      }
    }
  }

  List<Player> get allPlayer => playersMap.keys.toList();

  List<PlayerInSeason> get allPlayersInAllSeason {
    List<PlayerInSeason> playersInSeason = [];
    for (var mapSeasonPlayer in playersMap.values) {
      playersInSeason.addAll(mapSeasonPlayer.values);
    }
    return playersInSeason;
  }

  List<PlayerInSeason> getAllPlayerInASeason(Season season) {
    return allPlayersInAllSeason
        .where((player) => player.currentSeason == season)
        .toList();
  }

  PlayerInSeason getPlayerInSeason(Player player, Season season) {
    return playersMap[player]![season]!;
  }
}

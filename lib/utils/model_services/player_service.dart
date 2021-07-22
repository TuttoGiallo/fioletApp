import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/utils/stub_objects.dart';

class PlayerService {
  Map<Player, Map<Season, PlayerInSeason>> playersMap = {};
  Map<Season, List<PlayerInSeason>> seasonPlayersMap = {};
  List<PlayerInSeason> allPlayersInAllSeason = [];

  PlayerService._();

  static PlayerService createForGetItRegistration() {
    return PlayerService._();
  }

  Future<void> loadRes() async {
    //int Maps and List
    StubObjects.allStubPlayers.forEach((player) {
      playersMap[player] = {};
    });

    StubObjects.stubSeasons.forEach((season) => seasonPlayersMap[season] = []);

    for (Season season in StubObjects.stubSeasons) {
      for (PlayerInSeason playerInSeason
          in StubObjects.allStubPlayersInSeason) {
        if (playerInSeason.currentSeason == season) {
          allPlayersInAllSeason.add(playerInSeason);
          playersMap[playerInSeason.player]![season] = playerInSeason;
          seasonPlayersMap[season]!.add(playerInSeason);
        }
      }
    }
  }

  List<Player> get allPlayer => playersMap.keys.toList();

  List<PlayerInSeason> getAllPlayerInASeason(Season season) {
    return seasonPlayersMap[season]!;
  }

  PlayerInSeason getPlayerInSeason(Player player, Season season) {
    return playersMap[player]![season]!;
  }
}

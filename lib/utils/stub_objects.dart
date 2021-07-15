import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/player/player_cubit.dart';

class StubObjects {


  static Season season2020au = Season(2020, 'autumn');
  static Season season2021sp = Season(2021, 'spring');

  static List<Season> stubSeasons =
  [season2020au, season2021sp];

  static PlayerState get stubPlayerState2021 =>
      PlayerState(stubPlayer2021);
  static PlayerState get stubPlayerState2020 =>
      PlayerState(stubPlayer2020);

  static Player stubPlayer2020 = Player('Stub', 'Player', 'stubNameTeamA', 10, stubSeasons[0]);
  static Player stubPlayer2021 = Player('Stub', 'Player', 'stubNameTeamB', 9, stubSeasons[1]);
  static Player stubPlayerA2020 = Player('StubA', 'PlayerA', 'stubNameTeamA', 6, stubSeasons[0]);
  static Player stubPlayerA2021 = Player('StubA', 'PlayerA', 'stubNameTeamB', 4, stubSeasons[1]);

  static List<Player> allStubPlayers = [stubPlayer2020, stubPlayer2021, stubPlayerA2020, stubPlayerA2021];

}

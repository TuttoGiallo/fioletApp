import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/utils/stub_objects.dart';

class TeamService {
  TeamService._();

  List<Team> allTeams = [];

  static TeamService createForGetItRegistration() {
    return TeamService._();
  }

  Future<void> loadRes() async {
    allTeams = StubObjects.allStubTeams;
  }

  List<Team> getAllTeamInASeason(Season season) {
    return allTeams.where((team) => team.season == season).toList();
  }
}

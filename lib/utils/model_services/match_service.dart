import 'package:fiolet/feature/model/match.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/utils/stub_objects.dart';


class MatchService{
  MatchService._();

  List<Match> matches = [];

  static MatchService createForGetItRegistration() {
    return MatchService._();
  }

  Future<void> loadRes() async {
    this.matches = StubObjects.allStubMatches;
  }

  List<Match> getAllMatchesInASeason(Season season) {
    return matches.where((match) => match.season == season).toList();
  }
}
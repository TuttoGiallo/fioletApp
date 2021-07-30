import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/match.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/graphic_app_components/widget/match_card.dart';
import 'package:fiolet/graphic_app_components/widget/season_drop_down.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/match_service.dart';
import 'package:fiolet/utils/stub_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'matches_screen.dart';

part 'matches_state.dart';

class MatchesCubit extends BaseCubit<MatchesState> {
  MatchesCubit()
      : super(MatchesState(
            injector
                .get<MatchService>()
                .getAllMatchesInASeason(StubObjects.season2021sp),
            StubObjects.season2021sp));

 final MatchService matchService = injector.get<MatchService>();

 void changeSeason(Season? newSeason) {
   emit(MatchesState(matchService.getAllMatchesInASeason(newSeason!), newSeason));
 }

 navigateToMatch(Match match) {
   router.pushNamed(FioletRoutes.match, match);
 }
}

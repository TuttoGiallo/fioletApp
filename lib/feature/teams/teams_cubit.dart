import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/season.dart';
import 'package:fiolet/feature/model/team.dart';
import 'package:fiolet/graphic_app_components/widget/season_drop_down.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:fiolet/utils/model_services/team_service.dart';
import 'package:fiolet/utils/stub_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teams_screen.dart';
part 'teams_state.dart';

class TeamsCubit extends BaseCubit<TeamsState> {
  TeamsCubit()
      : super(TeamsState(
      injector
          .get<TeamService>()
          .getAllTeamInASeason(StubObjects.season2021sp),
      StubObjects.season2021sp));

  final TeamService teamService = injector.get<TeamService>();

  void changeSeason(Season? newSeason) {
    emit(TeamsState(teamService.getAllTeamInASeason(newSeason!), newSeason));
  }

  navigateToPlayer(Team team) {
    router.pushNamed(FioletRoutes.team, team);
  }
}




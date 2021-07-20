import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart' as di;
import 'package:fiolet/utils/model_services/player_service.dart';
import 'package:fiolet/utils/model_services/team_service.dart';
import 'package:fiolet/utils/mok_services/mok_db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen.dart';

class SplashCubit extends BaseCubit {
  SplashCubit() : super(EmptyState());

  Future<void> onInit() async {

    MokService mokService = di.injector.get<MokService>();
    await mokService.loadRes();

    PlayerService playerService = di.injector.get<PlayerService>();
    await playerService.loadRes();

    TeamService teamService = di.injector.get<TeamService>();
    await teamService.loadRes();

    router.pushAndReplaceNamed(FioletRoutes.home);
  }
}

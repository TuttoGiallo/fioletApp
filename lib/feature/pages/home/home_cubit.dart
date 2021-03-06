import 'dart:math';

import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_screen.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState('First State'));

  changeRandomlyTitle() async {
    showLoader();
    await Future.delayed(Duration(seconds: 2));
    int rand = Random.secure().nextInt(1000);
    hideLoader();
    emit(HomeState('RandomTitle $rand'));
  }

  navigateToPlayers() { router.pushNamed(FioletRoutes.players); }
  navigateToTeams() { router.pushNamed(FioletRoutes.teams); }
  navigateToMatches() { router.pushNamed(FioletRoutes.matches); }

}

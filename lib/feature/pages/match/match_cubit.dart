import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/feature/model/match.dart';
import 'package:fiolet/feature/model/player.dart';
import 'package:fiolet/graphic_app_components/widget/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

part 'match_screen.dart';
part 'match_state.dart';

class MatchCubit extends BaseCubit<MatchState> {
  MatchCubit(this.match) : super(MatchState());

  final Match match;
}

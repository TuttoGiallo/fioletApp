import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';
part 'home_screen.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState());
}

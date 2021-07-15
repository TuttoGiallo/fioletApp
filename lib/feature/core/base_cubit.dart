import 'package:equatable/equatable.dart';
import 'package:fiolet/graphic_app_components/resources/app_colors_palette.dart';
import 'package:fiolet/router/base_router.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

part 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  final BaseRouter router = injector.get<BaseRouter>();

  BaseCubit(S initialState) : super(initialState);

  void showLoader() {
    router.pushLoader(
      Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )
      ),
      barrierColor: AppColorsPalette.main.clearer.withOpacity(0.8),
    );
  }

  void hideLoader() {
    router.popLoader();
  }

  Future<T?> showAlert<T extends Object>(Widget child) async {
    hideLoader();
    return await router.pushOverlay<T>(
      child,
      barrierColor: AppColorsPalette.main.clearer.withOpacity(0.3),
    );
  }
}

import 'package:fiolet/feature/core/base_cubit.dart';
import 'package:fiolet/router/fiolet_routes.dart';
import 'package:fiolet/utils/get_it_injector.dart' as di;
import 'package:fiolet/utils/mok_services/mok_db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen.dart';

class SplashCubit extends BaseCubit {
  SplashCubit() : super(EmptyState());

  Future<void> onInit() async {

    MokService mokService = di.injector.get<MokService>();
    await mokService.loadRes();

    Future.delayed(Duration(seconds: 1));

    router.pushAndReplaceNamed(FioletRoutes.home);
  }
}

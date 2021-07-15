
import 'package:fiolet/graphic_app_components/resources/fiolet_theme_data.dart';
import 'package:fiolet/router/base_router.dart';
import 'package:fiolet/utils/dependency_injection.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:flutter/material.dart';

void main() {
  createAndRegisterInjectedServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BaseRouter router = injector.get<BaseRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FioletThemeData.fioletThemeDataDark(),
      onGenerateRoute: router.onGenerateRoute,
      navigatorKey: router.navigatorKey,
    );
  }
}
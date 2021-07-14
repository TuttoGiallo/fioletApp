import 'package:fiolet/router/base_router.dart';
import 'package:fiolet/router/fiolet_router.dart';
import 'package:fiolet/utils/dependency_injection.dart';
import 'package:fiolet/utils/get_it_injector.dart';
import 'package:flutter/material.dart';

void main() {
  createAndRegisterInjectedServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BaseRouter router = injector.get<BaseRouter>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      onGenerateRoute: router.onGenerateRoute,
      navigatorKey: router.navigatorKey,
    );
  }
}
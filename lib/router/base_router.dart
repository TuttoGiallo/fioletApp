import 'package:flutter/material.dart';

abstract class BaseRouter {
  @protected
  bool isLoaderShown = false;

  final GlobalKey<NavigatorState> navigatorKey;

  BaseRouter(this.navigatorKey);

  Route onGenerateRoute(RouteSettings setting);

  Route buildRoute(RouteSettings settings, Widget child);

  Future<T?> pushOverlay<T extends Object>(
      Widget child, {
        bool barrierDismissible = false,
        Color? barrierColor,
      }) async {
    return await showDialog<T>(
      context: navigatorKey.currentState!.overlay!.context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (context) => child,
    );
  }

  void pushLoader(Widget child, {Color? barrierColor}) {
    if (!isLoaderShown) {
      isLoaderShown = true;
      pushOverlay(
        WillPopScope(
          onWillPop: () async => false,
          child: child,
        ),
        barrierColor: barrierColor,
      );
    }
  }

  void popLoader() {
    if (isLoaderShown) {
      isLoaderShown = false;
      navigatorKey.currentState!.pop();
    }
  }

  Future<T?> pushNamed<T>(String route, [Object? arguments]) async {
    return await navigatorKey.currentState!
        .pushNamed(route, arguments: arguments);
  }

  void pop<T extends Object>([T? result]) {
    return navigatorKey.currentState!.pop<T>(result);
  }

  Future<T?> pushAndReplaceNamed<T, TO>(String route,
      [Object? arguments]) async {
    return await navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  Future<T?> pushNamedAndReplaceUntil<T, TO>(
      String route, bool Function(Route<dynamic>) predicate,
      [Object? arguments]) async {
    return await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(route, predicate, arguments: arguments);
  }

  void popUntil(String destination) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == destination);
  }

  Future<T?> popAndPushNamed<T, TO>(String route, [Object? arguments]) async {
    return await navigatorKey.currentState!
        .popAndPushNamed(route, arguments: arguments);
  }
}

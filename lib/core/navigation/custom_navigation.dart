import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_map/features/google_map/presentation/screens/google_map_screen.dart';

import 'routes.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.bounceInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    PageRouteBuilder<dynamic> pageRoute(Widget widget) => PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
    switch (settings.name) {
      //TODO replace SizedBox with splash
      case Routes.googleMap:
        return pageRoute(GoogleMapScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static Future<dynamic> push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    log('Route=====>$routeName');
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}

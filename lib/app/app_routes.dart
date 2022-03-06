import 'package:flutter/material.dart';
import 'package:gym_team/routes/home/home_route.dart';
import 'package:gym_team/routes/menu/menu_route.dart';

class AppRoutes {
  static final _namedRoutes = <String, RouteFactory>{
    HomeRoute.name: (RouteSettings settings) => HomeRoute(settings: settings),
    MenuRoute.name: (RouteSettings settings) => MenuRoute(settings: settings),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (_namedRoutes.containsKey(settings.name)) {
      return _namedRoutes[settings.name]!(settings);
    }
  }
}

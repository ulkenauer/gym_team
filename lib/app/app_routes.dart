import 'package:flutter/material.dart';
import 'package:gym_team/presentation/routes/hello/hello_route.dart';
import 'package:gym_team/presentation/routes/home/home_route.dart';
import 'package:gym_team/presentation/routes/train_programs/train_programs_route.dart';

class AppRoutes {
  static final _namedRoutes = <String, RouteFactory>{
    HomeRoute.name: (RouteSettings settings) => HomeRoute(settings: settings),
    TrainProgramsRoute.name: (RouteSettings settings) => TrainProgramsRoute(settings: settings),
    HelloRoute.name: (RouteSettings settings) => HelloRoute(settings: settings),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (_namedRoutes.containsKey(settings.name)) {
      return _namedRoutes[settings.name]!(settings);
    }
  }
}

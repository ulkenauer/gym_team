import 'package:flutter/material.dart';
import 'package:gym_team/presentation/screens/home/home_screen.dart';

class HomeRoute extends MaterialPageRoute {
  static const name = 'home';

  HomeRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return const HomeScreen();
          },
        );
}

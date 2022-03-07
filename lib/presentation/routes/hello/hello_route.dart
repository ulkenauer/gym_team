import 'package:flutter/material.dart';
import 'package:gym_team/presentation/screens/hello/hello_screen.dart';

class HelloRoute extends MaterialPageRoute {
  static const name = 'hello';

  HelloRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return const HelloScreen();
          },
        );
}

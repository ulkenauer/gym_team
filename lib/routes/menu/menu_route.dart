import 'package:flutter/material.dart';
import 'package:gym_team/routes/menu/menu_screen.dart';

class MenuRoute extends MaterialPageRoute {
  static const name = 'menu';

  MenuRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return const MenuScreen();
          },
        );
}

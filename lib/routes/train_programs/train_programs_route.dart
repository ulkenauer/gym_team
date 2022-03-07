import 'package:flutter/material.dart';
import 'package:gym_team/routes/train_programs/train_programs_screen.dart';

class TrainProgramsRoute extends MaterialPageRoute {
  static const name = 'train_programs';

  TrainProgramsRoute({
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
          builder: (context) {
            return const TrainProgramsScreen();
          },
        );
}

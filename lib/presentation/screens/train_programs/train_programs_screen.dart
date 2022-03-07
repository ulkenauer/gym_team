import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_service_locator.dart';

import './cupertino_train_programs_screen.dart';
import './material_train_programs_screen.dart';

class TrainProgramsScreen extends StatelessWidget {
  const TrainProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppServiceLocator.current.appConfig.isIOS) {
      return CupertinoTrainProgramsScreen();
    }
    return MaterialTrainProgramsScreen();
  }
}

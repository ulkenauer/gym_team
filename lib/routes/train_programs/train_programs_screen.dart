import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_config.dart';
import 'package:gym_team/routes/train_programs/cupertino_train_programs_screen.dart';
import 'package:gym_team/routes/train_programs/material_train_programs_screen.dart';

class TrainProgramsScreen extends StatelessWidget {
  const TrainProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppConfig.instnace.isIOS) {
      return CupertinoTrainProgramsScreen();
    }
    return MaterialTrainProgramsScreen();
  }
}

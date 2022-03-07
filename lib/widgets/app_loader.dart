import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/app/app_config.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppConfig.instnace.isIOS) {
      return CupertinoActivityIndicator(
        radius: 16,
      );
    }

    return CircularProgressIndicator(
      color: AppColors.gray100,
    );
  }
}

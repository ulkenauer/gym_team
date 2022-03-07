import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/app/app_service_locator.dart';
import 'package:gym_team/app/typography.dart';
import 'package:gym_team/presentation/widgets/gym_gradient_container.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppServiceLocator.current.appConfig.isIOS) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: AppColors.grad1,
            middle: Text('GymTeam'),
            padding: EdgeInsetsDirectional.all(0),
            leading: CupertinoNavigationBarBackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
          child: GymGradientContainer(
              child: Center(
            child: Text(
              'hello world!',
              style: AppTypography.bodyCaption,
            ),
          )));
    }
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('GymTeam'),
        backgroundColor: AppColors.grad1,
        elevation: 0,
        centerTitle: true,
      ),
      body: GymGradientContainer(
          child: Center(
        child: Text(
          'hello world!',
          style: AppTypography.bodyCaption,
        ),
      )),
    );
  }
}

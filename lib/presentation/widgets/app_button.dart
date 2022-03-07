
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/app/app_service_locator.dart';
import 'package:gym_team/app/app_sizes.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color disabledTextColor;
  final Color backgroundColor;
  final Color disabledColor;
  final bool loading;

  final double? buttonHeight;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.black,
    this.disabledTextColor = AppColors.black,
    this.backgroundColor = AppColors.gray100,
    this.disabledColor = AppColors.gray100,
    this.loading = false,
    this.buttonHeight = AppSize.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget button;
    if (AppServiceLocator.current.appConfig.isIOS) {
      button = CupertinoButton(
        onPressed: onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: backgroundColor,
        disabledColor: disabledColor,
        child: loading
            ? const CupertinoActivityIndicator()
            : FittedBox(
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(color: textColor),
                ),
              ),
      );
    } else {
      button = MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        disabledColor: disabledColor,
        child: loading
            ? const CupertinoActivityIndicator()
            : FittedBox(
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(color: textColor),
                ),
              ),
      );
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AppSize.buttonHeight),
      child: button,
    );
  }
}

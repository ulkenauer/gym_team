import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_sizes.dart';
import 'package:gym_team/app/typography.dart';
import 'package:gym_team/presentation/widgets/app_button.dart';

class AppErrorWidget extends StatelessWidget {
  final void Function() onRetry;
  final String errorText;

  const AppErrorWidget({
    Key? key,
    required this.onRetry,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          errorText,
          style: AppTypography.bodyCaption,
        ),
        Container(
          height: AppSize.padding,
        ),
        AppButton(
          text: 'Попробовать снова',
          onPressed: onRetry,
        )
      ],
    );
  }
}

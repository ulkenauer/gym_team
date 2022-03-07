import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_colors.dart';

class GymGradientContainer extends StatelessWidget {
  final Widget child;
  const GymGradientContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Gradient.lerp(
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
            colors: [
              AppColors.grad1,
              AppColors.grad2,
            ],
          ),
          LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0, 1],
            colors: [
              AppColors.grad1,
              AppColors.grad2,
            ],
          ),
          0.2,
        ),
      ),
      child: child,
    );
  }
}

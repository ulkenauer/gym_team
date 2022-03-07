import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/app/app_sizes.dart';
import 'package:gym_team/app/typography.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';
import 'package:gym_team/routes/hello/hello_route.dart';
import 'package:gym_team/widgets/train_program_list.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('GymTeam'),
        backgroundColor: AppColors.grad1,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<TrainProgramListCubit, TrainProgramListState>(
        builder: (context, state) {
          if (state.displayError != null) {
            return Center(
              child: Text(state.displayError!),
            );
          }
          if (state.trainProgramsList != null) {
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppSize.padding,
                      ),
                      Text(
                        'Каталог фитнес-программ',
                        style: AppTypography.trainProgramListTitle,
                      ),
                      Container(
                        height: AppSize.padding,
                      ),
                      TrainProgramList(
                        listItems: state.trainProgramsList!,
                        onProgramTapped: (programEntity) {
                          print(programEntity);
                          Navigator.of(context).pushNamed(HelloRoute.name);
                        },
                      ),
                      Container(
                        height: AppSize.padding,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Text('loading'),
          );
        },
      ),
    );
  }
}

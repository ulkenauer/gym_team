import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';
import 'package:gym_team/widgets/train_program_list.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('GymTeam'),
        centerTitle: true,
        actions: [
          Center(
            child: Container(
              height: 10,
              width: 10,
              color: AppColors.gray800,
            ),
          )
        ],
      ),
      body: BlocBuilder<TrainProgramListCubit, TrainProgramListState>(
        builder: (context, state) {
          if (state.displayError != null) {
            return Center(
              child: Text(state.displayError!),
            );
          }
          if (state.trainProgramsList != null) {
            return TrainProgramList(
              listItems: state.trainProgramsList!,
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

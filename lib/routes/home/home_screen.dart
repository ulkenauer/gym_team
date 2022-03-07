import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/routes/train_programs/train_programs_route.dart';
import 'package:gym_team/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        onPressed: () {
          final cubit = BlocProvider.of<TrainProgramListCubit>(context);
          cubit.loadList();
          Navigator.of(context).pushNamed(TrainProgramsRoute.name);
        },
        text: 'В меню',
      ),
    );
  }
}

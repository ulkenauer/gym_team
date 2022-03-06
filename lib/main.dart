import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/app/app_routes.dart';
import 'package:gym_team/data/repositories/network/network_train_programs_repository.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';

late final NetworkTrainProgramsRepository trainProgramsRepository;

void configureServices() {
  trainProgramsRepository = NetworkTrainProgramsRepository();
}

void main() {
  configureServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TrainProgramListCubit>(
          create: (BuildContext context) => TrainProgramListCubit(
            TrainProgramListState.initial(),
            repository: trainProgramsRepository,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'GymTeam Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/app/app_routes.dart';
import 'package:gym_team/app/app_service_locator.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';
import 'package:gym_team/setup.dart';

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
            repository: AppServiceLocator.current.trainProgramsRepository,
          ),
        ),
      ],
      child: AppServiceLocator.current.appConfig.isIOS
          ? CupertinoApp(
              title: 'GymTeam Test',
              initialRoute: 'home',
              onGenerateRoute: AppRoutes.onGenerateRoute,
            )
          : MaterialApp(
              title: 'GymTeam Test',
              theme: ThemeData(
                // primarySwatch: Colors.deepPurple,
                primarySwatch: Colors.deepPurple,
              ),
              initialRoute: 'home',
              onGenerateRoute: AppRoutes.onGenerateRoute,
            ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/app/app_colors.dart';
import 'package:gym_team/app/app_sizes.dart';
import 'package:gym_team/app/typography.dart';
import 'package:gym_team/domain/bloc/train_program_list_cubit.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';
import 'package:gym_team/routes/hello/hello_route.dart';
import 'package:gym_team/widgets/app_error_widget.dart';
import 'package:gym_team/widgets/app_loader.dart';
import 'package:gym_team/widgets/gym_gradient_container.dart';
import 'package:gym_team/widgets/train_program_list.dart';

class MaterialTrainProgramsScreen extends StatelessWidget {
  const MaterialTrainProgramsScreen({Key? key}) : super(key: key);

  Widget _dataBody(state, context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.padding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
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
            return GymGradientContainer(
              child: Center(
                child: AppErrorWidget(
                  errorText: state.displayError!,
                  onRetry:
                      BlocProvider.of<TrainProgramListCubit>(context).loadList,
                ),
              ),
            );
          }
          if (state.trainProgramsList != null) {
            return GymGradientContainer(
              child: RefreshIndicator(
                child: _dataBody(state, context),
                onRefresh:
                    BlocProvider.of<TrainProgramListCubit>(context).loadList,
              ),
            );
          }
          return GymGradientContainer(
            child: Center(
              child: AppLoader(),
            ),
          );
        },
      ),
    );
  }
}

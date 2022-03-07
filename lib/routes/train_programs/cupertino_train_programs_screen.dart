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
import 'package:gym_team/widgets/train_program_card.dart';

class CupertinoTrainProgramsScreen extends StatelessWidget {
  const CupertinoTrainProgramsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: BlocBuilder<TrainProgramListCubit, TrainProgramListState>(
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
            final _programs = state.trainProgramsList!;
            return GymGradientContainer(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: <Widget>[
                  CupertinoSliverRefreshControl(
                    onRefresh: BlocProvider.of<TrainProgramListCubit>(context)
                        .loadList,
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.padding,
                      horizontal: AppSize.padding,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Каталог фитнес-программ',
                        style: AppTypography.trainProgramListTitle,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: AppSize.padding).add(
                      EdgeInsets.symmetric(
                        horizontal: AppSize.padding,
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        if (index >= _programs.length) {
                          return null;
                        }
                        final program = _programs[index];
                        final card = GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(HelloRoute.name);
                          },
                          child: TrainProgramCard(
                            trainProgramEntity: program,
                          ),
                        );

                        if (index == _programs.length - 1) {
                          return card;
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSize.halfLongPadding,
                          ),
                          child: card,
                        );
                      }),
                    ),
                  ),
                ],
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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_team/domain/bloc/train_program_list_state.dart';
import 'package:gym_team/domain/repositories/train_programs_repository.dart';

class TrainProgramListCubit extends Cubit<TrainProgramListState> {
  final TrainProgramsRepository repository;

  TrainProgramListCubit(
    TrainProgramListState initialState, {
    required this.repository,
  }) : super(initialState);

  void loadList() async {
    if (state.isLoading) {
      return;
    }

    emit((TrainProgramListStateBuilder.fromInstance(state)
          ..isLoading = true
          ..displayError = null)
        .build());
    try {
      final data = await repository.fetchProgramsBriefList();

      emit((TrainProgramListStateBuilder.fromInstance(state)
            ..isLoading = false
            ..displayError = null
            ..trainProgramsList = data)
          .build());
    } catch (err) {
      emit((TrainProgramListStateBuilder.fromInstance(state)
            ..isLoading = false
            ..displayError = 'Что-то пошло не так')
          .build());
    }
  }
}

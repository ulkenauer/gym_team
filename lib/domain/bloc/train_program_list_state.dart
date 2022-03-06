import 'package:flutter/foundation.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';

@immutable
class TrainProgramListState {
  final String? displayError;
  final bool isLoading;
  final List<TrainProgramBriefEntity>? trainProgramsList;

  factory TrainProgramListState.initial() {
    return TrainProgramListState(isLoading: false);
  }

  TrainProgramListState({
    this.displayError,
    required this.isLoading,
    this.trainProgramsList,
  });
}

class TrainProgramListStateBuilder {
  String? displayError;
  bool isLoading;
  List<TrainProgramBriefEntity>? trainProgramsList;

  TrainProgramListStateBuilder({
    this.displayError,
    required this.isLoading,
    this.trainProgramsList,
  });

  factory TrainProgramListStateBuilder.fromInstance(
    TrainProgramListState instance,
  ) {
    return TrainProgramListStateBuilder(
      isLoading: instance.isLoading,
      displayError: instance.displayError,
      trainProgramsList: instance.trainProgramsList,
    );
  }

  TrainProgramListState build() {
    return TrainProgramListState(
      isLoading: isLoading,
      displayError: displayError,
      trainProgramsList: trainProgramsList,
    );
  }
}

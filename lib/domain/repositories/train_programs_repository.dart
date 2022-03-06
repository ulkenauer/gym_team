import 'package:gym_team/domain/entities/train_program_brief_entity.dart';

abstract class TrainProgramsRepository {
  Future<List<TrainProgramBriefEntity>> fetchProgramsBriefList();
}
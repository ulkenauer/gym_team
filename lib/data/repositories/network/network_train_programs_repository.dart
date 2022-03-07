import 'package:dio/dio.dart';
import 'package:gym_team/data/repositories/network/train_programs_mapper.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';
import 'package:gym_team/domain/repositories/train_programs_repository.dart';

class NetworkTrainProgramsRepository implements TrainProgramsRepository {
  final Dio dio;

  NetworkTrainProgramsRepository({
    required this.dio,
  });

  @override
  Future<List<TrainProgramBriefEntity>> fetchProgramsBriefList() => dio
      .get('https://run.mocky.io/v3/f3ee4af1-57f1-4893-853c-442b540961d6')
      .then(TrainProgramsMapper.mapTrainProgramBriefEntityList);
}

import 'package:dio/dio.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';
import 'package:gym_team/domain/repositories/train_programs_repository.dart';

class NetworkTrainProgramsRepository implements TrainProgramsRepository {
  @override
  Future<List<TrainProgramBriefEntity>> fetchProgramsBriefList() async {
    final response = await Dio(BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 7000,
    )).get('https://run.mocky.io/v3/f3ee4af1-57f1-4893-853c-442b540961d6');

    return (response.data as List).map((jsonEntry) {
      return TrainProgramBriefEntity(
        image: jsonEntry['image'],
        id: jsonEntry['id'],
        text: jsonEntry['text'],
        title: jsonEntry['title'],
      );
    }).toList();
  }
}

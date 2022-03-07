import 'package:dio/dio.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';
import 'package:gym_team/domain/repositories/train_programs_repository.dart';

class NetworkTrainProgramsRepository implements TrainProgramsRepository {
  @override
  Future<List<TrainProgramBriefEntity>> fetchProgramsBriefList() async {
    final response = await Dio(BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 7000,
    )).get('https://run.mocky.io/v3/304b6d7d-d0a4-4bae-ad0c-c1bd9d3ce1b2');

    return (response.data as List).map((jsonEntry) {
      return TrainProgramBriefEntity(
        image:
            'https://media.istockphoto.com/photos/handsome-well-built-man-training-picture-id611329486?k=20&m=611329486&s=170667a&w=0&h=91-3yWpYGpEB4C8o-ZsXKw1PNppf7SXrczH13ewepZI=',
        id: jsonEntry['id'],
        text: jsonEntry['text'],
        title: jsonEntry['title'],
      );
    }).toList();
  }
}

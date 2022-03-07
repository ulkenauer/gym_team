import 'package:dio/dio.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';

class TrainProgramsMapper {
  static TrainProgramBriefEntity mapSingleTrainProgramBriefEntity(
    dynamic mapEntry,
  ) =>
      TrainProgramBriefEntity(
        image: mapEntry['image'],
        id: mapEntry['id'],
        text: mapEntry['text'],
        title: mapEntry['title'],
      );

  static List<TrainProgramBriefEntity> mapTrainProgramBriefEntityList(
    Response response,
  ) =>
      (response.data as List).map(mapSingleTrainProgramBriefEntity).toList();
}

import 'package:gym_team/app/app_config.dart';
import 'package:gym_team/domain/repositories/train_programs_repository.dart';

/// TODO
/// использовать getIt для управления зависимостями
class AppServiceLocator {
  static late AppServiceLocator current;
  final AppConfig appConfig;
  final TrainProgramsRepository trainProgramsRepository;

  AppServiceLocator({
    required this.appConfig,
    required this.trainProgramsRepository,
  });
}

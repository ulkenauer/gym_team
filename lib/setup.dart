import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gym_team/app/app_config.dart';
import 'package:gym_team/app/app_service_locator.dart';
import 'package:gym_team/data/repositories/network/network_train_programs_repository.dart';

void configureServices() {
  final dio = Dio(
    BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 7000,
    ),
  );
  
  AppServiceLocator.current = AppServiceLocator(
    appConfig: AppConfig(
      isIOS: Platform.isIOS,
    ),
    trainProgramsRepository: NetworkTrainProgramsRepository(
      dio: dio,
    ),
  );
}
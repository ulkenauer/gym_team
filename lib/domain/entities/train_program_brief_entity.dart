import 'package:flutter/foundation.dart';

@immutable
class TrainProgramBriefEntity {
  final int id;
  final String title;
  final String image;
  final String text;

  TrainProgramBriefEntity({
    required this.id,
    required this.image,
    required this.text,
    required this.title,
  });
}

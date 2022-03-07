import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_sizes.dart';
import 'package:gym_team/app/typography.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';

class TrainProgramCard extends StatelessWidget {
  final TrainProgramBriefEntity trainProgramEntity;
  const TrainProgramCard({
    Key? key,
    required this.trainProgramEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            child: Text(
              trainProgramEntity.title,
              style: AppTypography.trainProgramCardTitle,
            ),
            padding: EdgeInsets.only(bottom: AppSize.halfPadding),
          ),
          Container(
            height: 130,
            child: Row(
              children: [
                Flexible(
                  child: ClipRRect(
                      child: FancyShimmerImage(
                        imageUrl: trainProgramEntity.image,
                        boxFit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                ),
                Container(
                  width: AppSize.padding,
                ),
                Flexible(
                  child: Text(
                    trainProgramEntity.text,
                    style: AppTypography.trainProgramCardDescription,
                    overflow: TextOverflow.ellipsis,
                    // softWrap: false,
                    maxLines: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }
}

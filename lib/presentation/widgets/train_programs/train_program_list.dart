import 'package:flutter/widgets.dart';
import 'package:gym_team/app/app_sizes.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';
import 'package:gym_team/presentation/widgets/train_programs/train_program_card.dart';

class TrainProgramList extends StatelessWidget {
  final List<TrainProgramBriefEntity> listItems;
  final void Function(TrainProgramBriefEntity programEntity)? onProgramTapped;
  const TrainProgramList({
    Key? key,
    required this.listItems,
    this.onProgramTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = listItems[index];
        return GestureDetector(
          onTap: () {
            if (onProgramTapped != null) {
              onProgramTapped!(item);
            }
          },
          child: TrainProgramCard(
            trainProgramEntity: item,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: AppSize.halfLongPadding,
        );
      },
      itemCount: listItems.length,
    );
  }
}

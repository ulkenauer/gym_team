import 'package:flutter/widgets.dart';
import 'package:gym_team/domain/entities/train_program_brief_entity.dart';

class TrainProgramList extends StatelessWidget {
  final List<TrainProgramBriefEntity> listItems;
  const TrainProgramList({
    Key? key,
    required this.listItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = listItems[index];
        return Text(item.title);
      },
      separatorBuilder: (context, index) {
        return Container();
      },
      itemCount: listItems.length,
    );
  }
}

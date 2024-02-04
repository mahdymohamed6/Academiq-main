import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/models/eventsModel.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/imagesListViewCard.dart';

class ImageListViewBuilder extends StatelessWidget {
  ImageListViewBuilder({
    super.key,
  });

  final List<EventModel> event = [
    EventModel(
        image: 'assets/images/graduationParty.png', text: 'Graduation \nparty'),
    EventModel(
        image: 'assets/images/socialActivity.png', text: 'Social \nactivities'),
    EventModel(
        image: 'assets/images/newActivitis.png', text: 'New \nactivities ')
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: event.length,
        itemBuilder: (context, index) {
          return ImagesListViewCard(
            width: MediaQuery.of(context).size.width,
            event: event[index],
          );
        },
      ),
    );
  }
}

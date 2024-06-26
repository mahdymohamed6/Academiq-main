// import 'package:flutter/material.dart';
// import 'package:necessities/actors/parent/features/Child/data/data_source/remote_Data_source.dart';
// import 'package:necessities/actors/parent/features/parentHome/presentation/models/eventsModel.dart';
// import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/imagesListViewCard.dart';
// import 'package:necessities/constants.dart';

// class PublicAnnouncment extends StatelessWidget {
//   PublicAnnouncment({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ParentChildService().getGlobalAnnouncement(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//               child: CircularProgressIndicator(
//             color: primaryColor1,
//           ));
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (!snapshot.hasData) {
//           return Text('No data');
//         }
//         final discussions = snapshot.data!;
//         return SizedBox(
//           width: double.infinity,
//           height: 150,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: discussions.discussion!.posts!.length,
//             itemBuilder: (context, index) {
//               final discussion = discussions.discussion!.posts![index];
//               return ImagesListViewCard(
//                 width: MediaQuery.of(context).size.width,
//                 discussion: discussion,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
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

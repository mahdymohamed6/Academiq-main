// import 'package:flutter/material.dart';
// import 'package:necessities/constants.dart';
// import 'package:necessities/core/styles.dart';

// class ImagesListViewCard extends StatelessWidget {
//   const ImagesListViewCard({
//     super.key,
//     required this.width,
//     required this.discussion,
//   });
//   final discussion;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     if (discussion.attachments.isEmpty) {
//       return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: width * 0.9,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: discussion.attachments.length,
//                 itemBuilder: (context, index) {
//                   final image = discussion.attachments[index];
//                   return ClipRRect(
//                     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.asset('assets/images/graduationParty.png')),
//                   );
//                 },
//               ),
//             ),
//           ));
//     } else {
//       return Container(
//         width: width * 0.9,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 8.0),
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: discussion.attachments.length,
//             itemBuilder: (context, index) {
//               final image = discussion.attachments[index];
//               return ClipRRect(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(
//                     image,
//                     width: width,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/models/eventsModel.dart';
import 'package:necessities/core/styles.dart';

class ImagesListViewCard extends StatelessWidget {
  const ImagesListViewCard({
    super.key,
    required this.width,
    required this.event,
  });
  final EventModel event;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 150,
        width: 359,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                event.image,
                width: width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                event.text,
                style: Style().title.copyWith(
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 25,
                      ),
                    ],
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

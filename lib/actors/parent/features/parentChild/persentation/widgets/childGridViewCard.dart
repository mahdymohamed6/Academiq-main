import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/features/Child/data/data_source/remote_Data_source.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/childinfoScreen.dart';
import 'package:necessities/actors/parent/features/Child/presentation/pages/profileContent.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ChildGridViewCard extends StatefulWidget {
  const ChildGridViewCard({super.key, required this.isSelected, this.child});
  final bool isSelected;
  final child;
  @override
  State<ChildGridViewCard> createState() => _ChildGridViewCardState();
}

class _ChildGridViewCardState extends State<ChildGridViewCard>
    with SingleTickerProviderStateMixin {
  void _showDetails(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ChildInfoScreen(
              child: widget.child,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment:
              Alignment.center, // Align the children in the center of the stack
          children: [
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () => _showDetails(context),
                child: Container(
                  height: height * 0.25,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0XFFFFD4B8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 8, right: 8),
                        child: Text(
                            '${widget.child.name.first} ${widget.child.name.last}',
                            maxLines: 1,
                            style: Style().title.copyWith(
                                  fontSize: 12,
                                  color: primaryColor1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset(
                          'assets/images/girlReading.png',
                          width: 77,
                          height: 83,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -15,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(200),
                ),
                child: ClipOval(
                    child: widget.child.profilePicture.url != null
                        ? Image.network(
                            widget.child.profilePicture.url,
                            fit: BoxFit.cover,
                            width: 52,
                            height: 52,
                          )
                        : Image.asset(
                            'assets/images/teacher.png',
                            fit: BoxFit.cover,
                            width: 52,
                            height: 52,
                          )),
              ),
            ),
          ],
        ));
  }
}

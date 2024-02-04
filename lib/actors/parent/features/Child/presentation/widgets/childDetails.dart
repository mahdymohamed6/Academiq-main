import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/familyDetails.dart';
import 'package:necessities/actors/parent/features/Child/presentation/widgets/teacherDetails.dart';

import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class childDetails extends StatefulWidget {
  const childDetails({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<childDetails> createState() => _childDetailsState();
}

class _childDetailsState extends State<childDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _nameAnimation;
  late Animation<Offset> _familyAnimation;
  late Animation<Offset> _teacherAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _nameAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _familyAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _teacherAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SlideTransition(
              position: _nameAnimation,
              child: Container(
                width: widget.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Text('Name: ',
                            style: Style()
                                .title
                                .copyWith(color: primaryColor3, fontSize: 18)),
                      ),
                      Container(
                        child: Expanded(
                          child: Text('Jane Cooper',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Style()
                                  .title
                                  .copyWith(color: Colors.grey, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _nameAnimation,
              child: Container(
                width: widget.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Text('Grad: ',
                            style: Style()
                                .title
                                .copyWith(color: primaryColor3, fontSize: 18)),
                      ),
                      Container(
                        child: Expanded(
                          child: Text('Binaries',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Style()
                                  .title
                                  .copyWith(color: Colors.grey, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _teacherAnimation,
              child: Container(
                width: widget.width * 0.5,
                height: widget.height * 0.12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text('Specialization',
                            style: Style()
                                .title
                                .copyWith(color: primaryColor3, fontSize: 18)),
                      ),
                      Container(
                        child: Text('Jane Scientific',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Style()
                                .title
                                .copyWith(color: Colors.grey, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
                position: _teacherAnimation, child: TeacherDetails())
          ],
        ),
        SizedBox(
          width: 10,
        ),
        SlideTransition(position: _familyAnimation, child: FamilyDetails())
      ],
    );
  }
}

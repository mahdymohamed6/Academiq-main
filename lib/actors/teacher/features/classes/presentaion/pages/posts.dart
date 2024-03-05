import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          child: Drawerr(),
        ),
        backgroundColor: Colors.white,
        appBar: buildTeacherAppBar(context) as PreferredSize,
        body: Column());
  }
}

import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/childAvtivitesCard.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/imageListViewBuilder.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';

class ParentHomeView extends StatelessWidget {
  const ParentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 18,
        color: Colors.grey.shade900,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins');
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CustomizedSearchBar(
            text: 'Search here',
          ),
          const SizedBox(
            height: 24,
          ),
          PublicAnnouncment(),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 37),
            child: Text(
              'Today Timetable',
              style: textStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 33, top: 24),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: ChildAvtivitesCard(),
                    );
                  }),
            ),
          )
        ]),
      ),
    );
  }
}

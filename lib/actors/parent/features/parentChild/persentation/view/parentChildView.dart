import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChild/persentation/widgets/childGridViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';

class ParentChildView extends StatefulWidget {
  const ParentChildView({super.key});

  @override
  State<ParentChildView> createState() => _ParentChildViewState();
}

class _ParentChildViewState extends State<ParentChildView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomizedSearchBar(
            text: 'Search here',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 61),
          child: SizedBox(
            width: double.infinity,
            height: height * 0.45,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return const ChildGridViewCard();
                }),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChild/persentation/widgets/childGridViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';

class ParentChildView extends StatelessWidget {
  const ParentChildView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(context) as PreferredSize,
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.78,
                  crossAxisCount: 3,
                  mainAxisSpacing: 55,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, int index) {
                  return const ChildGridViewCard();
                }),
          ),
        )
      ]),
    );
  }
}

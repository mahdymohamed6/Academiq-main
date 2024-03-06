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
      appBar: buildAppBar(context) as PreferredSize,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomizedSearchBar(
              text: 'Search here',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              height: height * 0.7,
              width: width*0.95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedIndex == index) {
                            selectedIndex = -1; // Close the expanded container
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        width:
                            selectedIndex == index ? width * 0.9 : width * 0.4,
                        child: ChildGridViewCard(
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}

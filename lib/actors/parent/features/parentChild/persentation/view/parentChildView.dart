import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:necessities/actors/parent/features/Child/data/data_source/remote_Data_source.dart';
import 'package:necessities/actors/parent/features/parentChild/persentation/widgets/childGridViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/constants.dart';

class ParentChildView extends StatelessWidget {
  const ParentChildView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final parentId = GetStorage().read('id');
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {
                print('PARENT ID ::::' + parentId);
              },
              child: CustomizedSearchBar(
                text: 'Search here',
              ),
            ),
          ),
          FutureBuilder(
              future: ParentChildService().getChildren(parentId: parentId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: CircularProgressIndicator(
                      color: primaryColor1,
                    ),
                  ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                }
                final children = snapshot.data!.children;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 31, vertical: 20),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: children!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.78,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, int index) {
                        final child = children![index];
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ChildGridViewCard(
                            child: child,
                            isSelected: true,
                          ),
                        );
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

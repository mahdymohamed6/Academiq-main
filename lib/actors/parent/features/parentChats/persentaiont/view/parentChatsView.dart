import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentChats/persentaiont/widgets/paretnChatsListViewCard.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';

class ParentChatsView extends StatefulWidget {
  const ParentChatsView({Key? key}) : super(key: key);

  @override
  State<ParentChatsView> createState() => _ParentChatsViewState();
}

class _ParentChatsViewState extends State<ParentChatsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      backgroundColor: Colors.white,
      appBar: buildParentAppBar(context) as PreferredSize,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomizedSearchBar(text: 'Search for teacher'),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const ParetnChatsListViewCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

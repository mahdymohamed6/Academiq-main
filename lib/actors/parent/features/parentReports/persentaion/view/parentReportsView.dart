import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentReports/persentaion/widgets/paretnReportsListViewCard.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';

class ParentReportsView extends StatelessWidget {
  const ParentReportsView({super.key});

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
            const CustomizedSearchBar(text: 'Search for mail'),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const ParetnReportsListViewCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

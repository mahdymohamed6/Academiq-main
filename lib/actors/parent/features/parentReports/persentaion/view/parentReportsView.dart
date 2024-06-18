import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentReports/data/models/report_model/report_model.dart';
import 'package:necessities/actors/parent/features/parentReports/data/reports_service.dart';
import 'package:necessities/actors/parent/features/parentReports/persentaion/widgets/paretnReportsListViewCard.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/actors/parent/widgets/customizedSearchBar.dart';
import 'package:necessities/constants.dart';

class ParentReportsView extends StatefulWidget {
  const ParentReportsView({super.key});

  @override
  State<ParentReportsView> createState() => _ParentReportsViewState();
}

class _ParentReportsViewState extends State<ParentReportsView> {
  List<ReportModel> _reports = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    FetchReports();
  }

  Future<void> FetchReports() async {
    final reports = await ReportsService().fetchReports();
    setState(() {
      _reports = reports;
      _isLoading = false;
    });
  }

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
            InkWell(
                onTap: () {},
                child: const CustomizedSearchBar(text: 'Search for mail')),
            if (_isLoading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: CircularProgressIndicator(
                    color: primaryColor1,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _reports.length,
                  itemBuilder: (context, index) {
                    return ParetnReportsListViewCard(
                      report: _reports[index],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

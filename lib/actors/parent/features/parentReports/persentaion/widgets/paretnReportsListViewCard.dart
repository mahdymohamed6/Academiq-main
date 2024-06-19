import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/parent/features/parentReports/data/models/report_model/report_model.dart';
import 'package:necessities/actors/parent/features/parentReports/data/reports_service.dart';
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
                  padding: const EdgeInsets.only(top: 150),
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

class ParetnReportsListViewCard extends StatelessWidget {
  const ParetnReportsListViewCard({super.key, required this.report});
  final ReportModel report;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${report.from!.name!.first!} ${report.from!.name!.last!}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins',
                            color: Color.fromRGBO(42, 43, 44, 1))),
                    const SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          report.body!,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'poppins',
                              color: Color.fromRGBO(148, 163, 184, 1)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${report.createdAt!.hour}:00 AM',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.4,
            thickness: 0.7,
          ),
        ],
      ),
    );
  }
}

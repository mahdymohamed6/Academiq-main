import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:necessities/actors/parent/features/parentReports/persentaion/view/ReportReplyPage.dart';

class ParetnReportsListViewCard extends StatelessWidget {
  const ParetnReportsListViewCard({super.key, required this.report});
  final report;
  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ReportReply(report: report);
              }));
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${report.from.name.first} ${report.from.name.last}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins',
                              color: Color.fromRGBO(42, 43, 44, 1))),
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 11),
                        child: Text(
                          report.body,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'poppins',
                              color: Color.fromRGBO(148, 163, 184, 1)),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 8, bottom: 29),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getFormattedDate(report.createdAt),
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
          ),
          SizedBox(
            height: 4,
          ),
          Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.4,
            thickness: 0.7,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:necessities/actors/parent/features/parentReports/data/models/report_model/report_model.dart';
import 'package:necessities/actors/parent/features/parentReports/data/reports_service.dart';

class ReportReply extends StatefulWidget {
  const ReportReply({super.key, required this.report});

  final ReportModel report;

  @override
  State<ReportReply> createState() => _ReportReplyState();
}

String getFormattedDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

class _ReportReplyState extends State<ReportReply> {
  final TextEditingController replyController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/Logo2.png', // Replace with your logo asset
          height: height * 0.1,
          width: width * 0.3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.report.from!.name!.first!} ${widget.report.from!.name!.last!}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(42, 43, 44, 1)),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      widget.report.body!,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      getFormattedDate(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You replied:',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(42, 43, 44, 1)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.report.reply == null
                          ? 'didnt reply'
                          : widget.report.reply!,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: formkey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: replyController,
                      decoration: const InputDecoration(
                        hintText: 'Add reply',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 96, 95, 95),
                              width: 1.7),
                        ),
                      ),
                      onFieldSubmitted: (value) {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: () async {
                      bool result = await ReportsService().sendReply(
                        content: replyController.text,
                        reportId: widget.report.id!,
                      );
                      print(result);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reply sent successfully'),
                          ),
                        );
                        replyController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Failed to send reply or you sent it before'),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

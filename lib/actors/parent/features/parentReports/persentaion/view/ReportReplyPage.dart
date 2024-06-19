import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:necessities/actors/parent/data/data_source/remote_data_source.dart';
import 'package:necessities/actors/parent/widgets/appBar.dart';
import 'package:necessities/constants.dart';

class ReportReply extends StatefulWidget {
  const ReportReply({super.key, this.report});
  final report;
  @override
  State<ReportReply> createState() => _ReportReplyState();
}

String getFormattedDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

class _ReportReplyState extends State<ReportReply> {
  final TextEditingController replyController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> reply(String content) async {
    try {
      await ReportsServices().sendReply(
        reportId: widget.report.id,
        content: content,
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: AppBar(
                iconTheme: IconThemeData(color: primaryColor1),
                scrolledUnderElevation: 0,
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Image.asset(
                  logo2,
                  height: height * 0.1,
                  width: width * 0.3,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ) as PreferredSizeWidget,
            )),
        body: Padding(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${widget.report.from.name.first} ${widget.report.from.name.last}',
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
                              widget.report.body,
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
                            getFormattedDate(widget.report.createdAt),
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
              if (widget.report.reply != null)
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 11),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your replied:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.report.reply),
                    ],
                  ),
                ),
              if (widget.report.reply == null || widget.report.reply == '')
                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: replyController,
                            decoration: InputDecoration(
                              hintText: 'Add Comment',
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 96, 95, 95),
                                    width: 1.7),
                              ),
                            ),
                            onFieldSubmitted: (value) {
                              if (formkey.currentState!.validate()) {
                                reply(replyController.text);
                                replyController.clear();
                                SnackBar(content: Text('Reply DOne'));
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send, color: primaryColor1),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              reply(replyController.text);
                              replyController.clear();
                              SnackBar(content: Text('Reply DOne'));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}

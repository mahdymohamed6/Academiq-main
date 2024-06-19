import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/data/data_source/data_source.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/attendance.dart';
import 'package:necessities/actors/teacher/data/models/Attendance/attendance_student/attendance_student.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key, this.gradeClassId});
  final gradeClassId;
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<int> periodList = List<int>.generate(10, (index) => index + 1);
  int? selectedPeriod;
  List<bool> isCheckedList = [];
  bool _attemptedLoad = false; // Track if attendance load has been attempted

  DateTime? selectedDate;
  bool isDatePickerOpen = false;
  List selectedStudents = [];

  Attendance? attendance;
  @override
  void initState() {
    super.initState();
    _loadAttendance();
  }

  String getFormattedDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  Future<void> _loadAttendance() async {
    if (selectedDate != null && selectedPeriod != null) {
      setState(() {
        _attemptedLoad = true;
        attendance = null;
      });
      try {
        final data = await DiscussionService().getAttendance(
          id: widget.gradeClassId,
          date: getFormattedDate(selectedDate!),
          period: selectedPeriod!,
        );
        if (data.attendance != null) {
          setState(() {
            attendance = data.attendance!;
            isCheckedList = List<bool>.filled(
              attendance!.students!.length,
              false,
            );
            for (int i = 0; i < attendance!.students!.length; i++) {
              if (attendance!.students![i].status == 'present') {
                isCheckedList[i] = true;
                selectedStudents.add(attendance!.students![i].student!.id!);
              } else {
                isCheckedList[i] = false;
              }
            }
          });
        } else {
          print('Attendance data is null or has no students');
          setState(() {
            attendance = null;
          });
        }
      } catch (error) {
        print('Error loading attendance: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        child: Drawerr(),
      ),
      appBar: buildTeacherAppBar(context, 'Attendace', false)
          as PreferredSizeWidget,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Choose a period',
                    style: Style()
                        .title
                        .copyWith(fontSize: 14, color: Color(0xff999999)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    style: Style()
                        .title
                        .copyWith(fontSize: 16, color: primaryColor1),
                    hint: Text('Please choose a period'),
                    value: selectedPeriod,
                    onChanged: (newValue) {
                      setState(() {
                        selectedPeriod = newValue;
                      });
                    },
                    items: periodList.map((period) {
                      return DropdownMenuItem(
                        child: new Text(period.toString()),
                        value: period,
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Pick Date',
                    style: Style()
                        .title
                        .copyWith(fontSize: 14, color: Color(0xff999999)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                          getFormattedDate(selectedDate as DateTime);
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryColor1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'No date is selected ',
                          style: Style()
                              .title
                              .copyWith(color: primaryColor1, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  _loadAttendance();
                },
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text('Load Attendance',
                          style: Style()
                              .title
                              .copyWith(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      style: Style()
                          .title
                          .copyWith(fontSize: 16, color: primaryColor1),
                    ),
                    Text(
                      'Status',
                      style: Style()
                          .title
                          .copyWith(fontSize: 16, color: primaryColor1),
                    ),
                  ],
                ),
              ),
              Divider(
                color: primaryColor1,
              ),
              if (!_attemptedLoad)
                Center(
                  child: Text(
                    'Please Choose a date and a period',
                    style: Style()
                        .title
                        .copyWith(color: primaryColor1, fontSize: 16),
                  ),
                )
              else if (attendance == null)
                Center(
                  child: Text(
                    'No Attendance Found',
                    style: Style()
                        .title
                        .copyWith(color: primaryColor1, fontSize: 16),
                  ),
                )
              else
                SizedBox(
                  height: height * 0.4,
                  child: ListView.builder(
                      itemCount: attendance!.students!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final student = attendance!.students![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffF6F6F6)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${student.student!.name!.first} ${student.student!.name!.last}',
                                    style: Style().title.copyWith(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Checkbox(
                                    side: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Colors.green),
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                    activeColor: Colors.green,
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value!;
                                        if (value) {
                                          selectedStudents.add(attendance!
                                              .students![index].student!.id!);
                                        } else {
                                          selectedStudents.remove(attendance!
                                              .students![index].student!.id!);
                                        }
                                        /*   selectedStudents.add({
                                                'studentId':
                                                    student.student!.id!,
                                                'status': 'present'
                                              });
                                            } else {
                                              selectedStudents.add({
                                                'studentId':
                                                    student.student!.id!,
                                                'status': 'absent'
                                              });
                                            } */
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              /* GestureDetector(
                onTap: () {
                  print(selectedDate);
                  DiscussionService().RetakeAttendance(
                      students: selectedStudents,
                      date: getFormattedDate(selectedDate as DateTime),
                      period: selectedPeriod as int);
                },
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text('ReTake',
                          style: Style()
                              .title
                              .copyWith(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ),
              ) */
              attendance != null
                  ? GestureDetector(
                      onTap: () {
                        DiscussionService().takeAttendance(
                            students: selectedStudents,
                            courseId: attendance!.courseId!,
                            period: selectedPeriod as int);
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text('Submit',
                                style: Style().title.copyWith(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

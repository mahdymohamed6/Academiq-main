import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/Drawerr.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/TeacherAppBar.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List classes = ['class 1', 'class 2', 'class 3', 'class 4'];
  String? selectedClass;
  List<bool> isCheckedList =
      List<bool>.filled(10, false); // List to track checked state
  DateTime? selectedDate;
  bool isDatePickerOpen = false;

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
                    'Choose Class',
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
                    hint: Text(
                        'Please choose a class'), // Not necessary for Option 1
                    value: selectedClass,
                    onChanged: (newValue) {
                      setState(() {
                        selectedClass = newValue as String;
                      });
                    },
                    items: classes.map((classes) {
                      return DropdownMenuItem(
                        child: new Text(classes),
                        value: classes,
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
                        });
                      }
                    },
                  
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedDate != null
                            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                            : 'No date is selected ',
                            style: Style().title.copyWith(
                              color:primaryColor1,
                              fontSize: 14
                            ),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
              SizedBox(
                height: height * 0.5,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF6F6F6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mahmoud Ahmed',
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
                                      print(isCheckedList);
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
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text('Submit',
                        style: Style()
                            .title
                            .copyWith(fontSize: 16, color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

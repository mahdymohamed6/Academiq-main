import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/features/Assignment/presentation/widgets/customized_button.dart';
import 'package:table_calendar/table_calendar.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  DateTime today = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add to todo list',
                  style: Style().title.copyWith(
                        fontSize: 18,
                        color: primaryColor1,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Add Title',
                  style: Style().title.copyWith(
                      color: Colors.black.withOpacity(0.6), fontSize: 15)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Add Description',
                  style: Style().title.copyWith(
                      color: Colors.black.withOpacity(0.6), fontSize: 15)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              TableCalendar(
                headerStyle: HeaderStyle(
                    titleTextStyle: Style()
                        .title
                        .copyWith(color: primaryColor1, fontSize: 20),
                    formatButtonVisible: false),
                calendarStyle: CalendarStyle(
                    outsideTextStyle:
                        Style().title.copyWith(color: Colors.grey.withOpacity(0.3), fontSize: 20),
                    weekendTextStyle:
                        Style().title.copyWith(color: Colors.grey, fontSize: 20),
                    defaultTextStyle:
                        Style().title.copyWith(color: Colors.grey, fontSize: 20),
                    selectedDecoration: BoxDecoration(
                        color: primaryColor1, shape: BoxShape.circle),
                    todayTextStyle:
                        Style().title.copyWith(color: Colors.blue, fontSize: 20),
                    selectedTextStyle: Style().title.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle:
                        Style().title.copyWith(fontSize: 15, color: Colors.grey),
                    weekendStyle:
                        Style().title.copyWith(fontSize: 15, color: Colors.grey)),
                focusedDay: today,
                firstDay: DateTime(2015),
                lastDay: DateTime(2030),
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: onDaySelected,
              ),              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomizedButton(
                      text: 'Cancel',
                      textColor: primaryColor1,
                      backgroundColor: Colors.white,
                      borderColor: primaryColor1,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomizedButton(
                      text: 'Save',
                      textColor: Colors.white,
                      backgroundColor: primaryColor1,
                      borderColor: primaryColor1,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int selectedDateIndex = 2;
  List dayList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];
  List dateList = [
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        Text(
          'Todo List',
          style: TextStyle(
            color: primaryColor1,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box),
            color: primaryColor1,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDateIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: selectedDateIndex == index
                          ? width * 0.24
                          : width * 0.18,
                      height: selectedDateIndex == index
                          ? height * 0.16
                          : height * 0.1,
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? primaryColor1
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayList[index],
                            style: Style().title.copyWith(
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16.0,
                                ),
                          ),
                          Text(
                            dateList[index],
                            style: Style().title.copyWith(
                                  color: selectedDateIndex == index
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 16.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 2,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(
            height: 16,
          ),
          const AssignedMissingDoneRow(),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Your Progress !',
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const ProgressBar(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SubjectsListViewItem(),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SubjectsListViewItem extends StatefulWidget {
  const SubjectsListViewItem({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SubjectsListViewItemState createState() => _SubjectsListViewItemState();
}

class _SubjectsListViewItemState extends State<SubjectsListViewItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              icon: Icon(
                Icons.check_circle,
                size: 34,
                color: isPressed ? Colors.green : Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Arabic',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Assignment no 2 tutorial no11',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 13,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: primaryColor1,
                  borderRadius: BorderRadius.circular(22)),
            ),
          ),
          Text(
            '30%',
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class AssignedMissingDoneRow extends StatefulWidget {
  const AssignedMissingDoneRow({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AssignedMissingDoneRowState createState() => _AssignedMissingDoneRowState();
}

class _AssignedMissingDoneRowState extends State<AssignedMissingDoneRow> {
  List<String> textList = ['Assigned', 'Missing', 'Done'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(textList.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              children: [
                Text(
                  textList[index],
                  style: TextStyle(
                    color: index == selectedIndex
                        ? primaryColor1 // or any color you prefer for selected
                        : Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

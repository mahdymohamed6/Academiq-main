import 'package:flutter/material.dart';
import 'package:necessities/actors/student/features/Assignment/data/service/assignment_service.dart';
import 'package:necessities/actors/student/features/Assignment/domain/entities/assignment_entity.dart';
import 'package:necessities/actors/teacher/data/get_teacher_data.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AddAssignmentBar.dart';
import 'package:necessities/actors/teacher/features/classes/presentaion/widgets/AssignmentShowModelBottomSheetChild.dart';
import 'package:intl/intl.dart';
import 'package:necessities/constants.dart';

class AssignmentsView extends StatefulWidget {
  const AssignmentsView({Key? key}) : super(key: key);

  @override
  State<AssignmentsView> createState() => _AssignmentsViewState();
}

class _AssignmentsViewState extends State<AssignmentsView> {
  String Coursid = '';
  List<AssignmentEntity> Assignments = [];
  bool _isLoading = true; // add this flag

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await getTeacherCoursId();
    await getTeacherAssignment();
  }

  Future<void> getTeacherCoursId() async {
    String id = await fetchTeacherData();
    setState(() {
      Coursid = id;
      print(Coursid);
    });
  }

  Future<void> getTeacherAssignment() async {
    var assignments =
        await AssignmentService().getAssignmentsByCours(coursId: Coursid);
    setState(() {
      Assignments = assignments;
      _isLoading = false; // set the flag to false when data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) =>
                    const AssignmentShowModalBottomSheetChild(),
              );
            },
            child: const AddAssignmentBar(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 229, 227, 227),
                  width: 2,
                ),
              ),
              child: _isLoading // show loading indicator if data is loading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: primaryColor1,
                    ))
                  : ListView.builder(
                      itemCount: Assignments.length,
                      itemBuilder: (context, index) {
                        return AssignmentsListViewCard(
                          assignmentEntity: Assignments[index],
                        );
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class AssignmentsListViewCard extends StatelessWidget {
  const AssignmentsListViewCard({
    super.key,
    required this.assignmentEntity,
  });
  final AssignmentEntity assignmentEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    'assets/images/Document.png',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assignmentEntity.title!,
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 32, 32),
                        fontFamily: 'poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      DateFormat('MM/dd/yyyy')
                          .format(assignmentEntity.createdAt!),
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontFamily: 'poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  color: const Color.fromRGBO(32, 32, 32, 1),
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              child: Row(
                children: [
                  const Text(
                    'description:  ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 32, 32),
                      fontFamily: 'poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      assignmentEntity.description!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 32, 32, 32),
                        fontFamily: 'poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 10, // limit to 3 lines
                      overflow: TextOverflow
                          .ellipsis, // show ellipsis at the end of the last line
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              const Text(
                'DeadLine: ',
                style: TextStyle(
                    color: Color.fromRGBO(32, 32, 32, 1),
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400),
              ),
              Text(
                DateFormat('MM/dd/yyyy').format(assignmentEntity.endDate!),
                style: TextStyle(
                    color: Color.fromRGBO(89, 89, 89, 1),
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 14, top: 14, bottom: 24),
        //   child: InkWell(
        //     onTap: () {},
        //     child: Row(
        //       children: [
        //         Image.asset('assets/images/pdf.png'),
        //         const SizedBox(
        //           width: 4,
        //         ),
        //         const Text(
        //           'assignment 1 requirements',
        //           style: TextStyle(
        //               color: Color.fromRGBO(89, 89, 89, 1),
        //               fontSize: 14,
        //               fontFamily: 'poppins',
        //               fontWeight: FontWeight.w400),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        const Divider(
          color: Color.fromRGBO(229, 227, 227, 1),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: InkWell(
            onTap: () {},
            child: const Text(
              'Add comment',
              style: TextStyle(
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 12,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

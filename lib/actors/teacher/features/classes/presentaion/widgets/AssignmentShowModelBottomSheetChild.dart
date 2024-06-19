import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:necessities/actors/student/features/Assignment/data/service/assignment_service.dart';
import 'package:necessities/actors/teacher/data/get_teacher_data.dart';
import 'package:necessities/constants.dart';

class AssignmentShowModalBottomSheetChild extends StatefulWidget {
  const AssignmentShowModalBottomSheetChild({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AssignmentShowModalBottomSheetChildState createState() =>
      _AssignmentShowModalBottomSheetChildState();
}

class _AssignmentShowModalBottomSheetChildState
    extends State<AssignmentShowModalBottomSheetChild> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 7));
  String coursId = '';
  String assessmentId = '';
  File? pickedFile;
  bool _fileAdded = false;
  bool _isSuccess = false;
  String _successMessage = '';
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor1,
            colorScheme: ColorScheme.light(primary: primaryColor1),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor1,
            colorScheme: ColorScheme.light(primary: primaryColor1),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchUserData();
    super.initState();
  }

  Future<void> fetchUserData() async {
    assessmentId = await AssignmentService().createAssignment();
    coursId = await fetchTeacherData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 38),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Enter the Assignment Title',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Enter the Assignment Description',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: scoreController,
            decoration: InputDecoration(
              hintText: 'Enter the Assignment Score',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor1),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 55),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _selectStartDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Start Date: ${DateFormat('yyyy-MM-dd').format(startDate)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _selectEndDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'End Date: ${DateFormat('yyyy-MM-dd').format(endDate)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'add file',
            style: TextStyle(
              color: primaryColor1,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.attach_file_sharp),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.any,
                    allowMultiple: false,
                  );
                  if (result != null && result.files.isNotEmpty) {
                    setState(() {
                      pickedFile = File(result.files.single.path!);
                      _fileAdded = true;
                    });
                  }
                  print(pickedFile!.path);
                },
              ),
              if (_fileAdded)
                const Text(
                  'File added successfully',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              try {
                await AssignmentService().addMaterialToAssignment(
                  assessmentId: assessmentId,
                  file: File(pickedFile!.path),
                );
                await AssignmentService().updateAssessment(
                  title: titleController.text,
                  description: descriptionController.text,
                  startDate: startDate,
                  endDate: endDate,
                  coursId: coursId,
                  score: int.parse(scoreController.text),
                  assessmentId: assessmentId,
                );
                setState(() {
                  _isSuccess = true;
                  _successMessage = 'Assignment posted successfully!';
                });
              } catch (e) {
                // Handle any errors that might occur
                setState(() {
                  _isSuccess = false;
                  _successMessage = 'Failed to post assignment.';
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: _isSuccess
                ? Text(_successMessage,
                    style: const TextStyle(color: Colors.white))
                : const Text(
                    'Post',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/features/Assignment/presentation/widgets/customized_button.dart';

class AssignmentsDetails extends StatefulWidget {
  const AssignmentsDetails({super.key});

  @override
  State<AssignmentsDetails> createState() => _AssignmentsDetailsState();
}

class _AssignmentsDetailsState extends State<AssignmentsDetails> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/Caret_Circle_Left.png',
                      scale: 0.88,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Assignments Details',
                        style: TextStyle(
                          color: primaryColor1,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Divider(
                color: Color.fromARGB(89, 95, 187, 229),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Assignments Name',
                    style: TextStyle(
                      color: primaryColor1,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Text(
                    '5 Point',
                    style: TextStyle(
                      color: Color(0xFF26B170),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Description',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'I want to easily view the titles of tasks or assignments assigned by my teachers for todays homework.',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.7,
                color: Color(0xFFEDEDED),
              ),
              const SizedBox(height: 12),
              const Text(
                'Deadline',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'I want to easily view the titles of tasks or assignments assigned by my teachers for todays homework.',
                style: TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.7,
                color: Color(0xFFEDEDED),
              ),
              const SizedBox(height: 10),
              Text(
                'Send your answer',
                style: TextStyle(
                  color: primaryColor1,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Attachment*',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              Container(
                width: width,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.attach_file_sharp),
                      onPressed: () {},
                    )),
              ),
              SizedBox(height: 20),
              const Text(
                'Add a comment (Optional)',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              Form(
                  key: formkey,
                  child: TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
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
                      text: 'Submit',
                      textColor: Colors.white,
                      backgroundColor: primaryColor1,
                      borderColor: primaryColor1,
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


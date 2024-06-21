import 'package:flutter/material.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/parentDetails.dart';
import 'package:necessities/actors/parent/features/parentHome/presentation/widgets/support_view.dart';
import 'package:necessities/actors/student/features/Home/data/data_source/gat_user_service.dart';
import 'package:necessities/actors/student/features/Home/domain/entitiy/child_entity.dart';
import 'package:necessities/core/resources/user_data.dart';
import 'package:necessities/login/presentation/pages/login_screen.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({
    super.key,
  });

  @override
  State<Drawerr> createState() => _DrawerrState();
}

ChildEntity childEntity = ChildEntity(
    id: '',
    fristName: '',
    secondtName: '',
    motherId: '',
    fatherId: '',
    userName: '',
    userId: '');

class _DrawerrState extends State<Drawerr> {
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future<void> getUserInfo() async {
    childEntity = await fetchUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );

    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ParentDetails(
          textStyle: textStyle,
          childEntity: childEntity,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.4,
            thickness: 0.7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 26),
          child: Row(
            children: [
              SizedBox(
                height: 25,
                width: 24,
                child: Image.asset(
                  'assets/images/Setting.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 33),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'poppins'),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.5,
            thickness: 0.8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 26),
          child: Row(
            children: [
              SizedBox(
                height: 25,
                width: 24,
                child: Image.asset(
                  'assets/images/Info Square.png',
                  fit: BoxFit.fill,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SupportHelpScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 33),
                  child: Text(
                    'Support & Help',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 1,
            thickness: 1,
          ),
        ), //mksl a3ml list view builder
        GestureDetector(
          onTap: () {
            UserData().DeleteData();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 26),
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 24,
                  child: Image.asset(
                    'assets/images/Logout.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins'),
                    ),
                  ),
                ), //mksl a3ml list view builder
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 1,
            thickness: 1,
          ),
        ), //mksl a3ml list view builder
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';
import 'package:necessities/features/TodoList/Presentation/pages/TodoScreen.dart';
import 'package:necessities/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          Image.asset(
            '$logo2',
            height: height * 0.1,
            width: width * 0.3,
          ),
          [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return TodoScreen();
                  }));
                },
                icon: Icon(
                  Icons.notifications,
                  color: primaryColor1,
                ))
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  height: height * 0.06,
                  width: width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Text('Search here',
                          style: Style().title.copyWith(
                              color: Colors.grey.withOpacity(0.5),
                              fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Ahmed Mahmoud,',
              style: Style().title.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Grad 2',
              style: Style().title.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width,
              height: height * 0.22,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            color: Colors.grey.shade50,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: width,
                        height: height * 0.2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/woman.png',
                                width: width * 0.3,
                                height: height * .8,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Arabic', style: Style().title),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'M.Nada ahmed',
                                  style: Style().title.copyWith(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '15/12 08:00 PM',
                                  style: Style().title.copyWith(
                                      fontSize: 18,
                                      color: const Color.fromRGBO(
                                          158, 158, 158, 1)),
                                ),
                                Icon(Icons.arrow_forward_ios),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: width * 0.28,
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: primaryColor1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Add',
                                        style: Style().title.copyWith(
                                            color: Colors.white, fontSize: 18),
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

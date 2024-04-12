import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class ClassesContent extends StatelessWidget {
  const ClassesContent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return GridView.builder(
        physics:const BouncingScrollPhysics(),
        gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            childAspectRatio: 3/2
           ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: width * 0.3,
                    child: Stack(children: [
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Guy Hawking',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Style().title.copyWith(
                                    color: primaryColor3,
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: width * 0.3 / 2 - 25,
                        child:const CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/teacher.png'),
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          );
          /*  */
        });
  }
}

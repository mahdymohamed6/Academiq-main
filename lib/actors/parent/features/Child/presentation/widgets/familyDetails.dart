import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';
import 'package:necessities/core/styles.dart';

class FamilyDetails extends StatelessWidget {
  const FamilyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * .1,
          width: width * 0.4,
          decoration: BoxDecoration(
              color: primaryColor3,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text('Family',
                  style: Style()
                      .title
                      .copyWith(color: Colors.white, fontSize: 18)),
            ),
          ),
        ),
        Container(
          height: height * 0.35,
          width: width * 0.4,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/teacher.png')),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'Cooper leslie',
                                  overflow: TextOverflow.ellipsis,
                                  style: Style().title.copyWith(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );

    /* Column(
      children: [
        Container(
          width: width * 0.4,
          decoration: BoxDecoration(
              color: primaryColor3,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: width,
                height: height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text('Family',
                        style: Style()
                            .title
                            .copyWith(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
              Container(
                height: height * 0.4,
                child: Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/teacher.png')),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Cooper leslie',
                                        overflow: TextOverflow.ellipsis,
                                        style: Style().title.copyWith(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    ); */
  }
}

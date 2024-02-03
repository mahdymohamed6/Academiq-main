import 'package:flutter/material.dart';

class ParetnReportsListViewCard extends StatelessWidget {
  const ParetnReportsListViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Guy Hawkins',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins',
                            color: Color.fromRGBO(42, 43, 44, 1))),
                    SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11),
                      child: Text(
                        'forward statement item',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'poppins',
                            color: Color.fromRGBO(148, 163, 184, 1)),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 8, bottom: 29),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '01:00 AM',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: Color.fromRGBO(148, 163, 184, 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Divider(
            color: Color.fromARGB(255, 198, 197, 197),
            height: 0.4,
            thickness: 0.7,
          ),
        ],
      ),
    );
  }
}

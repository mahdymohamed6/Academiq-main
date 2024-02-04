import 'package:flutter/material.dart';
import 'package:necessities/core/styles.dart';

class Examination extends StatelessWidget {
  const Examination({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context,index){
      return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: height * 0.1,
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 34,
                  color:  Colors.green ,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Examination',
                      style: Style().title.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Arabic',
                      style: Style().title.copyWith(fontSize: 16,
                   color: Colors.grey.withOpacity(0.9)),
                    ),
                  
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12-5-2023',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '17/20',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
    });
  }
}

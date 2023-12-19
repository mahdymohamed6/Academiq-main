import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

PreferredSizeWidget customAppBar(Widget title, List<Widget> action) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: primaryColor1,
        )),
    title: title,
    /*  */
    actions: action
     /*  IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: primaryColor1,
          )) */
    
  );
}

import 'package:flutter/material.dart';
import 'package:necessities/constants.dart';

PreferredSizeWidget customParintAppBar(Widget title, List<Widget> action) {
  return AppBar(
      scrolledUnderElevation: 0,
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
      actions: action);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  String title;
  CustomAppBar(@required this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Column(
        children: [
          /* FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            color: Colors.white,
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
            child: SvgPicture.asset(
              "assets/icons/Back ICon.svg",
              height: 15,
            ),
          ), */
          SizedBox(width: 4),
          Text(title, style:TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}

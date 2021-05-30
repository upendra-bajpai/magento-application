import 'package:flutter/material.dart';
import 'package:magento_mobile/components/coustom_bottom_nav_bar.dart';
import 'package:magento_mobile/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      //https://stackoverflow.com/questions/51652897/how-to-hide-soft-input-keyboard-on-flutter-after-clicking-outside-textfield-anyw?rq=1
      body: GestureDetector(
          child: Body(),
          onTap: () {
            FocusScope.of(context).unfocus();
          }),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

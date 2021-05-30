import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magento_mobile/models/Category.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class ShowMore extends StatelessWidget {
  static String routeName = "/show_more";

  @override
  Widget build(BuildContext context) {
    final CategoryDetailsArgs agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar("Items Listing"),
      body: Body(agrs.category),
    );
  }
}

class CategoryDetailsArgs {
  final DataAttr category;

  CategoryDetailsArgs({@required this.category});
}

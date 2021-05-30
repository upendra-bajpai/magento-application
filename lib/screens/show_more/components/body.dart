import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magento_mobile/models/Category.dart';
import 'package:magento_mobile/screens/show_more/components/show_list.dart';
import 'package:magento_mobile/screens/show_more/reload_prodcuts.dart';
import 'package:magento_mobile/utils.dart';

class Body extends StatelessWidget {
  DataAttr category;
  Body(@required this.category);
  @override
  Widget build(BuildContext context) {
  
    logd("category in show more ${category.id}");
    return SafeArea(
      child: ReloadListView(category.id),//todo:tony category.id
      //child: MoreProducts(),
    );
  }
}

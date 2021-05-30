import 'package:flutter/material.dart';
import 'package:magento_mobile/bloc/products_bloc.dart';
import 'package:magento_mobile/components/product_card.dart';
import 'package:magento_mobile/models/Category.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/screens/show_more/show_more.dart';
import 'package:magento_mobile/utils.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  String data;
  int id;
  PopularProducts(this.data, this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: data,
              press: () {
                Navigator.pushNamed(
            context,
            ShowMore.routeName,
            arguments: CategoryDetailsArgs(category: DataAttr(id:id)),
          );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        listProduct(id)
      ],
    );
  }

  Widget listProduct(int id) {
    return FutureBuilder(
        future:
            ProductsBloc().doGetProductsList("category_id", id.toString(), 10,1),
        builder: (context, AsyncSnapshot<List<Product>> snapShot) {
          logd("products papular -> ${snapShot.data}");
          if (snapShot.hasData) {
            print("listcds ${snapShot.data.length}");
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(snapShot.data.length, (index) {
                      logd(snapShot.data[index].title);
                      return ProductCard(product: snapShot.data[index]);
                    }),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ));
          } else {
            print("listcds ${snapShot.error}");
            return Text("papular products!");
          }
        });
  }
}

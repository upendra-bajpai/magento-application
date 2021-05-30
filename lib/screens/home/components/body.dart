import 'package:flutter/material.dart';
import 'package:magento_mobile/bloc/categories_bloc.dart';
import 'package:magento_mobile/bloc/products_bloc.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/models/categories_models.dart';
import 'package:magento_mobile/models/products_models.dart';
import 'package:magento_mobile/utils.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        HomeHeader(),
        SizedBox(height: getProportionateScreenWidth(10)),
        Categories(),
        DiscountBanner(),
        SpecialOffers(),
        SizedBox(height: getProportionateScreenWidth(30)),
        FutureBuilder(
            future: ProductsBloc().renderProductList(),
            builder:
                (context, AsyncSnapshot<List<CategoriesListModal>> snapShot) {
              if (snapShot.hasData) {
                return Column(
                    children:
                        List<Widget>.generate((snapShot.data.length), (index) {
                  logd("listcdk -> ${snapShot.data[index].productCount} ${snapShot.data[index].id}  ${snapShot.data[index].name}");
                 /**
                  * snapShot.data[index].childrenData.length <= 0 gives last node of category three.
                  * snapShot.data[index].productCount>0  tells if category has data to show.
                  */
                  if (snapShot.data[index].childrenData.length <= 0&&snapShot.data[index].productCount>0)
                    return PopularProducts(snapShot.data[index].name, snapShot.data[index].id);
                  else
                    return Container(height: getProportionateScreenHeight(0));
                }));
              } else
                return Text("categoty error!");
            }),
      ],
    );
  }
}

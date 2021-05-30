import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magento_mobile/bloc/cart_bloc.dart';
import 'package:magento_mobile/bloc/get_cart.dart';
import 'package:magento_mobile/models/Cart.dart';
import 'package:magento_mobile/utils.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
            future: CartBloc().getCartList(),
            builder: (context, AsyncSnapshot<List<Cart>> snapShot) {
              logd("cart data -> ${snapShot.stackTrace}");
              if (snapShot.hasData) {
                return ListView.builder(
                  itemCount: snapShot.data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(snapShot.data[index].product.sku.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          snapShot.data.removeAt(index);
                        });
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(cart: snapShot.data[index]),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Text("Looks like you haven't purcahsed anything"));
              }
            }),
      ),
    );
  }
}

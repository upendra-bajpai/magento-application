import 'package:flutter/material.dart';
import 'package:magento_mobile/models/Cart.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/screens/details/details_screen.dart';
import 'package:magento_mobile/wigetsutils/cache_network_img.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: product),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Material(
                  elevation: 8,
                 borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15)),
                    child: Hero(
                        tag: product.id.toString(),
                        child: imgBuilder(product.images[0],radis: 15)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "\$${product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                    children: [
                      TextSpan(
                          text: " rating ${product.rating}",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

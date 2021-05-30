import 'package:flutter/material.dart';
import 'package:magento_mobile/models/Product.dart';

import 'more_product_widget.dart';

class MoreProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: demoProducts.length,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ProductInfo(product: demoProducts[index])),
          ),
        ),
      ],
    );
  }
}

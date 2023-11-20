import 'dart:async';
import 'package:magento_mobile/bloc/get_cart.dart';
import 'package:magento_mobile/bloc/products_bloc.dart';
import 'package:magento_mobile/models/Cart.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/models/cart_models.dart';
import 'package:magento_mobile/models/products_models.dart';
import 'package:magento_mobile/repository/cart_repository.dart';
import 'package:magento_mobile/utils.dart';

class CartBloc {
  var cartRepo = CartRepository();
  Future<String> createCart() {
    var newCart = cartRepo.doPostCart();
    logd("new cart -> $newCart");
    return newCart;
  }

  ///add product to cart quoteid will be gentated by @link createCart() method.
  Future<CartResponseModal> doAddToCart(String sku, int qty, String quoteId) {
    var cart = CartRequestModals(
        cartItem: CartItem(qty: qty, sku: sku, quoteId: quoteId));
    return cartRepo.doPostCartData(cart.toString());
  }

  Future<List<Cart>> getCartList() {
    List<Cart> cartItems = [];
    Future<List<GetCartModal>> data = cartRepo.getCart();
    //data.then((value) => logd("cart respo => $value"));
    data.then((value) => logd("cart respo -> ${value.length}"));
    return data.then((value) {
      for (var cartData in value)
        ProductsBloc().getProductDetails(cartData.sku).then((cartItem) {
          cartItems.add(Cart(
              numOfItem: cartData.qty,
              product: Product(cartData.itemId, cartItem.sku, cartItem.images,
                  cartItem.title, cartItem.price, cartItem.description)));
        });
      return cartItems;
    });
  }
}

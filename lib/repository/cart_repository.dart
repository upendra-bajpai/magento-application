import 'dart:convert';

import 'package:magento_mobile/bloc/get_cart.dart';
import 'package:magento_mobile/models/cart_models.dart';
import 'package:magento_mobile/network/api_base_helper.dart';
import 'package:magento_mobile/network/end_point.dart';
import 'package:magento_mobile/utils.dart';

class CartRepository {
  ApiBaseHelper _apiClinet = ApiBaseHelper();

  /// create cart here
  Future<String> doPostCart() async{
    String url=club(CART_INIT);
    final response =await _apiClinet.put(url, "");
    return response;
  }
  Future<CartResponseModal> doPostCartData(
     String root) async {
    String url =club(CART_LISTING);
    final response = await _apiClinet.put(url,root);
    //print(response);
    return CartResponseModal.fromJson(response);
  }

   /// show customer cart
   Future<List<GetCartModal>> getCart() async{
     String url =club(CART_LISTING);
     Future<String> data= Sf.getStringValuesSF(USER_TOKEN);
     data.then((value) => logd("token -> $value"));
     ///await to halt execution till token found.
     var header={'Authorization':"Bearer ${await Sf.getStringValuesSF(USER_TOKEN)}",'accept': 'application/json'};
    final response = await _apiClinet.get(Uri.parse(url),headers: header);
    //logd("cart response => $response");
    return (json.decode(jsonEncode(response)) as List).map((i) =>
              GetCartModal.fromJson(i)).toList();
   }
}

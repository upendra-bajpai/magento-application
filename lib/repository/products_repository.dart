import 'dart:convert';
import 'package:magento_mobile/constants.dart';
import 'package:magento_mobile/models/products_models.dart';
import 'package:magento_mobile/network/api_base_helper.dart';
import 'package:magento_mobile/network/end_point.dart';

class ProductsRepository {
  ApiBaseHelper _apiClinet = ApiBaseHelper();
  Future<ProductsModals> doGetProductsList(Map<String, String> root) async {
    Uri url = Uri.parse(club(PRODUCT_LIST));
    //Uri url = Uri.parse("https://run.mocky.io/v3/58b14860-94d9-44b4-8693-4c9036ed680e");
    final params = url.replace(queryParameters: root);
    print("get product my url ->$params");
    final response = await _apiClinet.get(params);
    print("products $response");
    return ProductsModals.fromJson(response);
  }

  Future<Item> doGetProduct(String sku) async {
    ApiBaseHelper _apiClinet = ApiBaseHelper();
    Uri url = Uri.parse(club(PRODUCT_DETAIL+sku));
    //Uri url = Uri.parse("https://run.mocky.io/v3/58b14860-94d9-44b4-8693-4c9036ed680e");
    //print("get product my url ->$params");
    final response = await _apiClinet.get(url);
    print("products $response");
    return Item.fromJson(response);
  }
}

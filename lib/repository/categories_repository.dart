import 'dart:convert';
import 'package:magento_mobile/models/categories_models.dart';
import 'package:magento_mobile/network/api_base_helper.dart';
import 'package:magento_mobile/network/end_point.dart';


class CategoryRepository {
  ApiBaseHelper _apiClinet = ApiBaseHelper();
  Future<CategoriesListModal> doGetCategoriesList(Map<String,String> root) async {
    Uri url = Uri.parse(club(CATEGORIES_LIST));
    final params = url.replace(queryParameters: root);
    final response = await _apiClinet.get(params);
    //print(response);
    return CategoriesListModal.fromJson(jsonEncode(response));
  }

  Future<String> doGetCategoryImg( dynamic catId) async {
    Uri url = Uri.parse(club(CATEGORIES_LIST));
    //final ur = url.replace(queryParameters: root);
    String params = Uri.encodeFull(url.toString() + "/$catId");
    final response = await _apiClinet.get(Uri.parse(params));
    Map<String, dynamic> decode = json.decode(jsonEncode(response));
    Map<String, dynamic> attr = decode["custom_attributes"][0];
    if (attr.containsValue("image")) {
      return BASE_URL_IMG + attr["value"];
    } else
      return "https://i.postimg.cc/gk8CgMbq/ic-men.png";
  }
}

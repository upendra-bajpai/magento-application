import 'dart:async';
import 'package:magento_mobile/bloc/categories_bloc.dart';
import 'package:magento_mobile/constants.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/models/categories_models.dart';
import 'package:magento_mobile/network/end_point.dart';
import 'package:magento_mobile/repository/products_repository.dart';
import 'package:magento_mobile/utils.dart';

class ProductsBloc {
  // create home page request
//https://stackoverflow.com/questions/18423691/dart-how-to-create-a-future-to-return-in-your-own-functions
  Future<List<CategoriesListModal>> renderProductList() {
    CategoriesBloc _catRepo = CategoriesBloc();
    List<CategoriesListModal> _listCategory = List<CategoriesListModal>();
    return _catRepo.doGetCategoriesList(1, 4).then((value) {
      var _chdata = value.childrenData[0].childrenData.length;
      logd("category loop $_chdata");
      for (var rootdata in value.childrenData[0].childrenData) {
        for (var data in rootdata.childrenData) {
          logd("category loop ${data.name}");
          _listCategory.add(data);
        }
      }
      return _listCategory;
    });
    /* var prodcy;
    //var ll= _catRepo.doGetCategoriesList(_resBody).then((value){return value;});
    _catRepo.doGetCategoriesList(1,5).then((value) {
      for (var catId in value.childrenData) {
        print("rams-> ${catId.childrenData[2].childrenData[1].id}");
         doGetProductsList(
            "category_id", 23.toString(), 10);
      }
      print(prodcy);
      return prodcy;
    }); */
    // return Future(_listCategory);
  }

  Future<List<Product>> doGetProductsList(
      String root, String depth, int page, int currentPage) {
    Map<String, String> _resBody = {};
    List<Product> _productsList = <Product>[];
    _resBody["searchCriteria[filterGroups][0][filters][0][field]"] =
        root.toString();
    _resBody["searchCriteria[filterGroups][0][filters][0][value]"] =
        depth.toString();
    /*     _resBody["searchCriteria[filterGroups][0][filters][0][conditionType]"] =
          page.toString(); */
    _resBody["searchCriteria[pageSize]"] = page.toString();
    _resBody["searchCriteria[currentPage]"] = currentPage.toString();
    //String _loginData = json.encode(_resBody);
    //print("dfs $_resBody");
    ProductsRepository _productsRepository = ProductsRepository();
    return _productsRepository.doGetProductsList(_resBody).then((value) {
      //print("dfs ${value.toJson().toString()}");
      for (var products in value.items) {
        List<String> _productsMedia = <String>[];
        var description = "";
        for (var customAttr in products.customAttributes) {
          print("products attr ${customAttr.attributeCode}");
          if (customAttr.attributeCode == "small_image" ||
              customAttr.attributeCode == "thumbnail" ||
              customAttr.attributeCode == "image")
            _productsMedia.add(club(MEDIA_BASE + customAttr.value.toString()));
          logd(
              "media url -> ${club(MEDIA_BASE + customAttr.value.toString())}");
          if (customAttr.attributeCode == "description")
            description = customAttr.value;
        }
        _productsList.add(Product(products.id, products.sku, _productsMedia,
            products.name, products.price.toDouble(), description));
      }

      return _productsList;
    });

  }

    //return productsList;

    Future<Product> getProductDetails(String sku) {
      ProductsRepository _productsRepository = ProductsRepository();
      return _productsRepository.doGetProduct(sku).then((products) {
        List<String> _productsMedia = <String>[];
        var description = "";
        for (var customAttr in products.customAttributes) {
          print("products attr ${customAttr.attributeCode}");
          if (customAttr.attributeCode == "small_image" ||
              customAttr.attributeCode == "thumbnail" ||
              customAttr.attributeCode == "image")
            _productsMedia.add(club(MEDIA_BASE + customAttr.value.toString()));
          logd(
              "media url -> ${club(MEDIA_BASE + customAttr.value.toString())}");
          if (customAttr.attributeCode == "description")
            description = customAttr.value;
        }
         return Product(products.id, products.sku, _productsMedia,
            products.name, products.price.toDouble(), description);
      });
     
    }
}

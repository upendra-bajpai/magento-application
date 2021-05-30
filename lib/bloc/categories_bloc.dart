import 'dart:async';
import 'package:magento_mobile/models/categories_models.dart';
import 'package:magento_mobile/repository/categories_repository.dart';
import 'package:magento_mobile/utils.dart';


class CategoriesBloc {
 Future<CategoriesListModal> doGetCategoriesList(int root,int depth){
     Map<String, String> _resBody={};
    _resBody["rootCategoryId"] = root.toString();
    _resBody["depth"] = depth.toString();//depth>1?depth.toString():2.toString();
     //String _loginData = json.encode(_resBody);
     logd(_resBody);
    CategoryRepository _catRepo=CategoryRepository();
    //var ll= _catRepo.doGetCategoriesList(_resBody).then((value){return value;});
    return _catRepo.doGetCategoriesList(_resBody).then((value) {print(value);return value;} );
  }

   Future<String> doGetCategoryImg(String catId,int storeId){
     var _resBody = {};
    _resBody["storeId"] = storeId>0?storeId:1;
     //String _loginData = json.encode(_resBody);
     logd(_resBody);
    CategoryRepository _catRepo=CategoryRepository();
    //var ll= _catRepo.doGetCategoriesList(_resBody).then((value){return value;});
    return _catRepo.doGetCategoryImg(catId).then((value) {print(value);return value;} );
  }

  
}

//TODO: base url here
  import 'package:magento_mobile/config.dart';

  const String  BASE_URL=BASE_URL_LINK;
  const String  BASE_URL_IMG=BASE_URL;
  const LOGIN_END="/rest/default/V1/integration/customer/token";
  const SIGNUP_END="/rest/default/V1/customers";
  const CATEGORIES_LIST="/rest/all/V1/categories";
  const PRODUCT_LIST="/rest/all/V1/products";
  const CART_INIT="/rest/all/V1/carts/mine";
  const CART_LISTING="/rest/default/V1/carts/mine/items";
  const PRODUCT_DETAIL='/rest/all/V1/products/';

 
 String club(String endPoint){
    return BASE_URL+endPoint;
 }


import 'package:flutter/cupertino.dart';
import 'package:magento_mobile/bloc/products_bloc.dart';
import 'package:magento_mobile/models/Product.dart';
import 'package:magento_mobile/network/end_point.dart';
import 'package:magento_mobile/utils.dart';

class ShowMoreNotifire extends ValueNotifier<List<Product>> {
  ShowMoreNotifire() : super(null);

  int _pageNumber = 1;
  bool _hasMoreProducts = true;
  int _batchesOf = 10;
  //final String _apiUrl = club(PRODUCT_LIST);
  List<Product> _listProducts;
  bool _loading = false;

  @override
  List<Product> get value => _value;
  List<Product> _value;
  @override
  set value(List<Product> newValue) {
    _value = newValue;
    notifyListeners();
  }

  Future<void> reload(String root, String id, int depth) async {
    _listProducts = <Product>[];
    _pageNumber = 1;
    await httpGetProducts(root, id, depth, _pageNumber, false);
  }

  Future<void> getMore(
      String root, String id, int depth, bool direction) async {
    /**
     * @direction =ture load more products
     * @direction =false load previous products
     */
    if (_hasMoreProducts && !_loading) {
      _loading = true;
      await httpGetProducts(root, id, depth, _pageNumber, direction);
      _loading = false;
    }
  }

  Future<void> httpGetProducts(
      String root, String id, int depth, int page, bool direction) async {
    _listProducts = List<Product>();
    int pageNumber = page;
    var productBloc = ProductsBloc();
    if (_hasMoreProducts && pageNumber > 0) {
      _listProducts = await productBloc
          .doGetProductsList(root, id, depth, pageNumber)
          .then((value) => _listProducts = value);
      logd("product list ${_listProducts.length}");
      if (direction)
        _listProducts.length > 0
            ? pageNumber = pageNumber + 1
            : _hasMoreProducts = false;
      else
        _listProducts.length > 0
            ? pageNumber = pageNumber - 1
            : _hasMoreProducts = false;

      logd("whole list ${_listProducts.length} -> $pageNumber");
      _pageNumber = pageNumber;
      value = _listProducts;
    }
    else{
      _pageNumber=1;
    }
  }
}

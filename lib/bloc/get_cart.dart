import 'dart:convert';

import 'package:magento_mobile/utils.dart';

class GetCartModal {
  int itemId;
  String sku;
  int qty;
  String name;
  int price;
  String productType;
  String quoteId;
  ProductOption productOption;

  GetCartModal(
      {this.itemId,
      this.sku,
      this.qty,
      this.name,
      this.price,
      this.productType,
      this.quoteId,
      this.productOption});

  GetCartModal.fromJson(Map<String, dynamic> jsonData) {
    _makeJson(jsonData);
  }

  GetCartModal.formJsonStr(String jsonData){
    Iterable iterable = json.decode(jsonData) as List;
    logd("irt ${iterable.iterator.current}");
     List<GetCartModal>.from(iterable.map((model) => GetCartModal.fromJson(model)));
  }

  _makeJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    sku = json['sku'];
    qty = json['qty'];
    name = json['name'];
    price = json['price'];
    productType = json['product_type'];
    quoteId = json['quote_id'];
    productOption = json['product_option'] != null
        ? new ProductOption.fromJson(json['product_option'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['sku'] = this.sku;
    data['qty'] = this.qty;
    data['name'] = this.name;
    data['price'] = this.price;
    data['product_type'] = this.productType;
    data['quote_id'] = this.quoteId;
    if (this.productOption != null) {
      data['product_option'] = this.productOption.toJson();
    }
    return data;
  }
}

class ProductOption {
  ExtensionAttributes extensionAttributes;

  ProductOption({this.extensionAttributes});

  ProductOption.fromJson(Map<String, dynamic> json) {
    extensionAttributes = json['extension_attributes'] != null
        ? new ExtensionAttributes.fromJson(json['extension_attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.extensionAttributes != null) {
      data['extension_attributes'] = this.extensionAttributes.toJson();
    }
    return data;
  }
}

class ExtensionAttributes {
  List<ConfigurableItemOptions> configurableItemOptions;

  ExtensionAttributes({this.configurableItemOptions});

  ExtensionAttributes.fromJson(Map<String, dynamic> json) {
    if (json['configurable_item_options'] != null) {
      configurableItemOptions = new List<ConfigurableItemOptions>();
      json['configurable_item_options'].forEach((v) {
        configurableItemOptions.add(new ConfigurableItemOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.configurableItemOptions != null) {
      data['configurable_item_options'] =
          this.configurableItemOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConfigurableItemOptions {
  String optionId;
  int optionValue;

  ConfigurableItemOptions({this.optionId, this.optionValue});

  ConfigurableItemOptions.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    optionValue = json['option_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    data['option_value'] = this.optionValue;
    return data;
  }
  
}

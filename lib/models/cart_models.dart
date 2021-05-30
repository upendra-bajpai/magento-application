// To parse this JSON data, do
//
//     final productsModals = productsModalsFromJson(jsonString);

import 'dart:convert';

class CartRequestModals {
    CartRequestModals({
        this.cartItem,
    });

    final CartItem cartItem;

    factory CartRequestModals.fromRawJson(String str) => CartRequestModals.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartRequestModals.fromJson(Map<String, dynamic> json) => CartRequestModals(
        cartItem: CartItem.fromJson(json["cartItem"]),
    );

    Map<String, dynamic> toJson() => {
        "cartItem": cartItem.toJson(),
    };
}

class CartItem {
    CartItem({
        this.sku,
        this.qty,
        this.quoteId,
    });

    final String sku;
    final int qty;
    final String quoteId;

    factory CartItem.fromRawJson(String str) => CartItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        sku: json["sku"],
        qty: json["qty"],
        quoteId: json["quote_id"],
    );

    Map<String, dynamic> toJson() => {
        "sku": sku,
        "qty": qty,
        "quote_id": quoteId,
    };
}



//cart response modal

// To parse this JSON data, do
//
//     final cartResponseModal = cartResponseModalFromJson(jsonString);


class CartResponseModal {
    CartResponseModal({
        this.itemId,
        this.sku,
        this.qty,
        this.name,
        this.price,
        this.productType,
        this.quoteId,
    });

    final int itemId;
    final String sku;
    final int qty;
    final String name;
    final double price;
    final String productType;
    final String quoteId;

    factory CartResponseModal.fromRawJson(String str) => CartResponseModal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartResponseModal.fromJson(Map<String, dynamic> json) => CartResponseModal(
        itemId: json["item_id"],
        sku: json["sku"],
        qty: json["qty"],
        name: json["name"],
        price: json["price"].toDouble(),
        productType: json["product_type"],
        quoteId: json["quote_id"],
    );

    Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "sku": sku,
        "qty": qty,
        "name": name,
        "price": price,
        "product_type": productType,
        "quote_id": quoteId,
    };
}

// To parse this JSON data, do
//
//     final productsModals = productsModalsFromJson(jsonString);

import 'dart:convert';

ProductsModals productsModalsFromJson(String str) => ProductsModals.fromJson(json.decode(str));

String productsModalsToJson(ProductsModals data) => json.encode(data.toJson());

class ProductsModals {
    ProductsModals({
        this.items,
        this.searchCriteria,
        this.totalCount,
    });

    List<Item> items;
    SearchCriteria searchCriteria;
    int totalCount;

    factory ProductsModals.fromJson(Map<String, dynamic> json) => ProductsModals(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
        totalCount: json["total_count"],
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "search_criteria": searchCriteria.toJson(),
        "total_count": totalCount,
    };
}

class Item {
    Item({
        this.id,
        this.sku,
        this.name,
        this.attributeSetId,
        this.price,
        this.status,
        this.visibility,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.weight,
        this.extensionAttributes,
        this.productLinks,
        this.options,
        this.mediaGalleryEntries,
        this.tierPrices,
        this.customAttributes,
    });

    int id;
    String sku;
    String name;
    int attributeSetId;
    num price;
    int status;
    int visibility;
    String typeId;
    DateTime createdAt;
    DateTime updatedAt;
    int weight;
    ExtensionAttributes extensionAttributes;
    List<dynamic> productLinks;
    List<dynamic> options;
    List<MediaGalleryEntry> mediaGalleryEntries;
    List<dynamic> tierPrices;
    List<CustomAttribute> customAttributes;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        attributeSetId: json["attribute_set_id"],
        price: json["price"]==null?0.0:json["price"],
        status: json["status"],
        visibility: json["visibility"],
        typeId: json["type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        weight: json["weight"],
        extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
        productLinks: List<dynamic>.from(json["product_links"].map((x) => x)),
        options: List<dynamic>.from(json["options"].map((x) => x)),
        mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromJson(x))),
        tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
        customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "name": name,
        "attribute_set_id": attributeSetId,
        "price": price,
        "status": status,
        "visibility": visibility,
        "type_id": typeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "weight": weight,
        "extension_attributes": extensionAttributes.toJson(),
        "product_links": List<dynamic>.from(productLinks.map((x) => x)),
        "options": List<dynamic>.from(options.map((x) => x)),
        "media_gallery_entries": List<dynamic>.from(mediaGalleryEntries.map((x) => x.toJson())),
        "tier_prices": List<dynamic>.from(tierPrices.map((x) => x)),
        "custom_attributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
    };
}

class CustomAttribute {
    CustomAttribute({
        this.attributeCode,
        this.value,
    });

    String attributeCode;
    dynamic value;

    factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
        attributeCode: json["attribute_code"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "attribute_code": attributeCode,
        "value": value,
    };
}

class ExtensionAttributes {
    ExtensionAttributes({
        this.websiteIds,
        this.categoryLinks,
    });

    List<int> websiteIds;
    List<CategoryLink> categoryLinks;

    factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
        websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
        categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "website_ids": List<dynamic>.from(websiteIds.map((x) => x)),
        "category_links": List<dynamic>.from(categoryLinks.map((x) => x.toJson())),
    };
}

class CategoryLink {
    CategoryLink({
        this.position,
        this.categoryId,
    });

    int position;
    String categoryId;

    factory CategoryLink.fromJson(Map<String, dynamic> json) => CategoryLink(
        position: json["position"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "position": position,
        "category_id": categoryId,
    };
}

class MediaGalleryEntry {
    MediaGalleryEntry({
        this.id,
        this.mediaType,
        this.label,
        this.position,
        this.disabled,
        this.types,
        this.file,
    });

    int id;
    String mediaType;
    String label;
    int position;
    bool disabled;
    List<String> types;
    String file;

    factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) => MediaGalleryEntry(
        id: json["id"],
        mediaType: json["media_type"],
        label: json["label"],
        position: json["position"],
        disabled: json["disabled"],
        types: List<String>.from(json["types"].map((x) => x)),
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "media_type": mediaType,
        "label": label,
        "position": position,
        "disabled": disabled,
        "types": List<dynamic>.from(types.map((x) => x)),
        "file": file,
    };
}

class SearchCriteria {
    SearchCriteria({
        this.filterGroups,
        this.pageSize,
    });

    List<FilterGroup> filterGroups;
    int pageSize;

    factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
        filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
        pageSize: json["page_size"],
    );

    Map<String, dynamic> toJson() => {
        "filter_groups": List<dynamic>.from(filterGroups.map((x) => x.toJson())),
        "page_size": pageSize,
    };
}

class FilterGroup {
    FilterGroup({
        this.filters,
    });

    List<Filter> filters;

    factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
        filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
    };
}

class Filter {
    Filter({
        this.field,
        this.value,
        this.conditionType,
    });

    String field;
    String value;
    String conditionType;

    factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        field: json["field"],
        value: json["value"],
        conditionType: json["condition_type"],
    );

    Map<String, dynamic> toJson() => {
        "field": field,
        "value": value,
        "condition_type": conditionType,
    };
}

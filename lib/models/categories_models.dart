// To parse this JSON data, do
//
//     final categoriesListModal = categoriesListModalFromMap(jsonString);

import 'dart:convert';

class CategoriesListModal {
  CategoriesListModal({
    required this.id,
    required this.parentId,
    required this.name,
    required this.isActive,
    required this.position,
    required this.level,
    required this.productCount,
    required this.childrenData,
  });

  int id;
  int parentId;
  String name;
  bool isActive;
  int position;
  int level;
  int productCount;
  List<CategoriesListModal> childrenData;

  factory CategoriesListModal.fromJson(String str) =>
      CategoriesListModal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesListModal.fromMap(Map<String, dynamic> json) =>
      CategoriesListModal(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        position: json["position"],
        level: json["level"],
        productCount: json["product_count"],
        childrenData: List<CategoriesListModal>.from(
            json["children_data"].map((x) => CategoriesListModal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "is_active": isActive == null ? null : isActive,
        "position": position,
        "level": level,
        "product_count": productCount,
        "children_data": List<dynamic>.from(childrenData.map((x) => x.toMap())),
      };
}

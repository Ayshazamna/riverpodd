// To parse this JSON data, do
//
//     final shapeList = shapeListFromJson(jsonString);

import 'dart:convert';

List<ShapeList> shapeListFromJson(String str) => List<ShapeList>.from(json.decode(str).map((x) => ShapeList.fromJson(x)));

String shapeListToJson(List<ShapeList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShapeList {
  int? id;
  int? filterGroupId;
  String? name;
  String? image;
  int? sortOrder;

  ShapeList({
    this.id,
    this.filterGroupId,
    this.name,
    this.image,
    this.sortOrder,
  });

  factory ShapeList.fromJson(Map<String, dynamic> json) => ShapeList(
    id: json["id"],
    filterGroupId: json["filter_group_id"],
    name: json["name"],
    image: json["image"],
    sortOrder: json["sort_order"],
  );

 String get fullImageUrl => 'https://api.hanzprellet.com/storage/$image';



  Map<String, dynamic> toJson() => {
    "id": id,
    "filter_group_id": filterGroupId,
    "name": name,
    "image": image,
    "sort_order": sortOrder,
  };
}

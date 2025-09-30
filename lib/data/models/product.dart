// To parse this JSON data, do
//
//     final productt = producttFromJson(jsonString);

import 'dart:convert';

List<Productt> producttFromJson(String str) => List<Productt>.from(json.decode(str).map((x) => Productt.fromJson(x)));

String producttToJson(List<Productt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productt {
  int? id;
  String? pageKey;
  String? name;
  String? model;
  int? manufacture;
  String? productType;
  String? description;
  String? seoTitle;
  String? seoContent;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? tags;
  int? varient;
  String? image;
  int? material;
  int? frameType;
  int? price;
  int? quantity;
  int? sortOrder;
  int? minimum;
  Status? status;
  String? completeStatus;
  int? outOfStock;
  int? lenseOnly;
  int? isSunglass;
  int? prescriptionStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? category;
  List<Image>? images;
  List<ColorOption>? colorOptions;

  Productt({
    this.id,
    this.pageKey,
    this.name,
    this.model,
    this.manufacture,
    this.productType,
    this.description,
    this.seoTitle,
    this.seoContent,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.tags,
    this.varient,
    this.image,
    this.material,
    this.frameType,
    this.price,
    this.quantity,
    this.sortOrder,
    this.minimum,
    this.status,
    this.completeStatus,
    this.outOfStock,
    this.lenseOnly,
    this.isSunglass,
    this.prescriptionStatus,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.images,
    this.colorOptions,
  });

  factory Productt.fromJson(Map<String, dynamic> json) => Productt(
    id: json["id"],
    pageKey: json["page_key"],
    name: json["name"],
    model: json["model"],
    manufacture: json["manufacture"],
    productType: json["product_type"],
    description: json["description"],
    seoTitle: json["seo_title"],
    seoContent: json["seo_content"],
    metaTitle: json["meta_title"],
    metaKeyword: json["meta_keyword"],
    metaDescription: json["meta_description"],
    tags: json["tags"],
    varient: json["varient"],
    image: json["image"],
    material: json["material"],
    frameType: json["frame_type"],
    price: json["price"],
    quantity: json["quantity"],
    sortOrder: json["sort_order"],
    minimum: json["minimum"],
    status: statusValues.map[json["status"]]!,
    completeStatus: json["complete_status"],
    outOfStock: json["out_of_stock"],
    lenseOnly: json["lense_only"],
    isSunglass: json["is_sunglass"],
    prescriptionStatus: json["prescription_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    category: json["category"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    colorOptions: json["colorOptions"] == null ? [] : List<ColorOption>.from(json["colorOptions"]!.map((x) => ColorOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page_key": pageKey,
    "name": name,
    "model": model,
    "manufacture": manufacture,
    "product_type": productType,
    "description": description,
    "seo_title": seoTitle,
    "seo_content": seoContent,
    "meta_title": metaTitle,
    "meta_keyword": metaKeyword,
    "meta_description": metaDescription,
    "tags": tags,
    "varient": varient,
    "image": image,
    "material": material,
    "frame_type": frameType,
    "price": price,
    "quantity": quantity,
    "sort_order": sortOrder,
    "minimum": minimum,
    "status": statusValues.reverse[status],
    "complete_status": completeStatus,
    "out_of_stock": outOfStock,
    "lense_only": lenseOnly,
    "is_sunglass": isSunglass,
    "prescription_status": prescriptionStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category": category,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "colorOptions": colorOptions == null ? [] : List<dynamic>.from(colorOptions!.map((x) => x.toJson())),
  };
}

class ColorOption {
  int? id;
  int? productId;
  int? quantity;
  double? price;
  DiscountType? discountType;
  int? discount;
  dynamic startDate;
  dynamic endDate;
  String? seoTitle;
  String? seoContent;
  String? metaTitle;
  String? metaDescription;
  Status? status;
  String? optionValue;
  String? optionImage;
  int? optionValueId;

  ColorOption({
    this.id,
    this.productId,
    this.quantity,
    this.price,
    this.discountType,
    this.discount,
    this.startDate,
    this.endDate,
    this.seoTitle,
    this.seoContent,
    this.metaTitle,
    this.metaDescription,
    this.status,
    this.optionValue,
    this.optionImage,
    this.optionValueId,
  });

  factory ColorOption.fromJson(Map<String, dynamic> json) => ColorOption(
    id: json["id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    price: json["price"]?.toDouble(),
    discountType: discountTypeValues.map[json["discount_type"]]!,
    discount: json["discount"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    seoTitle: json["seo_title"],
    seoContent: json["seo_content"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    status: statusValues.map[json["status"]]!,
    optionValue: json["option_value"],
    optionImage: json["optionImage"],
    optionValueId: json["option_value_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "quantity": quantity,
    "price": price,
    "discount_type": discountTypeValues.reverse[discountType],
    "discount": discount,
    "start_date": startDate,
    "end_date": endDate,
    "seo_title": seoTitle,
    "seo_content": seoContent,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "status": statusValues.reverse[status],
    "option_value": optionValue,
    "optionImage": optionImage,
    "option_value_id": optionValueId,
  };
}

enum DiscountType {
  FIXED
}

final discountTypeValues = EnumValues({
  "fixed": DiscountType.FIXED
});

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class Image {
  int? id;
  int? productId;
  int? optionValueId;
  String? image;
  ImageType? imageType;
  int? sortOrder;

  Image({
    this.id,
    this.productId,
    this.optionValueId,
    this.image,
    this.imageType,
    this.sortOrder,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    productId: json["product_id"],
    optionValueId: json["option_value_id"],
    image: json["image"],
    imageType: imageTypeValues.map[json["image_type"]]!,
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "option_value_id": optionValueId,
    "image": image,
    "image_type": imageTypeValues.reverse[imageType],
    "sort_order": sortOrder,
  };
}

enum ImageType {
  DEFAULT,
  NORMAL,
  SIDE,
  TRY_ON
}

final imageTypeValues = EnumValues({
  "default": ImageType.DEFAULT,
  "normal": ImageType.NORMAL,
  "side": ImageType.SIDE,
  "try_on": ImageType.TRY_ON
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

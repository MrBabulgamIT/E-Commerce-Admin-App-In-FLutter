import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.icon,
  });

  int? id;
  String? name;
  String? image;
  String? icon;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        icon: json["icon"],
      );
}

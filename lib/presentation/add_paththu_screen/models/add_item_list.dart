import 'dart:convert';

AddItemModel addItemModelFromJson(String str) => AddItemModel.fromJson(json.decode(str));

String addItemModelToJson(AddItemModel data) => json.encode(data.toJson());

class AddItemModel {
  String id;
  String name;

  AddItemModel({
    required this.id,
    required this.name,
  });

  factory AddItemModel.fromJson(Map<String, dynamic> json) => AddItemModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
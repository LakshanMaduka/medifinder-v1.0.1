import '../../../core/app_export.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_five_screen],
/// and is typically used to hold data that is passed between different parts of the application.
import 'dart:convert';

AddMedicineModel addMedicineModelFromJson(String str) => AddMedicineModel.fromJson(json.decode(str));

String addMedicineModelToJson(AddMedicineModel data) => json.encode(data.toJson());

class AddMedicineModel {
  String name;
  String rackNumber;
  String? description;
  String? usage;
  String? imgUrl;
  String? id;

  AddMedicineModel({
   required this.name,
    required  this.rackNumber,
    this.description,
    this.usage,
    this.imgUrl,
    this.id
  });

  factory AddMedicineModel.fromJson(Map<String, dynamic> json) => AddMedicineModel(
    name: json["name"],
    rackNumber: json["rack_number"],
    description: json["description"],
    usage: json["usage"],
    imgUrl: json["img_url"],
    id: json["id"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rack_number": rackNumber,
    "description": description,
    "usage": usage,
    "img_url": imgUrl,
    "id": id
  };
}


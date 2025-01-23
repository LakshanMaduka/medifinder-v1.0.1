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
  List<String>? places;
  List<Sellers>? sellers;

  AddMedicineModel({
   required this.name,
    required  this.rackNumber,
    this.description,
    this.usage,
    this.imgUrl,
    this.id,
    this.sellers,
    this.places,
  });

  factory AddMedicineModel.fromJson(Map<String, dynamic> json) => AddMedicineModel(
    name: json["name"],
    rackNumber: json["rack_number"],
    description: json["description"],
    usage: json["usage"],
    imgUrl: json["img_url"],
      sellers: (json["sellers"] as List<dynamic>?)
          ?.map((x) => Sellers.fromJson(x))
          .toList() ?? [],
    places: json["places"] != null && json["places"].isNotEmpty ?  List<String>.from(json["places"].map((x) => x)):[],

    id: json["id"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rack_number": rackNumber,
    "description": description,
    "usage": usage,
    "img_url": imgUrl,
    "sellers": List<dynamic>.from(
        sellers?.map((x) => x.toJson()) ?? []),
    "places": places!.isNotEmpty ? List<dynamic>.from(places!.map((x) => x)):[],
    
  };
}




class Sellers {
  String? name;
  String? contactNumber;
  String? location;

  Sellers({
     this.name,
     this.contactNumber,
     this.location,
  });

  factory Sellers.fromJson(Map<String, dynamic> json) => Sellers(
    name: json["name"],
    contactNumber: json["contact-number"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contact-number": contactNumber,
    "location": location,
  };
}
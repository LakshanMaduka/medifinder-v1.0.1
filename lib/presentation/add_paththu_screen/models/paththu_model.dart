import 'dart:convert';



class PaththuModel {
  String? name;
  String? howToMake;
  List<String>? ingredients = [];

  PaththuModel({
    this.name,
    this.howToMake,
    this.ingredients,
  });

  factory PaththuModel.fromJson(Map<String, dynamic> json) => PaththuModel(
    name: json["name"],
    howToMake: json["how_to_make"],
    ingredients: json["ingredients"] != null ? List<String>.from(json["ingredients"].map((x) => x)):null,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "how_to_make": howToMake,
    "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
  };
}
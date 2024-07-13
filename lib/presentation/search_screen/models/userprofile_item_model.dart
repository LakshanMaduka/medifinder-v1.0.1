import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel(
      {this.nameText,
      this.aloeVeraText,
      this.rackNoText,
      this.e260text,
      this.id}) {
    nameText = nameText ?? Rx("Name :");
    aloeVeraText = aloeVeraText ?? Rx("Aloe vera ");
    rackNoText = rackNoText ?? Rx("Rack No :");
    e260text = e260text ?? Rx("E - 260");
    id = id ?? Rx("");
  }

  Rx<String>? nameText;

  Rx<String>? aloeVeraText;

  Rx<String>? rackNoText;

  Rx<String>? e260text;

  Rx<String>? id;
}

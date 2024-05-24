import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreenModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        nameText: "Name :".obs,
        aloeVeraText: "Aloe vera ".obs,
        rackNoText: "Rack No :".obs,
        e260text: "E - 260".obs),
    UserprofileItemModel(
        nameText: "Name :".obs,
        aloeVeraText: "Aloe vera ".obs,
        rackNoText: "Rack No :".obs,
        e260text: "E - 260".obs),
    UserprofileItemModel(
        nameText: "Name :".obs,
        aloeVeraText: "Aloe vera ".obs,
        rackNoText: "Rack No :".obs,
        e260text: "E - 260".obs)
  ]);
}

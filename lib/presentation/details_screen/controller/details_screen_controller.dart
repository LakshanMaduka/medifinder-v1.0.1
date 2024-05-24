import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';

import '../../../core/app_export.dart';
import '../models/details_screen_model.dart';

/// A controller class for the Iphone1415ProMaxFourScreen.
///
/// This class manages the state of the Iphone1415ProMaxFourScreen, including the
/// current iphone1415ProMaxFourModelObj
class DetailsScreenController extends GetxController {
  Rx<DetailsScreenModel> iphone1415ProMaxFourModelObj =
      DetailsScreenModel().obs;
AddMedicineModel? dataModel;
  @override
  void onInit() {
    super.onInit();
    dataModel = Get.arguments;
  }
}

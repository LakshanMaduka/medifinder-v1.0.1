import '../../../core/app_export.dart';
import '../controller/add_medicine_controller.dart';

/// A binding class for the Iphone1415ProMaxFiveScreen.
///
/// This class ensures that the Iphone1415ProMaxFiveController is created when the
/// Iphone1415ProMaxFiveScreen is first loaded.
class AddMedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMedicineController());
  }
}

import '../../../core/app_export.dart';
import '../controller/details_screen_controller.dart';

/// A binding class for the Iphone1415ProMaxFourScreen.
///
/// This class ensures that the Iphone1415ProMaxFourController is created when the
/// Iphone1415ProMaxFourScreen is first loaded.
class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsScreenController());
  }
}

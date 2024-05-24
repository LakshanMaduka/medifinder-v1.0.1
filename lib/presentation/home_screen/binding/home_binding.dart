import '../../../core/app_export.dart';
import '../controller/home_controller.dart';

/// A binding class for the Iphone1415ProMaxThreeScreen.
///
/// This class ensures that the Iphone1415ProMaxThreeController is created when the
/// Iphone1415ProMaxThreeScreen is first loaded.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

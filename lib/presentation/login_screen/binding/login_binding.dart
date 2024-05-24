import '../../../core/app_export.dart';
import '../controller/login_controller.dart';

/// A binding class for the Iphone1415ProMaxTwoScreen.
///
/// This class ensures that the Iphone1415ProMaxTwoController is created when the
/// Iphone1415ProMaxTwoScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

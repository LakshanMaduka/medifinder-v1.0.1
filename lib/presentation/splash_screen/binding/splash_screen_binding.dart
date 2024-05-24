
import 'package:medifinder/presentation/splash_screen/controller/splash_screen_controller.dart';

import '../../../core/app_export.dart';

/// A binding class for the Iphone1415ProMaxOneScreen.
///
/// This class ensures that the Iphone1415ProMaxOneController is created when the
/// Iphone1415ProMaxOneScreen is first loaded.
class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}

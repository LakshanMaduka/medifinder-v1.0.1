import '../../../core/app_export.dart';
import '../controller/search_controller.dart';

/// A binding class for the Iphone1415ProMaxThreeScreen.
///
/// This class ensures that the Iphone1415ProMaxThreeController is created when the
/// Iphone1415ProMaxThreeScreen is first loaded.
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenController());
  }
}

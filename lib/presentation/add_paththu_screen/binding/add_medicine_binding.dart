import '../../../core/app_export.dart';
import '../../search_screen/controller/search_controller.dart';
import '../controller/add_paththu_controller.dart';

/// A binding class for the Iphone1415ProMaxFiveScreen.
///
/// This class ensures that the Iphone1415ProMaxFiveController is created when the
/// Iphone1415ProMaxFiveScreen is first loaded.
class AddPaththuBinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync(() async => await SearchScreenController());
    Get.lazyPut(() => AddPaththuController());
  }
}

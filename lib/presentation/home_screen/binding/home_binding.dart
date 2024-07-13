import 'package:get/get.dart';
import 'package:medifinder/presentation/home_screen/controller/home_controller.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
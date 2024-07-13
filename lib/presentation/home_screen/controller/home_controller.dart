import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  User? user;
  void onInit() {
    user = Get.arguments ;
    super.onInit();
  }
  Future<void> logoutGoogle() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
  }
}
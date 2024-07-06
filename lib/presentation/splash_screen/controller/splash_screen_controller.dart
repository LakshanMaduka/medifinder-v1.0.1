import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/app_export.dart';
import '../models/splash_screen_model.dart';

/// A controller class for the Iphone1415ProMaxOneScreen.
///
/// This class manages the state of the Iphone1415ProMaxOneScreen, including the
/// current iphone1415ProMaxOneModelObj
class SplashScreenController extends GetxController {

User? getUser;
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Get.offAllNamed(AppRoutes.loginScreen,);
        } else {
          getUser = user;
         Get.offAllNamed(AppRoutes.homeScreen,arguments: user);
        }
      });
    });
  }
}

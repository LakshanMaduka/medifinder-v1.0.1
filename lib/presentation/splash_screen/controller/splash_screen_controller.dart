import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medifinder/routes/app_routes.dart';


import '../models/splash_screen_model.dart';


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

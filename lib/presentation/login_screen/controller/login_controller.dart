import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app_export.dart';
import '../models/login_model.dart';

/// A controller class for the Iphone1415ProMaxTwoScreen.
///
/// This class manages the state of the Iphone1415ProMaxTwoScreen, including the
/// current iphone1415ProMaxTwoModelObj
class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
RxBool isLoading = false.obs;
  void logging()async{
    isLoading.value = true;
    var user = await signInWithGoogle();
    isLoading.value = false;
    if(user.user != null){
      Get.toNamed(AppRoutes.homeScreen, arguments: user.user);
    }
  }


  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back(); // navigate to your wanted page after logout.
  }

}

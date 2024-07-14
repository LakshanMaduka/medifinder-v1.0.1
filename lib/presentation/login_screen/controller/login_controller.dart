import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medifinder/core/data/api_client.dart';
import 'package:medifinder/core/helper/exeption_helpaer.dart';

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
  List<String> medicineData = [];
  final pref = Get.find<PrefUtils>();
  Future<void> getDetails() async {
    isLoading.value = true;
    try{
      QuerySnapshot querySnapshot = await Get.find<ApiClient>().getMedicines();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> dataWithId = {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>
        };
        medicineData.add(jsonEncode(dataWithId));
        pref.setMedicineData(medicineData);
        isLoading.value = false;
      });
    }catch(e){
      isLoading.value = false;
      rethrow;

    }

  }

RxBool isLoading = false.obs;
  void logging()async{
    isLoading.value = true;
    try{
      var user = await signInWithGoogle();

      if(user.user != null){
        getDetails();
        Get.toNamed(AppRoutes.homeScreen, arguments: user.user);
      }
      isLoading.value = false;
    }catch(e){
      ExceptionHandler(e);
      isLoading.value = false;
    }
  }


  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back(); // navigate to your wanted page after logout.
  }

}

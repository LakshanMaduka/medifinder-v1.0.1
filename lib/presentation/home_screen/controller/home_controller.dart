import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import '../../../core/app_export.dart';
import '../models/home_screen_model.dart';

/// A controller class for the Iphone1415ProMaxThreeScreen.
///
/// This class manages the state of the Iphone1415ProMaxThreeScreen, including the
/// current iphone1415ProMaxThreeModelObj
class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  CollectionReference medicines = FirebaseFirestore.instance.collection('medicines');

  Rx<HomeScreenModel> iphone1415ProMaxThreeModelObj =
      HomeScreenModel().obs;
   User? user;

  RxList<AddMedicineModel> foundMedicine = <AddMedicineModel>[].obs;
  RxBool isNameSelected = true.obs;
  RxBool isRackSelected = false.obs;
  RxList<AddMedicineModel> dataList = <AddMedicineModel>[].obs;
  RxBool isLoading =false.obs;
@override
  void onInit() {
  user = Get.arguments ;
    super.onInit();
    print('home');
  }
  List<AddMedicineModel> temp  =[];
  @override
  void onReady() async{
  await getDetails().then((value) => foundMedicine = dataList);


  temp = dataList.value;
    super.onReady();
  }

Future<void> getDetails() async {
 isLoading.value = true;
  FirebaseFirestore.instance.collection('medicines').get()
      .then((QuerySnapshot querySnapshot) {
    isLoading.value = false;
    querySnapshot.docs.forEach((doc) {
      AddMedicineModel modelData = AddMedicineModel(
          name: doc["name"],
          rackNumber: doc["rack_number"],
        description: doc["description"],
        imgUrl: doc['img_url'],
        usage: doc['usage']

      );
      dataList.add(modelData);
    });

  }).catchError((e){
    isLoading.value = false;
    ShowDialog.errorDialog();
  });
}



void filterName(String name){
  //List<AddMedicineModel> result =[];

  if(name.isEmpty){
    foundMedicine.value = temp;

  }else{
    if(isNameSelected.value){
      foundMedicine.value = dataList.where((element) => element.name.toString().toLowerCase().contains(name.toLowerCase().trim())).toList();
    }else{
      foundMedicine.value = dataList.where((element) => element.rackNumber.toString().toLowerCase().contains(name.toLowerCase().trim())).toList();
    }

  }

}
  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();






  Future<void> logoutGoogle() async {
    await googleSignIn.signOut().then((value) {
      Get.offAllNamed(AppRoutes.loginScreen);
    });
     // navigate to your wanted page after logout.
  }
}

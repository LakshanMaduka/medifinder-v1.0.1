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
class SearchScreenController extends GetxController {
  // TextEditingController searchController = TextEditingController();
  CollectionReference medicines = FirebaseFirestore.instance.collection('medicines');


  User? user;

  RxList<AddMedicineModel> foundMedicine = <AddMedicineModel>[].obs;
  RxBool isNameSelected = true.obs;
  RxBool isRackSelected = false.obs;
  RxList<AddMedicineModel> dataList = <AddMedicineModel>[].obs;
  RxBool isLoading =false.obs;

  Rx<TextEditingController> searchText = TextEditingController().obs;
  @override
  void onInit() {
    user = Get.arguments ;
    super.onInit();

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

      querySnapshot.docs.forEach((doc) {
        AddMedicineModel modelData = AddMedicineModel(
            name: doc["name"],
            rackNumber: doc["rack_number"],
            description: doc["description"],
            imgUrl: doc['img_url'],
            usage: doc['usage']

        );
        dataList.add(modelData);
        isLoading.value = false;
      });

    }).catchError((e){
      isLoading.value = false;
      ShowDialog.errorDialog();
    });
  }


  List<AddMedicineModel> foundMedicines =[];
  void filterName(){
    String name = searchText.value.text;
    //List<AddMedicineModel> result =[];
    if(name.isEmpty){
      foundMedicine.value = temp;
    }else{
      if(isNameSelected.value){


        // foundMedicine.value = dataList.firstWhere((element) => element.name.trim().contains(name.trim()));
        // Clear previous search results

        //     // Perform search by filtering Sinhala words that contain the query
        foundMedicine.value = dataList.where((word) => word.name.toLowerCase().trim().contains(name.toLowerCase().trim()))
            .toList();
        print(foundMedicine.value);
      }else{
        foundMedicine.value = dataList.where((element) => element.rackNumber.toString().contains(name.trim())).toList();
      }
    }
  }
  // @override
  // void onClose() {
  //   super.onClose();
  //   searchText.value.dispose();
  // }
  final GoogleSignIn googleSignIn = GoogleSignIn();


}

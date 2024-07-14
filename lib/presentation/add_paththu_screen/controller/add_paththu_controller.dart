
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';
import 'package:medifinder/presentation/add_paththu_screen/models/paththu_model.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';
import '../../../core/app_export.dart';
import '../models/add_item_list.dart';


class AddPaththuController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController howToMakeController = TextEditingController();

  TextEditingController searchText = TextEditingController();


  RxBool isLoading = false.obs;
  RxList<AddMedicineModel> foundMedicine = <AddMedicineModel>[].obs;
  List<AddMedicineModel> temp = <AddMedicineModel>[];
  RxList<AddMedicineModel> dataList = <AddMedicineModel>[].obs;
  @override
  void onReady() async{

    super.onReady();
    dataList.value = await SearchScreenController().getDataFromPref();
    foundMedicine = dataList;
    temp = dataList.value;
  }
  void filterName(){
    String name = searchText.text;
    //List<AddMedicineModel> result =[];
    if(name.isEmpty){
      foundMedicine.value = temp;

    }else{
        foundMedicine.value = dataList.where((word) => word.name.toLowerCase().trim().contains(name.toLowerCase().trim()))
            .toList();

    }
  }
  RxList<AddItemModel> items =<AddItemModel>[].obs;
  CollectionReference paththu =
  FirebaseFirestore.instance.collection('paththu');
  void addPaththuToWeb(){
    final paththuItem = PaththuModel(
      name: nameController.text,
      howToMake: howToMakeController.text,
      ingredients: items.map((e) => e.id).toList(),
    );
    isLoading.value = true;
    try{
      paththu.add(paththuItem.toJson()).then((value) {
        isLoading.value = false;
        Get.snackbar("Success", "Paththu added successfully");
        clearTextFields();
      });
    }catch(e){
      isLoading.value = false;
      rethrow;
    }
  }



void addToTheList(String neme, String id){
   items.add(AddItemModel(name: neme, id: id));
print(items);

}

  void clearTextFields() {
    nameController.clear();
    howToMakeController.clear();
    searchText.clear();
    items.clear();

  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    howToMakeController.dispose();
   searchText.dispose();
  }
}

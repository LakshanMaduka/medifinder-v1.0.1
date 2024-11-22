import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';

import '../../../core/app_export.dart';
import '../../../core/data/api_client.dart';
import '../../add_paththu_screen/models/paththu_model.dart';

class ItemListController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PaththuModel> paththuList = <PaththuModel>[].obs;
  RxBool isKasaya = false.obs;
  @override
  void onInit() {

    super.onInit();
    isKasaya.value = Get.arguments;
  }
  @override
  void onReady() {

    super.onReady();
    getDetails();
  }

  void getDetails() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =  isKasaya.value ? await Get.find<ApiClient>().getKasaya(): await Get.find<ApiClient>().getPaththu();
      querySnapshot.docs.forEach((doc) {
       paththuList.add(PaththuModel.fromJson(doc.data() as Map<String, dynamic>));

      });
      isLoading.value = false;
      //addIngredientsToList();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }



}
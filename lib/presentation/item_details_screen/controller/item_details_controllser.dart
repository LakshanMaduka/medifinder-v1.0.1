import 'package:get/get.dart';
import 'package:medifinder/presentation/add_paththu_screen/models/paththu_model.dart';

import '../../add_medicine_screen/models/add_medicine_model.dart';
import '../../search_screen/controller/search_controller.dart';

class ItemDetailsController extends GetxController{
  PaththuModel? data;
  RxBool isLoading = false.obs;
@override
  void onInit(){
    super.onInit();
    data = Get.arguments;
    addIngredientsToList();

}
@override
  void onReady() {
    super.onReady();

  }
final SearchScreenController searchcontroller = SearchScreenController();
List<AddMedicineModel> medicineList=[];
RxList<AddMedicineModel> ingredientList = <AddMedicineModel>[].obs;
void addIngredientsToList() async{

  medicineList = await searchcontroller.getDataFromPref();
  ingredientList.value = medicineList.where((element) => data!.ingredients!.contains(element.id)).toList();

}
}
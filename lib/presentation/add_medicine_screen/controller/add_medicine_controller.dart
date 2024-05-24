import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import '../../../core/app_export.dart';
import '../models/add_medicine_model.dart';

/// A controller class for the Iphone1415ProMaxFiveScreen.
///
/// This class manages the state of the Iphone1415ProMaxFiveScreen, including the
/// current iphone1415ProMaxFiveModelObj
class AddMedicineController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController rackNoController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController usageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;




  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();

    //Check Permissions
    //Select Image
    pickedImage.value =
        await _imagePicker.pickImage(source: ImageSource.camera);
    isLoading.value = true;
    var file = File(pickedImage.value!.path);

    if (pickedImage.value != null) {
      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/${nameController.text}')
          .putFile(file, SettableMetadata(contentType: 'image/jpeg'));

      var downloadUrl = await snapshot.ref.getDownloadURL();

      imageUrl.value = downloadUrl;
      print(imageUrl.value);
      isLoading.value = false;
    } else {
      isLoading.value = false;
      print('No Image Path Received');
    }
  }

    Future<File>  getImage() async{
    final _imagePicker = ImagePicker();
    //Check Permissions
    //Select Image
  final value = await _imagePicker.pickImage(source: ImageSource.camera);
    isLoading.value = true;
    var file;
   if(value != null)  file = File(value.path);
    return file;
  }


  CollectionReference medicines =
      FirebaseFirestore.instance.collection('medicines');
  RxBool isLoadingMedicine = false.obs;
  Future<void> addMedicine() {
    isLoadingMedicine.value = true;
    AddMedicineModel addMedicine = AddMedicineModel(
        name: nameController.text.trim(),
        rackNumber: rackNoController.text.trim(),
        description: descriptionController.text.trim(),
        usage: usageController.text.trim(),
        imgUrl: imageUrl.value);
    // Call the user's CollectionReference to add a new user
    return medicines.add(addMedicine.toJson()).then((value) {
      isLoadingMedicine.value = false;
      clearTextFields();
      ShowDialog.successDialog();
    }).catchError((error) {
      isLoadingMedicine.value = false;
      clearTextFields();
      ShowDialog.errorDialog();
    });
  }

  void clearTextFields() {
    nameController.clear();
    rackNoController.clear();
    descriptionController.clear();
    usageController.clear();
    pickedImage.value = null;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    rackNoController.dispose();
    descriptionController.dispose();
    usageController.dispose();
  }
}

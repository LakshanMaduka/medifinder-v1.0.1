import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/app_export.dart';
import '../models/add_medicine_model.dart';
import 'package:path/path.dart' as path;

/// A controller class for the Iphone1415ProMaxFiveScreen.
///
/// This class manages the state of the Iphone1415ProMaxFiveScreen, including the
/// current iphone1415ProMaxFiveModelObj
class AddMedicineController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController rackNoController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController usageController = TextEditingController();


  Rx<XFile?> pickedImage = Rx<XFile?>(null);
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;

 Future<bool> uploadImage(XFile file) async {
    isLoading.value = true;
    final _firebaseStorage = FirebaseStorage.instance;
    try {
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/${nameController.text}')
          .putFile(
              File(file.path), SettableMetadata(contentType: 'image/jpeg'));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl.value = downloadUrl;
      isLoading.value = false;
      return true;

    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error !", "Upload faild");
      return false;
    }
  }

  final _imagePicker = ImagePicker();
  void getImage() async {
    final value = await _imagePicker.pickImage(source: ImageSource.camera);
    if (value != null) {
      pickedImage.value = XFile(value.path);
      _cropImage(File(value.path));
    }
  }

  Future<void> _cropImage(File file) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ]);
    if (croppedFile != null) {
      // pickedImage.value = XFile(croppedFile.path);
      _compressImage(File(croppedFile.path));
    }
  }
  Future<void> _compressImage(File imageFile) async {
    final dir = await getTemporaryDirectory();
    final targetPath = path.join(dir.absolute.path, "compressed_${path.basename(imageFile.path)}");

    var result  = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path, targetPath,
        quality: 50,
      );

    if (result != null) {

        pickedImage.value = XFile(result.path);

    }
  }
  CollectionReference medicines =
      FirebaseFirestore.instance.collection('medicines');
  RxBool isLoadingMedicine = false.obs;
  Future<void> addMedicine() async {
    isLoadingMedicine.value = true;
   bool isSuccess = await uploadImage(pickedImage.value!);

   try {
    if(isSuccess){
      AddMedicineModel addMedicine = AddMedicineModel(
          name: nameController.text.trim(),
          rackNumber: rackNoController.text.trim(),
          description: descriptionController.text.trim(),
          usage: usageController.text.trim(),
          imgUrl: imageUrl.value);
      // Call the user's CollectionReference to add a new user
      await  medicines.add(addMedicine.toJson());
      isLoadingMedicine.value = false;
      clearTextFields();
      ShowDialog.successDialog();
    }else{
      isLoadingMedicine.value = false;
      ShowDialog.customizedErrorDialog("Image Upload Failed!");
    }
   }
   catch (e){
       isLoadingMedicine.value = false;
       clearTextFields();
       ShowDialog.errorDialog();

   }

  }
void store(){

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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medifinder/core/consts/AppColors.dart';

import '../app_export.dart';
import '../consts/AppStyle.dart';


class DialogHelper{
  static void showErrorDialog({String title = "Error", String description = "something went wrong",void Function()? onPressed}){
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title ?? "",
              style: AppStyle.textInputStyle,
            ),
            SizedBox(height: 10,),
            Text(description??"",
              textAlign: TextAlign.center,
              style: AppStyle.textInputStyle.copyWith(

                  color: AppColors.darkGreen.withOpacity(0.6)),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.darkGreen), // Set background color
                  foregroundColor: MaterialStateProperty.all<Color>(AppColors.white), // Set text color

                ),
                onPressed:onPressed ?? (){
                  Get.back();
                }, child: Text("Ok"))
          ],),
      ),
    ));
  }
  static void showSnackBar({String title ="Error", String description = "Error occurred", Color? color} ){
    Get.snackbar(
      title,
      description,
      backgroundColor:color ?? Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.error_outline, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10.0,
      margin: EdgeInsets.all(10.0),
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }
  static void showToast(String message){
    showToast("${message}");
  }

}
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medifinder/core/app_export.dart';
class ShowDialog {
  static successDialog() {
    return AwesomeDialog(
      context: Get.context!,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Success',
      desc:
      'Medicine was added successfully!',
      btnOkOnPress: () {

      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {

      },
    ).show();
  }

  static errorDialog(){
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
      title: 'Error',
      desc:
      'Something went wrong',
      btnOkOnPress: () {},
      btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
    ).show();
  }
}
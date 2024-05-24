import 'package:flutter/material.dart';

import 'package:medifinder/core/app_export.dart';
import 'package:medifinder/core/consts/AppColors.dart';

class AppStyle{
  static TextStyle titleStile = TextStyle(
    fontSize: 30.fSize,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreen
  );
  static TextStyle menuItem = TextStyle(
      fontSize: 20.fSize,
      fontWeight: FontWeight.w600,
      color: AppColors.darkGreen
  );
  static TextStyle drawerText = TextStyle(
      fontSize: 16.fSize,
      color: AppColors.white
  );
  static TextStyle textFormText = TextStyle(
      fontSize: 16.fSize,
      color: AppColors.darkGreen
  );
}
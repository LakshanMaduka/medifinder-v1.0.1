import 'package:flutter/material.dart';
import 'package:medifinder/presentation/splash_screen/controller/splash_screen_controller.dart';

import '../../core/app_export.dart';


class SplashScreen
    extends GetWidget<SplashScreenController> {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 59.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUntitled11,
            height: 234.v,
            width: 312.h,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}

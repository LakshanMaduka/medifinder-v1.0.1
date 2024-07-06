import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppColors.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Expanded(
              child: Container(
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
            
            CustomImageView(
              imagePath: ImageConstant.imgSuslLogo,
              height: 70.v,
              width: 70.h,
              alignment: Alignment.center,
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.fromLTRB(20,0,20,0),
              child: Text("This app is brought to you by the students of Sabaragamuwa University of Sri Lanka",textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5)
              ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppStyle.dart';
import '../../core/app_export.dart';
import 'controller/login_controller.dart'; // ignore_for_file: must_be_immutable

class LoginScreen
    extends GetWidget<LoginController> {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 33.h,
            vertical: 19.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 65.v),
              CustomImageView(
                imagePath: ImageConstant.imgUntitled11,
                height: 103.v,
                width: 154.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 36.v),
              CustomImageView(
                imagePath: ImageConstant.img54870511,
                height: 242.v,
                width: 363.h,
                radius: BorderRadius.circular(
                  30.h,
                ),
              ),
              SizedBox(height: 40.v),
              Container(
                width: 260.h,
                height: 100.h,


                child: Text(
                  "msg_hey_there_welcome2".tr,
                  style: AppStyle.titleStile,
                  textAlign: TextAlign.left,
                ),
              ),

              Text(
                "msg_login_to_your_account".tr,
                style: CustomTextStyles.titleMediumOnPrimaryContainer,
              ),
              SizedBox(height: 37.v),
             Obx(() => controller.isLoading.value ? Center(child: CircularProgressIndicator()): _buildRowpngwingone(),),

              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "lbl_v_1_0_0".tr,
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowpngwingone() {
    return GestureDetector(
      onTap: (){
        controller.logging();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.h,
          vertical: 9.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgPngwing1,
              height: 47.v,
              width: 42.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.h,
                top: 8.v,
                bottom: 2.v,
              ),
              child: Text(
                "msg_login_with_google".tr,
                style: CustomTextStyles.headlineSmallBlack900,
              ),
            )
          ],
        ),
      ),
    );
  }
}

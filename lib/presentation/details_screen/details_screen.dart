import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import '../../core/app_export.dart';
import 'controller/details_screen_controller.dart'; // ignore_for_file: must_be_immutable

class DetailsScreen
    extends GetWidget<DetailsScreenController> {
  const DetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 28.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back,color: AppColors.darkGreen,)),
                    CustomImageView(
                      imagePath: ImageConstant.imgUntitled11,
                      height: 103.v,
                      width: 154.h,
                      alignment: Alignment.center,
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,color: AppColors.darkGreen,)),
                  ],
                ),
                SizedBox(height: 42.v),
                CustomImageView(
                  imagePath: controller.dataModel?.imgUrl??"",
                  height: 255.v,
                  width: 272.h,
                  radius: BorderRadius.circular(
                    30.h,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 38.v),
                Row(
                  children: [
                    Text(
                      "lbl_name2".tr,
                      style: CustomTextStyles.titleMediumPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text(
                        controller.dataModel?.name??"",
                        style: theme.textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.v),
                Row(
                  children: [
                    Text(
                      "lbl_rack_no2".tr,
                      style: CustomTextStyles.titleMediumPrimary,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Text(
                        controller.dataModel?.rackNumber??"",
                        style: theme.textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.v),
                _buildDescriprionrow(),
                SizedBox(height: 7.v),
                _buildUsagerow(),
                SizedBox(height: 5.v)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriprionrow() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,

            ),
            child: Text(
              "lbl_description".tr,
              style: CustomTextStyles.titleMediumPrimary,
            ),
          ),
          Container(
            width: 242.h,
            margin: EdgeInsets.only(left: 8.h),
            child: Text(


              controller.dataModel?.description??"",
              style: theme.textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUsagerow() {
    return Padding(
      padding: EdgeInsets.only(

        right: 11.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 2.v,

            ),
            child: Text(
              "lbl_usage".tr,
              style: CustomTextStyles.titleMediumPrimary,
            ),
          ),
          Container(
            width: 242.h,
            margin: EdgeInsets.only(left: 8.h),
            child: Text(
              controller.dataModel?.usage??"",


              style: theme.textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}

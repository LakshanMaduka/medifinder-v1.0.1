import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/add_medicine_controller.dart'; // ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AddMedicineScreen extends GetWidget<AddMedicineController> {
  AddMedicineScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: theme.colorScheme.onPrimary,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.h,
                  vertical: 22.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 14.v),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                              // var homeController = Get.find<HomeController>();
                              // homeController.foundMedicine.value = [];
                              // homeController.getDetails();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.darkGreen,
                            )),
                        SizedBox(
                          width: 50.v,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgUntitled11,
                          height: 123.v,
                          width: 199.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_add_medicine".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    _buildColumnname(),
                    SizedBox(height: 10.v),
                    _buildColumnracknumbe(),
                    SizedBox(height: 10.v),
                    _buildColumndescripti(),
                    SizedBox(height: 10.v),
                    _buildColumnusage(),
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_image".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 5.v),
                    _buildRowuploadtothe()
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(() => _buildAddmedicine()),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_name".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.nameController,
          hintText: "lbl_enter_name".tr,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter name";
            }
            return null;
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildColumnracknumbe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_rack_number".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter name";
            }
            return null;
          },
          controller: controller.rackNoController,
          hintText: "lbl_enter_rack_no".tr,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildColumndescripti() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_description2".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.descriptionController,
          hintText: "lbl_type_here2".tr,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildColumnusage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_usage2".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.usageController,
          hintText: "lbl_type_here2".tr,
          textInputAction: TextInputAction.done,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildRowuploadtothe() {
    return GestureDetector(
      onTap: () {
        controller.getImage();
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 85.h,
            vertical: 58.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder30,
          ),
          child: controller.isLoading.value
              ? Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Uploading...",
                        style: TextStyle(color: AppColors.darkGreen),
                      )
                    ],
                  ),
                )
              : controller.pickedImage.value != null
                  ? Image.file(File(controller.pickedImage.value!.path))
                  : Row(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgUploadToTheCloud,
                          height: 43.v,
                          width: 58.h,
                          margin: EdgeInsets.symmetric(vertical: 6.v),
                        ),
                        Container(
                          width: 114.h,
                          margin: EdgeInsets.only(
                            left: 5.h,
                            top: 4.v,
                          ),
                          child: Text(
                            "msg_click_to_upload".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargeBlack900,
                          ),
                        )
                      ],
                    ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddmedicine() {
    return controller.isLoadingMedicine.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : CustomOutlinedButton(
            text: "lbl_add_medicine".tr,
            margin: EdgeInsets.only(
              left: 28.h,
              right: 28.h,
              bottom: 39.v,
            ),
            isDisabled: controller.isLoading.value ? true : false,
            buttonStyle: CustomButtonStyles.outlinePrimaryTL281,
            buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.addMedicine();
              }
            },
          );
  }
}

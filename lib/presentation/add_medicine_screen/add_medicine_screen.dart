import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/core/consts/AppStyle.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../item_list_screen/item_list_screen.dart';
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
                    _buildPlaces(),
                    SizedBox(height: 15.v),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "lbl_seller_details".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    _buildName(),
                    SizedBox(height: 10.v),
                    _buildContact(),
                    SizedBox(height: 10.v),
                    _buildLocation(),
                    SizedBox(height: 10.v),
                    _buildAddSeller(),
                    Obx (()=>  SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true, // Add this line to constrain the ListView
                        physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                        itemBuilder: (context, index) =>  ListTile(
                            title: Text(
                                controller.sellersList.value[index].name!,
                              style: AppStyle.menuItem,
                            ),
                          subtitle: Text(
                            controller.sellersList.value[index].contactNumber!,
                            style: theme.textTheme.titleMedium,
                          ),
                          trailing: IconButton(
                            onPressed: (){
                              controller.removeSellers(controller.sellersList.value[index]);
                            },
                            icon: Icon(Icons.delete,color: AppColors.ash,),
                          ),

                        ),



                        itemCount: controller.sellersList.length,),
                    )),

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
  ///places
  Widget _buildPlaces() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_places".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.placesController,
          // onChanged: (val){
          //   controller.separateWords(val);
          // },
          hintText: "lbl_example_places".tr,
          textInputAction: TextInputAction.done,
          maxLines: 2,
        )
      ],
    );
  }

  ///sellers
  ///places
  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_seller_name".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.sellerNameController,
          onChanged: (val){
            controller.separateWords(val);
          },
          hintText: "lbl_type_here2".tr,
          textInputAction: TextInputAction.done,

        )
      ],
    );
  }
  ///places
  Widget _buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_seller_contact_number".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.sellerContactNumber,
          textInputType: TextInputType.number,
          onChanged: (val){
            controller.separateWords(val);
          },
          hintText: "lbl_type_here2".tr,
          textInputAction: TextInputAction.done,

        )
      ],
    );
  }
  ///places
  Widget _buildLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_seller_location".tr,
          style: theme.textTheme.titleLarge,
        ),
        SizedBox(height: 4.v),
        CustomTextFormField(
          controller: controller.sellerLocation,
          onChanged: (val){
            controller.separateWords(val);
          },
          hintText: "lbl_type_here2".tr,
          textInputAction: TextInputAction.done,
          maxLines: 2,
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
  Widget _buildAddSeller() {
    return controller.isLoadingMedicine.value
        ? Center(
      child: CircularProgressIndicator(),
    )
        : CustomOutlinedButton(
      text: "lbl_add_sellers".tr,
      margin: EdgeInsets.only(
        left: 28.h,
        right: 28.h,
        bottom: 39.v,
      ),
      isDisabled: controller.isLoading.value ? true : false,
      buttonStyle: CustomButtonStyles.outlinePrimaryTL281,
      buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
      onPressed: () {
controller.addSellers();
      },
    );
  }
}

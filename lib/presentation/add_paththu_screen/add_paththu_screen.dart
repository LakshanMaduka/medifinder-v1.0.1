import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/core/helper/dialog_helper.dart';
import 'package:medifinder/presentation/add_medicine_screen/widgets/sucess_dialog.dart';
import 'package:medifinder/presentation/search_screen/controller/search_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_search_view.dart';
import '../../widgets/custom_text_form_field.dart';
import '../add_medicine_screen/models/add_medicine_model.dart';
import '../search_screen/widgets/shimmer.dart';
import '../search_screen/widgets/userprofile_item_widget.dart';
import 'controller/add_paththu_controller.dart'; // ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AddPaththuSccreen extends GetWidget<AddPaththuController> {
  AddPaththuSccreen({Key? key})
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
                       controller.isKasaya.value ? "lbl_add_kasaya".tr : "lbl_add_paththu".tr,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    _buildColumnname(),
                    SizedBox(height: 10.v),
                    _buildColumnracknumbe(),
                    SizedBox(height: 10.v),
                    Text(
                      "Ingredients",
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      height: 200.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightGreen,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: SingleChildScrollView(
                        child: Obx(() => Wrap(
                          children: controller.items.value.map((e) => Container(
                            margin: EdgeInsets.all(5),
                             padding: EdgeInsets.only(left: 5,right: 5),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(e.name),
                                IconButton(
                                    padding: EdgeInsets.only(left:2,right: 2),
                                    onPressed: (){
                                  controller.items.remove(e);
                                }, icon: Icon(Icons.close))
                              ],
                            ),
                          )).toList()
                        ),
                        ),
                      ),
                    ),
                    CustomOutlinedButton(
                      text: "Add medicine",
                      margin: EdgeInsets.only(
                        top: 20.v,
                      ),
                      isDisabled: controller.isLoading.value ? true : false,
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL281,
                      buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return _bottomSheet();
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(() => _buildAddmedicine(
              onPressed: () {
                if(controller.items.isEmpty){
                  DialogHelper.showErrorDialog(
                      title: "No ingredients",
                      description: "Please add ingredients",
                      onPressed: () {
                        Get.back();
                      }
                  );
                }else{
                  if (_formKey.currentState!.validate()) {
                    controller.addPaththuToWeb();
                  }
                }

              },
            )),
      ),
    );
  }

  Widget _bottomSheet() {

          return Container(
            height: 500.v,

            child: Column(children: [
            Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Container(
              height: Get.height*0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.v),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: CustomSearchView(
                          controller: controller.searchText,
                          hintText:  "Ex- Komarika",
                          alignment: Alignment.center,
                          onChanged: (value){
                            if(value.isEmpty){

                              controller.foundMedicine.value = controller.temp;
                            }
                            // homeController.filterName();
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h,right: 10),
                      child: CustomOutlinedButton(
                        onPressed: (){
                          controller.filterName();
                        },

                        text: "Search".tr,
                        buttonTextStyle: CustomTextStyles.titleLargeOnPrimary ,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:  AppColors.lightGreen
                        ),
                      ),
                    ),
                    Obx(()=> ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.foundMedicine.length,
                      itemBuilder: (context, index) {
                        AddMedicineModel model = controller
                            .foundMedicine.value[index];
                        return  MedicineItemWidget(
                            medicineModel:   model,
                            onTap:   (){
                              controller.addToTheList(model.name,model.id!);
                              Get.back();
                            }
                        )
                        ;
                      },
                    ),
                    ),
                  ],
                )


              ),
            ),
          )
            ]),
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
          "lbl_how_to_make".tr,
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
          controller: controller.howToMakeController,
          hintText: "lbl_how_to_make".tr,
          maxLines: 3,
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildAddmedicine({void Function()? onPressed}) {
    return controller.isLoading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : CustomOutlinedButton(
            text: "Save".tr,
            margin: EdgeInsets.only(
              left: 28.h,
              right: 28.h,
              bottom: 39.v,
            ),
            isDisabled: controller.isLoading.value ? true : false,
            buttonStyle: CustomButtonStyles.outlinePrimaryTL281,
            buttonTextStyle: CustomTextStyles.titleLargeOnPrimary,
            onPressed: onPressed);
  }
}

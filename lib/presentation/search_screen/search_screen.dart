import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';

import 'package:medifinder/presentation/login_screen/controller/login_controller.dart';
import 'package:medifinder/presentation/splash_screen/controller/splash_screen_controller.dart';
import 'package:medifinder/presentation/splash_screen/splash_screen.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/search_controller.dart';
import 'models/userprofile_item_model.dart';
import '../../widgets/menu_button.dart';
import 'widgets/shimmer.dart';
import 'widgets/userprofile_item_widget.dart'; // ignore_for_file: must_be_immutable

class SearchScreen
    extends GetWidget<SearchScreenController> {
  SearchScreen({Key? key})
      : super(
          key: key,
        );
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
   final SearchScreenController searchcontroller = Get.put(SearchScreenController());
  // final SplashScreenController spController = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimary,


        body: RefreshIndicator(
          onRefresh: () async{
            await Future.delayed(const Duration(seconds: 2));
            Get.offAllNamed(AppRoutes.searchScreen);
          },
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 18.h,
                vertical: 26.v,
              ),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.v),

                  Stack(
                    children: [
                      IconButton(
                        onPressed: (){
                          // scaffoldKey.currentState?.openDrawer();
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_sharp,color: AppColors.darkGreen,),
                      ),

                    ],
                  ),
                  // Center(
                  //   child: CustomImageView(
                  //     imagePath: ImageConstant.imgUntitled11,
                  //     height: 123.v,
                  //     width: 199.h,
                  //
                  //   ),
                  // ),
                  SizedBox(height: 30.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_find_medicine".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_search_by".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  _buildRowname(),
                  SizedBox(height: 16.v),
                  Obx( ()=> Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: CustomSearchView(
                        controller: controller.searchText.value,
                        hintText: controller.isRackSelected.value ? "Ex- E - 26": "Ex- Komarika",
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
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: CustomOutlinedButton(
                      onPressed: (){
                        searchcontroller.filterName();
                      },

                      text: "Search".tr,
                      buttonTextStyle: CustomTextStyles.titleLargeOnPrimary ,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: searchcontroller.isNameSelected.value ? AppColors.lightGreen : AppColors.white
                      ),
                    ),
                  ),



                  SizedBox(height: 10.v),
                  _buildUserprofile(),

                ],
              ),
            ),
          ),
        ),


      ),
    );
  }

  /// Section Widget
  Widget _buildRowname() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // GestureDetector(
            //   onTap: (){
            //     MyDrawer();
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 52.h,
            //       vertical: 12.v,
            //     ),
            //     decoration: AppDecoration.outlinePrimary1.copyWith(
            //       borderRadius: BorderRadiusStyle.roundedBorder30,
            //     ),
            //     child: Text(
            //       "lbl_name".tr,
            //       style: CustomTextStyles.titleLargeOnPrimary,
            //     ),
            //   ),
            // ),
           Obx( () => CustomOutlinedButton(
              onPressed: (){
                searchcontroller.isNameSelected.value = true;
                searchcontroller.isRackSelected.value = false;
              },
              width: 166.h,
              text: "lbl_name".tr,
              buttonTextStyle:searchcontroller.isNameSelected.value ? CustomTextStyles.titleLargeOnPrimary : theme.textTheme.titleLarge!,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: searchcontroller.isNameSelected.value ? AppColors.lightGreen : AppColors.white
              ),
            ),
           ),
           Obx( () => CustomOutlinedButton(
              onPressed: (){
                searchcontroller.isNameSelected.value = false;
                searchcontroller.isRackSelected.value = true;
              },
              width: 166.h,
              text: "lbl_rack_no".tr,
             buttonTextStyle:searchcontroller.isNameSelected.value ? theme.textTheme.titleLarge!  : CustomTextStyles.titleLargeOnPrimary ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: searchcontroller.isRackSelected.value ? AppColors.lightGreen : AppColors.white
              ),
            ),
           ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserprofile() {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: Container(
        height: Get.height*0.43,
        child: SingleChildScrollView(
          child: Obx(
            () => searchcontroller.isLoading.value? ShimmerEffect(): ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchcontroller.foundMedicine.length,
              itemBuilder: (context, index) {
                AddMedicineModel model = searchcontroller
                    .foundMedicine.value[index];
                return  MedicineItemWidget(
                  model,
                )
                ;
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the iphone1415ProMaxFiveScreen when the action is triggered.

}

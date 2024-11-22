import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medifinder/core/consts/AppStyle.dart';
import 'package:medifinder/presentation/item_details_screen/controller/item_details_controllser.dart';

import '../../core/app_export.dart';
import '../../core/consts/AppColors.dart';
import '../item_list_screen/item_list_screen.dart';

class ItemDetailsScreen extends GetWidget<ItemDetailsController> {
  ItemDetailsScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimary,
        body: Container(
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
                "විස්තරය".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 10.v),
              Text("නම",style: AppStyle.textInputStyle,),
              SizedBox(height: 10.v),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(controller.data!.name
                    ??"",style: AppStyle.textInputStyle.copyWith(
                  color: AppColors.black
                ),),
              ),
              SizedBox(height: 10.v),
              Text("සාදා ගන්නා ආකාරය",style: AppStyle.textInputStyle,),
              SizedBox(height: 10.v),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(controller.data!.howToMake ?? "",style: AppStyle.textInputStyle.copyWith(
                    color: AppColors.black
                ),),
              ),
              SizedBox(height: 10.v),
              Text("අමුද්‍රව්‍ය",style: AppStyle.textInputStyle,),
              SizedBox(height: 10.v),

              Obx (()=>   ListView.builder(
                shrinkWrap: true, // Add this line to constrain the ListView
                physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                itemBuilder: (context, index) =>  CardItem(
                    name: controller.ingredientList.value[index].name!,
                    onTap: (){
                      Get.toNamed(AppRoutes.detailsScreen, arguments: controller.ingredientList.value[index]);
                    },

                    controller: controller
                ),

                itemCount: controller.ingredientList.length,))



            ],
          ),
        ),
      ),
    );
  }
}
class CardItem extends StatelessWidget {
  String name;
  void Function()? onTap;
  CardItem({
    required this.name,
    this.onTap,
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ItemDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: AppStyle.cardStyle,
          child: Row(
            children: [
              Expanded(
                child: Text(name
                  ,style: AppStyle.textInputStyle,
                ),

              ),
              Icon(Icons.navigate_next_sharp,color: AppColors.darkGreen,)
            ],
          )
      ),
    );
  }
}
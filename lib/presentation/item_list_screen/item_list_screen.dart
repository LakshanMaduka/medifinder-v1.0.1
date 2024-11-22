import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/core/consts/AppStyle.dart';
import 'package:medifinder/presentation/item_list_screen/controller/item_list_controller.dart';

import '../../core/app_export.dart';

class ItemListScreen extends GetWidget<ItemListController> {
  ItemListScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                 controller.isKasaya.value ?"දෛනික කසාය ලැයිස්තුව": "දෛනික පත්තු ලැයිස්තුව".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 10.v),
           Obx(
               () =>  controller.isLoading.value ? Center(child: CircularProgressIndicator(),) :
             Obx (()=>  SingleChildScrollView(

               child: ListView.builder(
                 shrinkWrap: true, // Add this line to constrain the ListView
                 physics: NeverScrollableScrollPhysics(), // Disable ListView scrolling
                    itemBuilder: (context, index) =>  CardItem(
                        name: controller.paththuList.value[index].name!,
                        onTap: (){
                          Get.toNamed(AppRoutes.itemDetailsScreen, arguments: controller.paththuList[index]);
                        },

                        controller: controller),
                    //     ListTile(
                    //
                    //   title: Text(controller.paththuList.value[index].name!),
                    //
                    //   onTap: (){
                    //     //Get.toNamed(AppRoutes.paththuDetailScreen, arguments: controller.paththuList[index]);
                    //   },
                    // ),

                    itemCount: controller.paththuList.length,),
             ))
              // Container(
              //   child: ListView.builder(itemBuilder: itemBuilder),
              // ),
           ),

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

  final ItemListController controller;

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

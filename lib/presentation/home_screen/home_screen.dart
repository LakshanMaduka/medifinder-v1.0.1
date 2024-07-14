import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:medifinder/core/app_export.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/core/utils/image_constant.dart';
import 'package:medifinder/presentation/home_screen/controller/home_controller.dart';
import 'package:medifinder/widgets/custom_image_view.dart';
import 'package:medifinder/widgets/menu_button.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key})
      : super(
    key: key,
  );
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: MyDrawer(scaffoldKey: scaffoldKey,),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,

              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgMenu,
                      height: 41.adaptSize,
                      width: 41.adaptSize,
                      margin: EdgeInsets.only(
                        top: 32.v,
                        bottom: 50.v,
                      ),
                      onTap: () {

                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgUntitled11,
                    height: 170.v,
                    width: 230.h,
                    margin: EdgeInsets.only(left: 46.h),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.v,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      print("called");
                    },
                    child: HomeCard(
                      imagePath: ImageConstant.oil,
                      text: "දෛනික කසාය",
                      
                    ),
                  ),
                  SizedBox(width: 20.h,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.itemListScreen);
                    },
                    child: HomeCard(
                      imagePath: ImageConstant.paththu,
                      text: "දෛනික පත්තු",

                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 40.v,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      print("called");
                      Get.toNamed(AppRoutes.searchScreen);
                    },
                    child: HomeCard(
                      imagePath: ImageConstant.drawer,
                      text: "සෙවීම්",

                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  String imagePath;
  String text;
  

   HomeCard({
     required this.text,
     required this.imagePath,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGreen,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
     padding: EdgeInsets.all(10),
     child:  Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomImageView(
              imagePath: imagePath,
              height: 140.v,
              width: 140.h,

            ),
          ),
          SizedBox(height: 10.v,),
          Text(
            text,
            style: CustomTextStyles.homeCardText,
          ),

        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medifinder/core/app_export.dart';
import 'package:medifinder/core/consts/AppColors.dart';
import 'package:medifinder/core/consts/AppStyle.dart';
import 'package:medifinder/presentation/home_screen/controller/home_controller.dart';
class MyDrawer extends GetWidget<HomeController> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  MyDrawer({this.scaffoldKey});
  var homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.lightGreen
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40.v,
                   child: Image.network(controller.user?.photoURL?? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                ),
                SizedBox(height: 10.v,),
                Text(controller.user?.displayName ?? "",style: AppStyle.drawerText,),
                Text(controller.user?.email ?? "",style: AppStyle.drawerText)
              ],
            )
          ),
          ListTile(
            leading: Icon(Icons.add_box_outlined,color: AppColors.darkGreen,),
            title: Text('Add Medicine',style: AppStyle.menuItem,),
            onTap: () {

              // Navigate to a screen when this item is tapped
              Get.toNamed(AppRoutes.addMedicineScreen);
              scaffoldKey!.currentState!.closeDrawer();


            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded,color: AppColors.darkGreen,),
            title: Text("Log Out",style: AppStyle.menuItem,),
            onTap: () {
              // Navigate to a screen when this item is tapped
              controller.logoutGoogle();
            },
          ),
          // Add more list tiles for additional items
        ],
      ),
    );
  }
}
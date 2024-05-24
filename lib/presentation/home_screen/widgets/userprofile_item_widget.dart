import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medifinder/presentation/add_medicine_screen/models/add_medicine_model.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MedicineItemWidget extends StatelessWidget {
  MedicineItemWidget(this.medicineModel, {Key? key})
      : super(
          key: key,
        );

  AddMedicineModel medicineModel;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.detailsScreen,
        arguments: medicineModel
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.h,top: 15.h),
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 13.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              fit: BoxFit.fill,
              imagePath: medicineModel.imgUrl,
              height: 89.v,
              width: 92.h,
              radius: BorderRadius.circular(
                15.h,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 6.v,
                  bottom: 16.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                           SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Text(
                              "Name:",
                              style: CustomTextStyles.titleMediumBlack900,),
                           ),

                        SizedBox(width: 15.v,),
                          Text(
                            medicineModel.name,
                            style: theme.textTheme.titleMedium,
                          ),

                      ],
                    ),
                    SizedBox(height: 17.v),
                    Row(
                      children: [
                       Text(
                            "Rack No:",
                            style: CustomTextStyles.titleMediumBlack900,
                          ),
                      SizedBox(width: 15.v,),

                      Text(
                           medicineModel.rackNumber,
                            style: theme.textTheme.titleMedium,
                          ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgChevronRight,
              height: 29.v,
              width: 40.h,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}

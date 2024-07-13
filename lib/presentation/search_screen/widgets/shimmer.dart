import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medifinder/core/app_export.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
class ShimmerEffect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.3,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey.shade300,

        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(right: 5.h,top: 15.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.outlinePrimary.copyWith(
                  color: Colors.transparent,
                  borderRadius: BorderRadiusStyle.roundedBorder30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 89.v,
                      width: 92.h,

                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          15.h,
                        ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 150,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 17.v),
                            Container(
                              height: 20,
                              width: 100,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              );
            })
      ),
    );
  }
}

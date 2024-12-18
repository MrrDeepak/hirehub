import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:math' as math;

import 'package:seek_forms/Api_Controller/counselling_controller.dart';

class Counselling extends StatelessWidget {
  Counselling({super.key});
  final CounsellingController counsellingController =
      Get.put(CounsellingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff5963F4),
      ),
      body: Obx(
        () => counsellingController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.5.h),
                child: Column(
                  children: [
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffF19157),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'Get in touch with Counsellar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: counsellingController.counsellingData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.w,
                          mainAxisSpacing: 1.h,
                          mainAxisExtent: 240),
                      itemBuilder: (context, index) {
                        final counsellingData = counsellingController.counsellingData[index];
                        return Column(
                          children: [
                            Container(
                              height: 6.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffF19157),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                      topRight: Radius.circular(100))),
                              child: Center(
                                child: Text(
                                  'Apply',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Card(
                                margin: EdgeInsets.all(0),
                                color: Colors.white.withOpacity(0.5),
                                // height: 17.h,
                                // width: double.infinity,
                                shape: RoundedRectangleBorder(
                                    // color: Colors.white.withOpacity(0.34),
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: Colors.white,
                                    )
                                    // border: Border.all(color: Colors.white)
                                    ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 0.5.h),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                        width: double.infinity,
                                        child: Image.asset(
                                          'assets/images/cuetPG.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        counsellingData.message??''
                                        ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox(
                                                height: 4.5.h,
                                                width: 20.w,
                                                child: Text(
                                                  counsellingData.pdfDetails!.pdfName??'',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          // SizedBox(width: 1.w,),
                                          Expanded(
                                            child: SvgPicture.asset(
                                                'assets/svg/pdfIcon.svg'),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

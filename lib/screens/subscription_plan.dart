import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';
import 'package:seek_forms/screens/homepage/bottomBar.dart';
import 'package:seek_forms/screens/seekform_services.dart';

class SubscriptionPlan extends StatelessWidget {
  SubscriptionPlan({super.key});
  final SubscriptionController controller = Get.put(SubscriptionController());
  final SubscriptionDataController subscriptionController =
      Get.put(SubscriptionDataController());
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No')),
            TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'))
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Color(0xffF19157),
      body: WillPopScope(
        onWillPop: () => _onWillPop(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.34,
                //color: Colors.amber,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 3.5.h,
                          width: 21.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff51D7E0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomBar(),
                                    ));
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Container(
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffB3FF02).withOpacity(0.3),
                              Color(0xff331AF0).withOpacity(0.4),
                              Color(0xff331AF0).withOpacity(0.3),
                              Color(0xffF0761A).withOpacity(0.6),
                            ],
                            stops: [0.0, 0.1, 0.8, 1.0],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Center(
                              child: Image.asset(
                                'assets/images/videoPlay.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Color(0xff51D7E0),
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Obx(
                      () => subscriptionController.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: subscriptionController
                                  .subscriptionData.length,
                              itemBuilder: (context, index) {
                                final data = subscriptionController
                                    .subscriptionData[index];
                                controller.updateCount(subscriptionController
                                    .subscriptionData.length);

                                return Column(
                                  children: [
                                    Container(
                                      height: 18.h,
                                      width: double.infinity,
                                      color: Colors.transparent,
                                      child: Stack(
                                        children: [
                                          SizedBox.expand(
                                            child: SvgPicture.asset(
                                              'assets/svg/subscription.svg',
                                            ),
                                          ),
                                          Positioned(
                                            top: 2.5.h,
                                            left: 5.w,
                                            child: Text(
                                              ' 87% \n OFF \n 1st\nMonth',
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),

                                          /// container
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '₹ ${data.discountMoney}',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFF272A),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      data.serviceMoney
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFF272A),
                                                        fontSize: 16.sp,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15.w,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                )
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 40.w,
                                              // height: 5.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Text(
                                                  //   '   5 Forms 5 Admit card   ',
                                                  //   style:
                                                  //       TextStyle(color: Colors.transparent),
                                                  // ),
                                                  // SizedBox(height: 2.h,),
                                                  Flexible(
                                                    child: Text(
                                                      ("${data.serviceName ?? ''}"),
                                                      softWrap: true,
                                                      maxLines: null,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFF272A),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '  ${data.nextServiceDetail ?? ''}',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 15.sp),
                                                  ),
                                                  // Text(
                                                  //   '   5 Forms 5 Admit card   ',
                                                  //   style:
                                                  //       TextStyle(color: Colors.transparent),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          /// bUttons
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // controller.isExpanded.value =
                                                    //     !controller.isExpanded.value;
                                                    controller
                                                            .rxBooleanList[index]
                                                            .value =
                                                        !controller
                                                            .rxBooleanList[
                                                                index]
                                                            .value;
                                                  },
                                                  child: Container(
                                                    height: 3.5.h,
                                                    width: 21.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            Color(0xff000F72)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  1.5.w),
                                                      child: Center(
                                                        child: FittedBox(
                                                          child: Text(
                                                            'Plan details',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Container(
                                                  height: 3.5.h,
                                                  width: 21.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color(0xffFF272A)),
                                                  child: Center(
                                                    child: FittedBox(
                                                        child: Text('Get plan',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    // Using AnimatedContainer for expansion with dynamic height calculation
                                    Obx(() {
                                      return controller
                                              .rxBooleanList[index].value
                                          // controller.isExpanded.value
                                          ? ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  data.serviceDetails!.length,
                                              itemBuilder: (context, index) {
                                                final subData =
                                                    data.serviceDetails![index];
                                                final int lastCount = data
                                                        .serviceDetails!
                                                        .length -
                                                    1;
                                                final int count =
                                                    data.serviceDetails!.length;
                                                if (index == 0) {
                                                  if (count > 1) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8))),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Icon(
                                                              Icons.check,
                                                              color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                subData.detail ??
                                                                    '',
                                                                maxLines: null,
                                                                softWrap: true,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      // color: Colors.white,
                                                      // elevation: 0,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Icon(
                                                              Icons.check,
                                                              color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                subData.detail ??
                                                                    '',
                                                                maxLines: null,
                                                                softWrap: true,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                } else if (index == lastCount) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8))),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.red,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              subData.detail ??
                                                                  '',
                                                              maxLines: null,
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.red,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              subData.detail ??
                                                                  '',
                                                              maxLines: null,
                                                              softWrap: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            )
                                          : Container();
                                    }),
                                  ],
                                );
                                // NewSubscriptionCard();
                              },
                            ),
                    ),
                    // Column(
                    //   children: [

                    //   ],
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

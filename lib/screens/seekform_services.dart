import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';

class SubscriptionController extends GetxController {
  var isExpanded = false.obs;
  RxList<RxBool> rxBooleanList = <RxBool>[].obs;

  void updateCount(int itemCount) {
    rxBooleanList.value = List.generate(itemCount, (_) => false.obs);
  }
}

class SeekformServices extends StatelessWidget {
  SeekformServices({super.key});
  final SubscriptionController controller = Get.put(SubscriptionController());
  final SubscriptionDataController subscriptionController =
      Get.put(SubscriptionDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(color: Colors.white,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Obx(
          () => subscriptionController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: subscriptionController.subscriptionData.length,
                  itemBuilder: (context, index) {
                    final data = subscriptionController.subscriptionData[index];
                    controller.updateCount(
                        subscriptionController.subscriptionData.length);

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹ ${data.discountMoney}',
                                          style: TextStyle(
                                              color: Color(0xffFF272A),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          data.serviceMoney.toString(),
                                          style: TextStyle(
                                            color: Color(0xffFF272A),
                                            fontSize: 16.sp,
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color: Color(0xffFF272A),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '  ${data.nextServiceDetail ?? ''}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15.sp),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // controller.isExpanded.value =
                                        //     !controller.isExpanded.value;
                                        controller.rxBooleanList[index].value =
                                            !controller
                                                .rxBooleanList[index].value;
                                      },
                                      child: Container(
                                        height: 3.5.h,
                                        width: 21.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color(0xff000F72)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.5.w),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                'Plan details',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                                              BorderRadius.circular(8),
                                          color: Color(0xffFF272A)),
                                      child: Center(
                                        child: FittedBox(
                                            child: Text('Get plan',
                                                style: TextStyle(
                                                    color: Colors.white))),
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
                          return controller.rxBooleanList[index].value
                              // controller.isExpanded.value
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.serviceDetails!.length,
                                  itemBuilder: (context, index) {
                                    final subData = data.serviceDetails![index];
                                    final int lastCount =
                                        data.serviceDetails!.length - 1;
                                    final int count =
                                        data.serviceDetails!.length;
                                    if (index == 0) {
                                      if (count > 1) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight:
                                                      Radius.circular(8))),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                    subData.detail ?? '',
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
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                                    subData.detail ?? '',
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
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight:
                                                    Radius.circular(8))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                    subData.detail ?? '',
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                    subData.detail ?? '',
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
      ),
    );
  }
}

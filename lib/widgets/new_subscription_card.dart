import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart'; // Import GetX

// GetX Controller for managing subscription state
class SubscriptionController extends GetxController {
  var isExpanded = false.obs; // Observable RxBool to track expansion state
}

class NewSubscriptionCard extends StatelessWidget {
  NewSubscriptionCard({super.key});
  final SubscriptionController controller = Get.put(SubscriptionController());
  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹ 19',
                          style: TextStyle(
                              color: Color(0xffFF272A),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          '59',
                          style: TextStyle(
                            color: Color(0xffFF272A),
                            fontSize: 16.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 15.w,)
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        '5 form 5 admit card ',
                        style: TextStyle(
                            color: Color(0xffFF272A),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '   then 59/form',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
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
                        controller.isExpanded.value =
                            !controller.isExpanded.value;
                      },
                      child: Container(
                        height: 3.5.h,
                        width: 21.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff000F72)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Plan details',
                                style: TextStyle(color: Colors.white),
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
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffFF272A)),
                      child: Center(
                        child: FittedBox(
                            child: Text('Get plan',
                                style: TextStyle(color: Colors.white))),
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
          return controller.isExpanded.value? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.red,
                            ),
                            FittedBox(
                                child: Text('Access to all subject mock text')),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ): Container();
        }),
      ],
    );
  }
}

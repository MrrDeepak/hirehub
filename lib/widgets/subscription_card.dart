import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:responsive_sizer/responsive_sizer.dart';

// GetX Controller for managing subscription state
class SubscriptionController extends GetxController {
  var isExpanded = false.obs; // Observable RxBool to track expansion state
}

class SubscriptionCard extends StatelessWidget {
  // We use GetX to get the controller instance
  final SubscriptionController controller = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    // Define the number of items in the ListView and the height per item
    int itemCount = 5; // Example: 5 items
    double itemHeight = 5.h; // Each item has a height of 5.h

    return Column(
      children: [
        // Main Subscription Container
        Obx((){
          return Container(
          width: double.infinity,
          height: 18.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFF272A),
                Color(0xff000F72),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: controller.isExpanded.value
                  ? Radius.circular(0)
                  : Radius.circular(12),
              bottomRight: controller.isExpanded.value
                  ? Radius.circular(0)
                  : Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              // Left Section (with percentage)
              Container(
                width: 18.w,
                decoration: BoxDecoration(
                  color: Color(0xffFF272A),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: Text(
                      '  87%\n  OFF\n  1st\nMONTH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff000F72),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹',
                                  style: TextStyle(
                                    color: Color(0xffF19157),
                                    fontSize: 22.sp,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.2.h),
                                  child: Text(
                                    ' 19 ',
                                    style: TextStyle(
                                      color: Color(0xffF19157),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.5.h),
                                  child: Text(
                                    '₹59',
                                    style: TextStyle(
                                      color: Color(0xffF19157),
                                      fontSize: 15.sp,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 135, 175, 76)
                                        .withOpacity(1),
                                    Color.fromARGB(255, 1, 30, 219),
                                    const Color.fromARGB(255, 135, 175, 76)
                                        .withOpacity(1)
                                  ],
                                  tileMode: TileMode.decal,
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'SPECIAL PRICE',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: [
                            FittedBox(
                              child: Text(
                                '1 form access',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'then 59/form',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isExpanded.value =
                                      !controller.isExpanded.value;
                                },
                                child: Container(
                                  height: 4.5.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Show plan',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFF272A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  'Get plan',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
        }),
        
        
        // Using AnimatedContainer for expansion with dynamic height calculation
        Obx(() {
          // Rebuild when isExpanded changes
          // int itemCount = 5; // Example: 5 items
          // double itemHeight = 5.h; // Each item has a height of 5.h
          return  AnimatedContainer(
          duration:
              Duration(milliseconds: 100), // Duration of the expansion/collapse
          height: controller.isExpanded.value ? 10.h : 0, // Adjust the height based on isExpanded
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: controller.isExpanded.value ? Radius.circular(12) : Radius.circular(0),
              bottomRight:
                  controller.isExpanded.value ? Radius.circular(12) : Radius.circular(0),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        controller.isExpanded.value ? Radius.circular(12) : Radius.circular(0),
                    bottomRight:
                        controller.isExpanded.value ? Radius.circular(12) : Radius.circular(0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 1.5.h),
                    Row(
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
                    Divider(
                      indent: 0,
                      color: Color(0xff51D7E0),
                    )
                  ],
                ),
              );
            },
          ),
        );
        }),
      ],
    );
  }
}
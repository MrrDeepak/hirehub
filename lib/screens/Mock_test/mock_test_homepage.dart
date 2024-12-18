import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/mock_test_category_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_type.dart';
import 'package:seek_forms/util.dart';

class MockTestHomepage extends StatelessWidget {
   MockTestHomepage({super.key});
  final MockTestCategoryApiController mockTestCategoryApiController = Get.put(MockTestCategoryApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.center,
                    child: customBoldText('Mock Test', Colors.white))),
            Expanded(flex: 1, child: Container())
          ],
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Obx(()=> mockTestCategoryApiController.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.white,),):
        ListView.builder(
          shrinkWrap: true,
          itemCount: mockTestCategoryApiController.mockTestCategory.length,
          itemBuilder: (context, index) {
            final mockData = mockTestCategoryApiController.mockTestCategory[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: 1.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MockType(
                    testType: mockData.testType!,
                  ),));
                },
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        color: Colors.transparent,
                        child: Container(
                          height: 6.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffE18D09)),
                          child: SvgPicture.asset('assets/svg/railway.svg',fit: BoxFit.contain,),
                        ),
                      ),
                    ),
                    // SizedBox(width: 2.w),
                    Expanded(
                      flex: 4,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        color: Colors.transparent,
                        child: Container(
                          height: 6.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffE18D09)),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customBoldText(mockData.testName??'', Colors.white),
                                Icon(
                                  Icons.arrow_right_sharp,
                                  color: Colors.white,
                                  size: 3.5.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),),
      ),
    );
  }
}

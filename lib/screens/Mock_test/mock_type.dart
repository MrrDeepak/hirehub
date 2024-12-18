import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/mock_question_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_list.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_page.dart';
import 'package:seek_forms/util.dart';

class MockType extends StatelessWidget {
  final List<String> testType;
   MockType({required this.testType,super.key});
  final MockQuestionApiController mockQuestionApiController = Get.put(MockQuestionApiController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
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
        backgroundColor: Color(0xff5963F4),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: testType.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                mockQuestionApiController.getMockQuestionData(testType[index]);
                Navigator.push(context,MaterialPageRoute(builder: (context) => MockTestList(
                  title: testType[index],
                ),));
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  color: Colors.transparent,
                  child: Container(
                    height: 6.5.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffE7F3FF)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding:  EdgeInsets.only(left: 4.w),
                          child: Text(testType[index],style: TextStyle(fontSize: 16.sp),),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
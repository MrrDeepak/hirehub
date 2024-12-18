import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/submit_answer_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/controller/mock_test_page_controller.dart';

class CorrectPageController extends GetxController {
  RxBool isExpanded = false.obs;
}
class Correct extends StatelessWidget {
  Correct({super.key});
final CorrectPageController correctPageController = Get.put(CorrectPageController());
List<String> mcq = ['A)', 'B)', 'C)', 'D)'];
  final MockTestPageController mockTestPageController =
      Get.put(MockTestPageController());
  final SubmitAnswerApiController submitAnswerApiController = Get.put(SubmitAnswerApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              // physics: NeverScrollableScrollPhysics(),
              // controller: mockTestPageController.pageController,
              // onPageChanged: (value) {
              //   mockTestPageController.currentIndex.value = value;
              // },
              scrollDirection: Axis.horizontal,
              itemCount: submitAnswerApiController.correctAnswerData.length,
              // widget.questions.length,
              itemBuilder: (context, index) {
                final data = submitAnswerApiController.correctAnswerData[index];
                // final questionsData = widget.questions[index];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                        child: Obx(()=>
                        Card(
                          shape: RoundedRectangleBorder(
                            // color: const Color(0xffEB7296),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft:
                                  correctPageController.isExpanded.value
                                      ? Radius.circular(0)
                                      : Radius.circular(12),
                              bottomRight:
                                  correctPageController.isExpanded.value
                                      ? Radius.circular(0)
                                      : Radius.circular(12),
                            ),
                          ),
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          color: Color(0xffE7F3FF),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Q.${index + 1} ',
                                      style: TextStyle(
                                          fontSize: 21.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.only(top: 0.3.h),
                                      child: Text(
                                        data.question??
                                          // widget.questions[index].question ??
                                          'Which of the following is the largest railway station in India by area?',
                                          maxLines: null,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold)),
                                    ))
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    // questionsData.options!.length,
                                    itemBuilder: (context, index) {
                                      if(data.correctAnswer != (index+1)){
                                        return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: 
                                        Card(
                                          color: Colors.white,
                                          elevation: 0,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                                vertical: 2.5.h),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 0,
                                                    child: Text(
                                                      mcq[index],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      data.options![index]??
                                                      // questionsData.options![index] ??
                                                      'Howrah Junction',
                                                      maxLines: null,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    )),
                                                // Spacer(),
                                                Expanded(
                                                    flex: 0,
                                                    child: Icon(
                                                      Icons.circle_outlined,
                                                      color: Colors.grey,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );

                                      }else{
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: 
                                        Card(
                                          color: Color(0xff39C349),
                                          elevation: 0,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                                vertical: 2.5.h),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 0,
                                                    child: Text(
                                                      mcq[index],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      data.options![index]??
                                                      // questionsData.options![index] ??
                                                      'Howrah Junction',
                                                      maxLines: null,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                // Spacer(),
                                                Expanded(
                                                    flex: 0,
                                                    child: Icon(
                                                      Icons.check_circle_outlined,
                                                      color: Colors.white,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );}
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 2, child: Container()),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            correctPageController
                                                    .isExpanded.value = true;
                                                // !unattemptPageController
                                                //     .isExpanded.value;
                                          },
                                          child: Obx(()=>
                                          correctPageController.isExpanded.value?
                                          SizedBox.shrink():
                                          Card(
                                            color: Color(0xffF19157),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.h,
                                                    horizontal: 2.w),
                                                child: Text(
                                                  'Get Solution',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),),
                      ),
                      SizedBox(height: 1),
                      Obx(() {
                        return AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 100),
                          // height: unattemptPageController.isExpanded.value
                          //     ? 10.h
                          //     : 0,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffE7F3FF),
                            borderRadius: BorderRadius.only(
                              bottomLeft:
                                  correctPageController.isExpanded.value
                                      ? Radius.circular(12)
                                      : Radius.circular(0),
                              bottomRight:
                                  correctPageController.isExpanded.value
                                      ? Radius.circular(12)
                                      : Radius.circular(0),
                            ),
                          ),
                          child: correctPageController.isExpanded.value
                              ? Padding(
                                padding:  EdgeInsets.all(1.5.h),
                                child: Card(
                                    elevation: 0,
                                    // margin: EdgeInsets.zero,
                                    color: Color(0xffE7F3FF),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Explanation:',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                          child: Text(
                                            data.solution??
                                              ''),
                                        ),
                                        Row(
                                  children: [
                                    Expanded(flex: 2, child: Container()),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            correctPageController
                                                    .isExpanded.value = false;
                                                // !unattemptPageController
                                                //     .isExpanded.value;
                                          },
                                          child: Obx(()=>
                                          correctPageController.isExpanded.value?
                                          Card(
                                            color: Color(0xffF19157),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.h,
                                                    horizontal: 2.w),
                                                child: Text(
                                                  'Got it!',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ):SizedBox.shrink(),),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                                      ],
                                    ),
                                  ),
                              )
                              : SizedBox.shrink(),
                        );
                      })
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
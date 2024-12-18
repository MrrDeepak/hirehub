import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/mock_question_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/controller/timer_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_page.dart';
import 'package:seek_forms/util.dart';

class MockTestList extends StatelessWidget {
  final String title;
 MockTestList({required this.title,super.key});
  final MockQuestionApiController mockQuestionApiController = Get.put(MockQuestionApiController());
  final TimerController timerController = Get.put(TimerController());
  final AnswerController answerController = Get.put(AnswerController());

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
                    child: customBoldText(title, Colors.white))),
            Expanded(flex: 1, child: Container())
          ],
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff5963F4),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Obx(()=>mockQuestionApiController.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.white,),):
        mockQuestionApiController.mockQuestions.length == 0?Center(child: Text('Currently No Mock Test Available.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),):
        ListView.builder(
          shrinkWrap: true,
          itemCount: mockQuestionApiController.mockQuestions.length,
          itemBuilder: (context, index) {
            final mockData = mockQuestionApiController.mockQuestions[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: 1.h),
              child: Card(
                color: Color(0xffE7F3FF),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
                  child: Column(
                    children: [
                      customBoldText(mockData.testName??'', Colors.black),
                      SizedBox(height: 0.7.h),
                      Card(
                        elevation: 0,
                        color: Colors.white,
                        child: Padding(
                          padding:  EdgeInsets.all(1.h),
                          child: Column(
                                          
                            children: [
                              SizedBox(
                                height: 10.h,
                                width: 25.w,
                                child: SvgPicture.asset('assets/svg/examPaper.svg',fit: BoxFit.contain,),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text(mockData.totalQuestions??'',style: TextStyle(fontWeight: FontWeight.w600)),
                                Text(mockData.totalMarks??'',style: TextStyle(fontWeight: FontWeight.w600)),
                                Text("${mockData.duration??''} Minutes",style: TextStyle(fontWeight: FontWeight.w600)),
                                          
                              ],),
                              SizedBox(height: 1.h,)
                                          
                            ],
                          ),
                        ),
                  
                      ),
                      SizedBox(height: 2.h),
                      GestureDetector(
                        onTap: () {
                          final int time = int.parse(mockData.duration??'')*60;
                          print('time: $time');
                          timerController.startTimer(
                            
                            time
                            );
                          timerController.testId.value=mockData.testId!;
                          answerController.initializeSelectedAnswers(mockData.questions!.length);

                          print('Test Id ${mockData.testId}');

                          Get.to(TestPage(
                            questionTypes: mockData.questionTypes!,
                            questions: mockData.questions!,
                            testId: mockData.testId!,
                            title: title,
                          ),);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => TestPage(
                          //   questions: mockData.questions!,
                          // ),));
                        },
                        child: Container(
                          height: 4.5.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF19157),
                          ),
                          child: Center(child: customBoldText('Continue', Colors.white),),
                        ),
                      )
                  
                    ],
                  ),
                ),
              ),
            );
          },
          ),),
      ),
    );
  }
}
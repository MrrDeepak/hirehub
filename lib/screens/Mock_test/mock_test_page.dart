import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/submit_answer_api_controller.dart';
import 'package:seek_forms/model/mock_question_modal.dart';
import 'package:seek_forms/screens/Mock_test/controller/mock_test_page_controller.dart';
import 'package:seek_forms/screens/Mock_test/controller/timer_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_submit_page.dart';
import 'package:seek_forms/util.dart';
class AnswerController extends GetxController{
  RxInt currentIndex = 1.obs;

  RxList<int> selectedAnswers = RxList<int>();
  RxList<Map<String, dynamic>> questionList = <Map<String, dynamic>>[].obs;
  RxString testId="".obs;

  
  void initializeSelectedAnswers(int questionCount) {
    selectedAnswers.value = List.generate(questionCount, (index) => -1);
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Set the selected answer for a particular question
  void selectAnswer(int questionIndex, int optionIndex) {
    selectedAnswers[questionIndex] = optionIndex;
  }

  // Get the selected answer for a particular question
  int getSelectedAnswer(int questionIndex) {
    return selectedAnswers[questionIndex];
  }

}
class TestPage extends StatefulWidget {
  final String testId;
  final String title;
  List<String> questionTypes;
  List<Questions> questions;
  TestPage({required this.testId,required this.questionTypes,this.title='title',required this.questions, super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> questionCategory = ['MATHS', 'G.K', 'Reasoning', 'English'];

  List<String> mcq = ['A)', 'B)', 'C)', 'D)'];

  final TimerController timerController = Get.put(TimerController());
  final MockTestPageController mockTestPageController =
      Get.put(MockTestPageController());
  final AnswerController answerController = Get.put(AnswerController());
  final SubmitAnswerApiController submitAnswerApiController = Get.put(SubmitAnswerApiController());
  String questionsId='';
  int option =-1;
  List<Map<String, dynamic>> questionDataList = [];

void addQuestionData(String questionId, int answerIndex) {
  Map<String, dynamic> data = {};
  data['questionId'] = questionId.toString();
  data['answer'] = answerIndex.toInt();
  // Add a copy of the map to the list to avoid reference issues
  questionDataList.add(Map<String, dynamic>.from(data));
  // answerController.questionList.add(Map<String, dynamic>.from(data));
}

  @override
  Widget build(BuildContext context) {
    return
        WillPopScope(
          onWillPop: _onWillPop,
          child:
        Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print(answerController.questionList.toString());
      //   },
      //   child: Icon(Icons.add),
      // ),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 9,
                child: Align(
                    alignment: Alignment.center,
                    child: customBoldText(widget.title, Colors.white))),
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.download,
                  color: Colors.white,
                ))
          ],
        ),
        actions: [
          PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            menuPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey)),
            constraints: BoxConstraints.tightFor(width: 54.w),
            iconColor: Color(0xffF5F5F5),
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                // enabled: false,
                padding: EdgeInsets.zero,
                value: 1,
                // row has two child icon and text.
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review"),
                      Icon(
                        Icons.paste,
                        color: Color(0xffF19157),
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuDivider(),

              // popupmenu item 2
              PopupMenuItem(
                height: 4.h,
                padding: EdgeInsets.zero,
                value: 2,
                // row has two child icon and text
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Share"),
                      Icon(
                        Icons.share,
                        color: Color(0xffF19157),
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                padding: EdgeInsets.zero,
                onTap: () {
                  _onWillPop();
                },

                value: 3,
                // row has two child icon and text
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Submit"),
                      Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xffF19157),
                      )
                    ],
                  ),
                ),
              ),
            ],
            offset: Offset(0, 40),
            color: Colors.white,
            elevation: 2,
          ),
        ],
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          timer(),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 5.h,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.questionTypes.length,
              // questionCategory.length,
              itemBuilder: (context, index) {
                final questionTypeName = widget.questionTypes[index];
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Center(
                          child: Text(
                            questionTypeName,
                        // questionCategory[index],
                      )),
                    ));
              },
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 62.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: mockTestPageController.pageController,
                onPageChanged: (value) {
                  mockTestPageController.currentIndex.value = value;
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  int questionIndex = index;
                  final questionsData = widget.questions[index];
                  return Card(
                    elevation: 0,
                    color: Color(0xffE7F3FF),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
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
                                    widget.questions[index].question ??
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
                              itemCount: questionsData.options!.length,
                              itemBuilder: (context, index) {
                                int optionIndex = index+1;
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      questionsId=questionsData.questionId!;
                                      option = optionIndex;
                                      // postSingleQuestion["questionId"]=questionsData.questionId;
                                      // postSingleQuestion["answer"]=optionIndex;
                                      // print(postSingleQuestion);
                                      answerController.selectAnswer(questionIndex, optionIndex);
                                      // answerController.selectCard(index);
                                      print('Index of ans $index');
                                    },
                                    child: Obx((){
                                    bool isSelected = answerController.getSelectedAnswer(questionIndex) == optionIndex;
                                    return Card(
                                      color:
                                       Colors.white,
                                      elevation: 0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 2.5.h),
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
                                                  questionsData.options![index] ??
                                                      '',
                                                  maxLines: null,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )),
                                            // Spacer(),
                                            Expanded(
                                                flex: 0,
                                                child: isSelected?
                                                Icon(
                                                  Icons.radio_button_checked,
                                                  color: Colors.blue,
                                                ):Icon(
                                                  Icons.circle_outlined,
                                                  color: Colors.grey,
                                                )
                                                )
                                          ],
                                        ),
                                      ),
                                    );}),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(()=>
                    mockTestPageController.currentIndex.value > 0
                        ? IconButton(
                            onPressed: () {
                              
                              mockTestPageController.previousPage();
                            },
                            icon: Icon(
                              CupertinoIcons.chevron_left_circle,
                              color: Colors.white,
                              size: 4.h,
                            ),
                          )
                        : Container(),),
                    Obx(()=>
                    mockTestPageController.currentIndex.value < widget.questions.length-1?
                    IconButton(
                      onPressed: () {
                        
                        mockTestPageController
                            .nextPage(widget.questions.length);
                      },
                      icon: Icon(
                        CupertinoIcons.chevron_right_circle,
                        color: Colors.white,
                        size: 4.h,
                      ),
                    ):Container())
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        addQuestionData(questionsId,option);
                        print(questionDataList);
                        mockTestPageController
                            .nextPage(widget.questions.length);
                      },
                      child: Card(
                        color: Color(0xffF19157),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          child: Row(
                            children: [
                              Text(
                                'Save & Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.skip_next_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      // ),
    ));
  }

  Padding timer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mock test',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          GestureDetector(
            onTap: () {
              timerController.stopTimer();
            },
            child: Card(
              margin: EdgeInsets.zero,
              color: Color(0xffF19157),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 3.w),
                child: Row(
                  children: [
                    Obx(
                      () => customText(
                          '${timerController.hours}:${timerController.minutes}:${timerController.seconds}',
                          Colors.white),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Submission'),
        content: const Text('Are you sure you want to submit the exam?'),actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF19157)
            ) ,child: TextButton(onPressed: () => Get.back(), child: const Text('Go Back',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF19157)
            ),
            child: TextButton(onPressed: () {
              timerController.stopTimer();
              submitAnswerApiController.submitAnswer(widget.testId, questionDataList);
              Get.off(MockTestSubmitPage());
            }, child: const Text('Get Result',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    ));
  }
}

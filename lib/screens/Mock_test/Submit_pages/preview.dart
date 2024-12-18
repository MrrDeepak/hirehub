import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/submit_answer_api_controller.dart';

class Preview extends StatelessWidget {
  Preview({super.key});
  final SubmitAnswerApiController submitAnswerApiController = Get.put(SubmitAnswerApiController());
  List<String> iconList = [
    'assets/svg/preview.svg',
    'assets/svg/rank.svg',
    'assets/svg/percentage.svg',
    'assets/svg/correct.svg',
    'assets/svg/incorrect.svg',
    'assets/svg/unattempt.svg',
  ];
  List<String> previewData = [
    'Score:- 10/200',
    'Rank:- 1/200',
    'Percentage:- 28.26%',
    'Correct:- 02',
    'Incorrect:- 01',
    'Unattempt:- 01'
  ];

  @override
  Widget build(BuildContext context) {
    final data = submitAnswerApiController.previewData.preview;
    return
       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
          child: 
          Column(
            children: [
              previewRow('assets/svg/preview.svg','Score:- ${data!.score}'),
              SizedBox(height: 3.h),
              previewRow('assets/svg/rank.svg','Rank:- ${data.rank}'),
              SizedBox(height: 3.h),
              previewRow('assets/svg/percentage.svg','Percentage:- ${data.percentage.toString()}'),
              SizedBox(height: 3.h),
              previewRow('assets/svg/correct.svg','Correct:- ${data.correctAnswer.toString()}'),
              SizedBox(height: 3.h),
              previewRow('assets/svg/incorrect.svg','Incorrect:- ${data.incorrectAnswer.toString()}'),
              SizedBox(height: 3.h),
              previewRow('assets/svg/unattempt.svg','Unattempt:- ${data.unattemptedQuestions.toString()}'),
              SizedBox(height: 3.h),
              Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  height: 5.5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF19157)
                  ),
                  child: Center(child: Text('Great You Complete Mock Test',style: TextStyle(color: Colors.white),),),
                ),
              )

            ],
          ),
        ),
      );
    
  }

  Row previewRow(String iconPath, String label) {
    return Row(
              children: [
                Expanded(flex: 2,child: Align(alignment: Alignment.centerLeft,child: SvgPicture.asset(iconPath))),
                Expanded(flex: 5,child: Text(label)),
              ],
            );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/model/entrance_exam_model.dart';
import 'package:seek_forms/widgets/flip_container_widget.dart';
import 'package:seek_forms/widgets/search_bar.dart';
import 'package:flip_card/flip_card.dart';

class FlipContainer extends GetxController {
  RxBool newContainerOpened = false.obs;
}

class ExaminationCategory extends StatelessWidget {
  final EntranceExamModel examData;
  String formatText(String input) {
    return input.replaceAll(',', ',\n•');
  }

  ExaminationCategory({required this.examData, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
      appBar: AppBar(
        backgroundColor: Color(0xff5963F4),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: SearchBarWidget(color: Colors.white),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: examData.examData!.length,
              itemBuilder: (context, index) {
                final examCategory = examData.examData![index];
                String eligibilityText=formatText(examCategory.eligibility??'');
                String documentText = formatText(examCategory.document??'');

                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
                  child: FlipContainerCard(
                    frontWidget: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffEC7979)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              examCategory.field ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    backWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffEC7979)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                  Spacer(),
                                  Text(examCategory.field ?? '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(Icons.bookmark_border,
                                      color: Colors.white),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Icon(Icons.share, color: Colors.white)
                                ],
                              ),
                            )),
                        Card(
                          margin: EdgeInsets.only(left: 20.w,right: 1.2.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)
                            )
                          ),
                    
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 0.7.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Eligibility',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text('• $eligibilityText'),
                                    SizedBox(height: 0.25.h),
                                    // Text('• One Year Diploma in Maths'),
                                    // SizedBox(height: 0.5.h),
                                    Text(
                                      'Document',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text('• $documentText'),
                                  ],
                                ),
                              ),
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                    color: Color(0xffF19157)),
                                child: Center(
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/entrance_exam_controller.dart';
import 'package:seek_forms/screens/Entrance_exams/examination_category.dart';
import 'package:seek_forms/widgets/search_bar.dart';

class EntranceExam extends StatelessWidget {
 EntranceExam({super.key});
final EntranceExamController examController = Get.put(EntranceExamController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SearchBarWidget(color: Colors.white),
            SizedBox(
              height: 2.h,
            ),
            Obx(()=> examController.isLoading.value?Expanded(child: Center(child: CircularProgressIndicator(color: Colors.white,),)):
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: examController.entranceExamdata.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 18.h,
                    crossAxisSpacing: 6.w,
                    mainAxisSpacing: 2.8.h,
                  ),
                  itemBuilder: (context, index) {
                    final examData = examController.entranceExamdata[index];
                    return Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.asset(
                              examData.imgUrl??'assets/images/loan.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:  (context) =>  ExaminationCategory(examData: examData,)));
                          },
                          child: Container(
                            height: 3.5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              color: Color(0xffF19157),
                            ),
                            child: Center(
                              child: Text(examData.catagory??'',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),),
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }
}

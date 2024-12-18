import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/model/private_jobs_model.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/screens/job_applied.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/util.dart';
import 'package:seek_forms/widgets/filter/expanded_filter_button.dart';
import 'package:seek_forms/widgets/private_job_widget/jd_details.dart';
import 'package:seek_forms/widgets/private_job_widget/jd_intro.dart';

class JobDescription extends StatelessWidget {
  final Data jobData;
  
  JobDescription({
    required this.jobData,

    super.key,
  });
  final ApplyPrivateJobController jobController = Get.put(ApplyPrivateJobController());
  final HomepageController homepageController = Get.put(HomepageController());
  final PrivateJobSearchController privateJobController = Get.put(PrivateJobSearchController());
  final GovernmentJobSearchController governmentJobController = Get.put(GovernmentJobSearchController());
  final FilterButtonController filterController =
      Get.put(FilterButtonController());

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JdIntro(
                    jobData: jobData,
                  ),
                  JdDetails(
                    jobData: jobData,
                  ),
                  SizedBox(height: 1.h),
                  CustomLabelText(
                      label: ' Job description',
                      size: 18.sp,
                      color: const Color(0xffF19157)),
                  JdDescription(
                    jobDescription: jobData.jobDescription??'',
                  ),
                  //JdDescription(department: department, education: education, experience: experience, requiredSkills: requiredSkills,),
                  SizedBox(height: 1.h),
                  CustomLabelText(
                      label: ' Similar Jobs',
                      size: 18.sp,
                      color: const Color(0xffF19157)),
                  //const JobCard(cardColor: Color(0xffE7F3FF))
                ],
              ),
            ),
          )),
          Obx(()=> privateJobController.isJobApplied.value?
          Container(height: 6.h, color: Color(0xffF19157),child: Center(child: customBoldText('Applied', Colors.white)),):
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 6.h,
                  
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                        backgroundColor: WidgetStatePropertyAll(Color(0xffF19157))),
                    onPressed: () {
                      privateJobController.isJobApplied.value = true;
                      governmentJobController.isJobApplied.value = true;
                      Navigator.push(context,MaterialPageRoute(builder: (context) => JObApplied(),));
                      if(jobData.isSaved.toString() == 'true'){
                      jobController.applySaveLaterJob(jobData.sId??'', context);
                      homepageController.getHomepageData();
                      }else{
                      jobController.applyJob(jobData.sId??'', context);
                      homepageController.getHomepageData();
                      }
                      
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomLabelText(
                            label: 'Apply with seekform', size: 16.sp, color: Colors.white),
                        
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 6.h,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                        backgroundColor: WidgetStatePropertyAll(Color(0xff5892FD))),
                    onPressed: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => JObApplied(),));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomLabelText(
                            label: 'Apply with your self', size: 16.sp, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),)
        ],
      );
  }
}

class JdDescription extends StatelessWidget {
  final String jobDescription;
  const JdDescription({
    required this.jobDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffE7F3FF),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.h),
          child: Html(
            data: jobDescription,
          )),
    );
  }
}

class CustomLabelText extends StatelessWidget {
  final String label;
  final double size;
  Color color;
  CustomLabelText({
    required this.label,
    required this.size,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
    );
  }
}

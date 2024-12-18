import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/screens/application_tracking.dart';
import 'package:seek_forms/util.dart';

class AppliedApplications extends StatelessWidget {
  AppliedApplications({super.key});
  ApplyPrivateJobController jobController =
      Get.put(ApplyPrivateJobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
            child: customBoldText('Applied Applications & Jobs', Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Obx(
          () => jobController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : ListView.builder(
                  itemCount: jobController.appliedJobsData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data =
                        jobController.appliedJobsData[index].jobpostId!;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Card(
                        color: Color(0xffE7F3FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ("${data.jobTitle!.capitalizeFirst??''}"),
                                          softWrap: true,
                                          maxLines: null,
                                        
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp
                                              ),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Text(
                                          ("${data.companyName!.capitalizeFirst??''}"),
                                          softWrap: true,
                                          maxLines: null,
                                        
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined,size: 2.h,),
                                          Text(data.locality??''),
                                          
                                        ],
                                      ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        // height: 8.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset('assets/images/loan.png',fit: BoxFit.cover,))),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      child: SizedBox(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 1.h),
                                            child: Text(
                                              'Get Details',
                                              style: TextStyle(
                                                color: Color(0xffF19157),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationTracking(),));
                                      },
                                      child: SizedBox(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 1.h),
                                            child: Text(
                                              'Track Application',
                                              style: TextStyle(
                                                color: Color(0xffF19157),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/util.dart';
import 'package:seek_forms/widgets/private_job_widget/private_job_card.dart';

class SavedJobs extends StatelessWidget {
  SavedJobs({super.key});
  final ApplyPrivateJobController jobController =
      Get.put(ApplyPrivateJobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.center,
                    child: customBoldText('Saved Jobs', Colors.white))),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
      body: Obx(
        () => jobController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
               : jobController.savedJobsData.isEmpty
                // Show "No Saved Jobs" message when the list is empty
                ? Center(
                    child: Text(
                      'No Saved Jobs',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: jobController.savedJobsData.length,
                      itemBuilder: (context, index) {
                        final data =
                            jobController.savedJobsData[index].jobpostId!;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ("${data.jobTitle!.capitalizeFirst ?? ''}"),
                                              softWrap: true,
                                              maxLines: null,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            Text(
                                              ("${data.companyName!.capitalizeFirst ?? ''}"),
                                              softWrap: true,
                                              maxLines: null,
                                            ),
                                            SizedBox(height: 0.5.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 2.h,
                                                ),
                                                Text(data.locality ?? ''),
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
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'assets/images/loan.png',
                                                  fit: BoxFit.cover,
                                                ))),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: SizedBox(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.h),
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
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationTracking(),));
                                          },
                                          child: SizedBox(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.h),
                                                child: Text(
                                                  'Remove',
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
                  )
                ],
              ),
      ),
    );
  }
}

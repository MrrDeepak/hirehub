import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/model/private_jobs_model.dart';

class JdIntro extends StatelessWidget {
  final Data jobData;

  const JdIntro({
    required this.jobData,
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
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Logo, Title, Share, Notification icons
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(jobData.companyLogo ??
                              'https://cdn-images.himalayas.app/grvfhn8czypmnm6mdsjurzaz38ri')),
                      // SizedBox(width: 2.w),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobData.jobTitle!.capitalizeFirst ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ("${jobData.companyName!.capitalizeFirst ?? ''}"),
                              softWrap: true,
                              maxLines: null,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Spacer(),

                //SizedBox(width: 2.w),
              ],
            ),
            SizedBox(height: 1.h),
            // Job Information
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Salary',
                    style: TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                  ),
                ),
                // SizedBox(width: 2.w),
                Expanded(
                  flex: 6,
                  child: Text(
                    ("${jobData.salary ?? ''}"),
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Location',
                    style: TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                  ),
                ),
                // SizedBox(width: 2.w),
                Expanded(
                  flex: 6,
                  child: Text(
                    jobData.locality!.capitalizeFirst ?? '',
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Job Type',
                    style: TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                  ),
                ),
                // SizedBox(width: 2.w),
                Expanded(
                  flex: 6,
                  child: Text(
                    jobData.jobType!.capitalizeFirst ?? '',
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Vacancy',
                    style: TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                  ),
                ),
                // SizedBox(width: 2.w),
                Expanded(
                  flex: 6,
                  child: Text(
                    jobData.numberOfOpening ?? '',
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

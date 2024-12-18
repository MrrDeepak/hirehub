import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/model/private_jobs_model.dart';

import 'package:seek_forms/screens/private_job/job_details.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/widgets/wide_button.dart'; // For responsive sizing

class JobCard extends StatelessWidget {
  final Data data;
  final Color cardColor;
  
   JobCard(
      {required this.data,
      
      this.cardColor = Colors.white,
      
      super.key});
  PrivateJobSearchController searchController = Get.put(PrivateJobSearchController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Logo, Title, Share, Notification icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      data.companyLogo ?? 'https://cdn-images.himalayas.app/grvfhn8czypmnm6mdsjurzaz38ri', // Company logo
                      height: 4.h,
                      //fit: BoxFit.contain,
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.jobTitle ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          data.companyName ?? '',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                const Icon(
                  Icons.share,
                  color: Color(0xffF19157),
                ),
                //SizedBox(width: 2.w),
              ],
            ),
            SizedBox(height: 1.h),

            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Salary',
                      style:
                          TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      data.salary ?? '',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Text(
                      'Education',
                      style:
                          TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      data.qualification ?? '',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Text(
                      'Location',
                      style:
                          TextStyle(color: Color(0xff929292), fontSize: 15.sp),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      data.locality ?? '',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
              ],
            ),
            SizedBox(
              height: 5.h,
              child: CustomWideButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Jobdetails(
                        jobData: data,
                       
                      ),
                    ),
                  );
                },
                label: "Apply Now",
                buttonBackgroundColor: const Color(0xffF19157),
                borderRadius: 10,
              ),
            ),
            SizedBox(height: 2.h),
            Obx(()=>
            SizedBox(
              height: 5.h,
              child: CustomWideButton(
                onTap: () {
                  searchController.change.value = !searchController.change.value;
                },
                label: searchController.change.value? "Save for later":"save",
                labelColor: Colors.black,
                buttonBackgroundColor: Colors.white,
                borderRadius: 10,
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

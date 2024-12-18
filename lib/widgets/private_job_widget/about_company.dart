import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:seek_forms/model/private_jobs_model.dart';

class AboutCompany extends StatelessWidget {
  final Data jobData;

  const AboutCompany({required this.jobData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Card(
            color: Color(0xffE7F3FF),
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
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(jobData
                                      .companyLogo ??
                                  'https://cdn-images.himalayas.app/grvfhn8czypmnm6mdsjurzaz38ri')),
                          SizedBox(width: 2.w),
                          Text(
                            jobData.companyName ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Html(data: jobData.aboutCompany)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

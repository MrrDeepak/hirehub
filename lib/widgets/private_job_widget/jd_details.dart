import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/model/private_jobs_model.dart';

class JdDetails extends StatelessWidget {
  final Data jobData;
  const JdDetails({
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Job Information
          Row(children: []),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Department',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
              Text(jobData.subCategoryName??''),
            ],
          ),
          SizedBox(height: 1.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Education',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
              Text(jobData.qualification??''),
            ],
          ),
          SizedBox(height: 1.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Job Experience',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
              Text("${jobData.experience??''}"),
            ],
          ),
          SizedBox(height: 1.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Required Skills',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
              Text(jobData.skills??''),
            ],
          ),
        ]),
      ),
    );
  }
}
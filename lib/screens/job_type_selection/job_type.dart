
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:seek_forms/widgets/selector.dart';

import 'package:seek_forms/widgets/wide_button.dart';


class JobType extends StatefulWidget {
  const JobType({super.key});

  @override
  State<JobType> createState() => _JobTypeState();
}

class _JobTypeState extends State<JobType> {
  int selectedOption = 0;
  bool isCheck = false;
  List<String> jobType = [
    'Full time',
    'Part time',
    'Freelance',
    'Remote',
    'Contract',
    'Internship',
    'Hybrid'
  ];
  List<String> selectedJobTypes = [];

  @override
  Widget build(BuildContext context) {
    print(selectedJobTypes.toString());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: 5.h,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.27.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF19157),
                          fontSize: 2.h),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [SvgPicture.asset('assets/svg/jobType.svg')],
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: 83.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 68.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: jobType.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: CustomSelector(
                            mainaxisAlignment: MainAxisAlignment.spaceBetween,
                            value: selectedJobTypes.contains(jobType[index]),
                            
                            jobTypeName: jobType[index],
                            onChanged: (value) {
                              _onSelected(value , jobType[index]);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomWideButton(
                      onTap: () {},
                      label: "Next",
                      buttonBackgroundColor: const Color(0xffF19157),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onSelected(bool? value, String jobType) {
    if(value == true){
      setState(() {
        selectedJobTypes.add(jobType);
      });
    }
    else{
      setState(() {
        selectedJobTypes.remove(jobType);
      });
    }
}
}



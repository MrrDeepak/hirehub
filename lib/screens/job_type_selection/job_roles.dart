import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/widgets/wide_button.dart';

class JobRoles extends StatefulWidget {
  const JobRoles({super.key});

  @override
  State<JobRoles> createState() => _JobRolesState();
}

class _JobRolesState extends State<JobRoles> {
  int selectedOption = 0;
  bool isCheck = false;
  List<String> jobRole = [
    "Backend Developer",
    "Graphic designer",
    "UX designer",
    "Full Stack Developer",
    "Mobile App Developer",
  ];
  List<String> jobRoles = [
    "Web designer",
    "Digital Marketing",
    "UI designer",
    "Java Developer",
    "UI/UX designer"
  ];

  @override
  Widget build(BuildContext context) {
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
                  CustomTextButton(
                    title: 'Skip',
                    textColor: const Color(0xffF19157),
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
                      height: 32.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextButton(
                                title: 'Select Job Roles',
                                textColor: Colors.white,
                              ),
                              CustomTextButton(
                                title: 'See all',
                                textColor: const Color(0xffF19157),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 28.h,
                              //width: 25.h,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Row(
                                      children: [
                                        IntrinsicWidth(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.h),
                                                    child: Text(
                                                      jobRole[index],
                                                      style: const TextStyle(
                                                          //fontSize: 1.7.h,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Radio(
                                                    activeColor:
                                                        const Color(0xffF19157),
                                                    value: 1,
                                                    groupValue: selectedOption,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedOption = value!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          width: 1.h,
                                        ),
                                        IntrinsicWidth(
                                          child: Container(
                                              constraints:
                                                  const BoxConstraints(minWidth: 0.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.h),
                                                    child: Text(
                                                      jobRoles[index],
                                                      style: const TextStyle(
                                                          //fontSize: 1.7.h,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Radio(
                                                    activeColor:
                                                        const Color(0xffF19157),
                                                    value: 1,
                                                    groupValue: selectedOption,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedOption = value!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                        height: 32.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextButton(
                                  title: 'Location',
                                  textColor: Colors.white,
                                ),
                                CustomTextButton(
                                  title: 'See all',
                                  textColor: const Color(0xffF19157),
                                )
                              ],
                            )
                          ],
                        )),
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
}

class CustomTextButton extends StatelessWidget {
  String title;
  Color textColor;
  CustomTextButton({
    required this.textColor,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 2.h),
      ),
    );
  }
}

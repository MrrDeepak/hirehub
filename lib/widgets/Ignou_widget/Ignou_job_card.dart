import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/model/ignou_data_model.dart';


class IgnouJobCard extends StatelessWidget {
  final FormData formdata;
  void Function() ontap;
   IgnouJobCard({required this.formdata,required this.ontap,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8), // Border radius of the card
  ),

      child: Container(
        // height: 20.h,
        // width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: [Color(0xff716FFF), Color(0xff05A000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 9.2.h,
                    width: 55.w,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          ("${formdata.program??''} ${formdata.fieldOfStudy??''}"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17.sp),
                        ),
                      ),
                      Text(
                        formdata.college??'',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(formdata.location??''),
                        ],
                      ),
                    ],
                  ),
                  ),
                  
                  Spacer(),
                  SizedBox(
                      height: 8.h,
                      width: 25.w,
                      child: Image.asset('assets/images/loan.png'))
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Row(children: [
                _customText('Total Fee', Colors.white),
                SizedBox(width: 10.w),
                _customText('₹ ${formdata.totalFee}', Colors.white)
              ]),
              SizedBox(
                height: 0.5.h,
              ),
              Row(children: [
                _customText('Eligibility', Colors.white),
                SizedBox(width: 10.w),
                _customText(formdata.eligibility??'', Colors.white)
              ]),
              Row(children: [
                _customText('Platform Fee', Colors.white),
                SizedBox(width: 5.w),
                _customText('₹ ${formdata.platformFee.toString()}', Colors.white),
                Spacer(),
                GestureDetector(
                  onTap: ontap,
                  child: Container(
                    height: 3.7.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: Color(0xffF19157),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Text _customText(String name, Color color) => Text(
        name,
        style: TextStyle(color: color),
      );
}

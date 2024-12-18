import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/payment/confirm_payment.dart';
import 'package:seek_forms/util.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBoldText('Basic Details', Colors.black),
                SizedBox(height: 2.h),
                _customRow(
                    'Name', Colors.black, 'Rahul Kumar', Color(0xff435FEE)),
                Divider(color: Colors.white),
                SizedBox(height: 1.h),
                _customRow(
                    'Phone', Colors.black, '+91 9987654321', Color(0xff435FEE)),
                Divider(color: Colors.white),
                SizedBox(height: 1.h),
                _customRow('Email', Colors.black, 'rahulkumar54@gmail.com',
                    Color(0xff435FEE)),
                Divider(color: Colors.white),
                SizedBox(height: 1.h),
                _customRow(
                    'Date', Colors.black, '12/12/2024', Color(0xff435FEE)),
                Divider(color: Colors.white),
                SizedBox(height: 3.h),
                customBoldText('Admission Summary', Color(0xff5963F4)),
                SizedBox(height: 2.h),
                Container(
                  height: 22.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffE7F3FF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 2.h, bottom: 2.h, left: 5.w, right: 20.w),
                    child: Column(
                      children: [
                        _customSummaryRow(
                            'Program:', Color(0xff929292), 'MBA', Colors.black),
                        SizedBox(height: 1.h),
                        _customSummaryRow('Location:', Color(0xff929292),
                            'Delhi', Colors.black),
                        SizedBox(height: 1.h),
                        _customSummaryRow('College Name:', Color(0xff929292),
                            'Hansraj College', Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Container(
                  height: 16.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffE7F3FF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 2.h, bottom: 2.h, left: 5.w, right: 20.w),
                    child: Column(
                      children: [
                        _customSummaryRow('Admission Fee:', Color(0xff929292),
                            '₹15999', Colors.black),
                        SizedBox(height: 1.h),
                        _customSummaryRow(
                            'GST:', Color(0xff929292), '₹199', Colors.black),
                        SizedBox(height: 1.h),
                        _customSummaryRow('Platform Charge:', Color(0xff929292),
                            '₹100', Colors.black),
                        SizedBox(height: 1.h),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: customBoldText('Total:', Color(0xff435FEE))),
                            Expanded(child: customBoldText('₹16298', Color(0xff435FEE)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmPayment(),
                  ));
            },
            child: Container(
              height: 6.h,
              width: double.infinity,
              color: Color(0xffE7F3FF),
              child: Center(
                  child: customBoldText('Make Payment', Color(0xff5963F4))),
            ),
          ),
        ],
      ),
    );
  }

  Row _customRow(
      String title, Color titleColor, String subtitle, Color subtitleColor) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(title, titleColor),
        Spacer(),
        customText(subtitle, subtitleColor),
        SizedBox(
          width: 4.w,
        )
      ],
    );
  }

  Row _customSummaryRow(
      String title, Color titleColor, String subtitle, Color subtitleColor) {
    return Row(
      children: [
        Expanded(child: customText(title, titleColor)),
        Expanded(child: customText(subtitle, subtitleColor)),
      ],
    );
  }

  
}

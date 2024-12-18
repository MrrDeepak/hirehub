import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/util.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Container(
              height: 22.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffE7F3FF), borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customBoldText('Recommended', Colors.black),
                    SizedBox(height: 2.h),
                    CustomRow(imageUrl: 'assets/svg/gpay.svg', name: 'Google Pay', trailing: '>'),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 0.5.h),
                    CustomRow(imageUrl: 'assets/svg/paytm.svg', name: 'Paytm', trailing: '>'),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 0.5.h),
                    CustomRow(imageUrl: 'assets/svg/PhonePe.svg', name: 'PhonePe', trailing: '>'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              height: 17.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffE7F3FF), borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customBoldText('Card', Colors.black),
                    SizedBox(height: 2.h),
                    CustomRow(imageUrl: 'assets/svg/card-credit.svg', name: 'Google Pay', trailing: 'Add'),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 0.5.h),
                    CustomRow(imageUrl: 'assets/svg/cred.svg', name: 'Paytm', trailing: 'Add'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              height: 12.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffE7F3FF), borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customBoldText('Net banking', Colors.black),
                    SizedBox(height: 2.h),
                    CustomRow(imageUrl: 'assets/svg/netBanking.svg', name: 'Net banking', trailing: 'Add',fit: BoxFit.contain,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              height: 17.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffE7F3FF), borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customBoldText('Pay Later', Colors.black),
                    SizedBox(height: 2.h),
                    CustomRow(imageUrl: 'assets/svg/Amazon.svg', name: 'Amazon', trailing: 'Add'),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 0.5.h),
                    CustomRow(imageUrl: 'assets/svg/flipkart.svg', name: 'flipkart', trailing: 'Add'),
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

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.trailing,
    this.fit = BoxFit.cover
  });

  final String imageUrl;
  final String name;
  final String trailing;
  final BoxFit fit;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 3.h,
                      width: 17.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: EdgeInsets.all(0.3.h),
                        child: Center(
                          child: SvgPicture.asset(
                            imageUrl,
                            fit: fit,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                trailing,
                style: TextStyle(color: Color(0xffF19157), fontSize: 17.sp),
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   color: Color(0xffF19157),
              //   size: 1.7.h,
              // ),
              SizedBox(
                width: 5.w,
              )
            ],
          ),
        )
      ],
    );
  }
}

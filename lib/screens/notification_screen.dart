import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/util.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(flex: 4,child: Align(alignment: Alignment.center,child: customBoldText('Notification', Color(0xffF19157)))),
            Expanded(flex: 1,child: Container())
          ],
        ),
        

        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 0.5.h),
                child: Card(
                  // height: 6.h,
                  // width: double.infinity,
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/google.png',
                                fit: BoxFit.cover,
                              ),
                            )),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  customBoldText('Junior engineer : 1',
                                      Color(0xffF19157)),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text('opportunity in'),
                                  Spacer(),
                                  Text('01h'),
                                ],
                              ),
                              SizedBox(height: 0.5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Noida',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Spacer(),
                                  Container(
                                    height: 2.5.h,
                                    width: 13.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6),
                                        color: Color(0xff435FEE)),
                                    child: Center(
                                        child: Text(
                                      'view',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

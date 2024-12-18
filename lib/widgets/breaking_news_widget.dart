import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BreakingNewsContainer extends StatelessWidget {
  const BreakingNewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF82F2F),
                Color(0xffF80000),
                Color(0xff690000),
              ],
              tileMode: TileMode.decal,
              begin: Alignment.topCenter, // Change from topLeft to centerLeft
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 15.w),
                  child: Text(
                    'BREAKING',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.2, 0],
                      begin: Alignment
                          .topLeft, // Change from topLeft to centerLeft
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    'NEWS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/onDay.png'))
      ],
    );
  }
}

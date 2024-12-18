import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/widgets/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback onTap;
  const CustomAppBar({required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF19157), // Background color (light blue)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 6,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),
                child: Row(children: [
                  SizedBox(width: 2.w,),
                  Icon(CupertinoIcons.search,color: Colors.grey,),
                  SizedBox(width: 2.w,),
                  Text('Search by State & Qualification',style: TextStyle(color: Colors.grey,fontSize: 16.sp),)
                ],),
              ),
            )
            // SearchBarWidget(label: 'Search by State & Qualification',color: Colors.white)
            ),
          SizedBox(width: 2.w,),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0.7.h),
              height: 5.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
              child: SvgPicture.asset('assets/svg/filterIcon.svg')
            
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(60); // Set the height of the AppBar
}

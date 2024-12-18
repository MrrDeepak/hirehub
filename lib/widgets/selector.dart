import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/screens/authentication/create_account.dart';

class CustomSelector extends StatefulWidget {
  MainAxisAlignment mainaxisAlignment;
  String? jobTypeName;
  final bool value;
  //final int groupValue;
  final ValueChanged<bool?> onChanged;
  CustomSelector(
      {required this.mainaxisAlignment,
      required this.jobTypeName,
      required this.value,
      //required this.groupValue,
      required this.onChanged,
      super.key});

  @override
  State<CustomSelector> createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6.h,
        //width: 90.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: widget.mainaxisAlignment,
          //MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Text(
                widget.jobTypeName.toString(),
                style: TextStyle(fontSize: 1.7.h, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.h),
              child: Checkbox(
                value: widget.value,
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ));
  }
}

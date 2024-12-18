import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomWideButton extends StatelessWidget {
  void Function()? onTap;
  String label;
  Widget leading;

  Color? labelColor;
  double borderRadius;
  Color? buttonBackgroundColor;
  CustomWideButton({
    super.key,
    required this.onTap,
    required this.label,
    this.buttonBackgroundColor,
    this.leading = const SizedBox(),
    this.labelColor = Colors.white,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 90.w,
          height: 6.h,
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: buttonBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              // Darker shadow on bottom right (outside)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

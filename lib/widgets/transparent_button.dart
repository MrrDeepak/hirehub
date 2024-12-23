import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/screens/authentication/create_account.dart';

class CustomTransparentButton extends StatelessWidget {
  String label;
  Color backgroundColor;
  Widget nextPage;
  Color labelColor;
   CustomTransparentButton({this.labelColor = Colors.black,required this.label,required this.backgroundColor,required this.nextPage,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 90.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: backgroundColor,
            side: const BorderSide(width: 1.0, color: Colors.black)),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
          Navigator.of(context)
              .push(PageAnimation().createAccountRoute(nextPage));
        },
        child: Text(
          label,
          style: TextStyle(color: labelColor,fontSize: 2.2.h, ),
        ),
      ),
    );
  }
}

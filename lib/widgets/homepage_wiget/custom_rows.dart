import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Row customTextRow(String label, String apply, String percentage) {
    return Row(
      children: [
        Expanded(flex: 4,child: Text(label)),
        Expanded(child: Align(alignment: Alignment.center,child: Text(apply))),
        Expanded(child: Align(alignment: Alignment.centerRight,child: Text(percentage)))
      ],
    );
    
  }
  Row customFieldRow(String label, String apply, String percentage,Color color) {
    return Row(
      children: [ 
        Expanded(
          flex: 6,
          child: Row(
            children: [
              Container(height: 1.2.h,width: 2.4.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: color),),
              SizedBox(width: 1.w,),
              Text(label,maxLines: null,softWrap: true,),
            ],
          ),
        ),
        Expanded(child: Align(alignment: Alignment.center,child: Text(apply))),
        Expanded(flex: 2, child: Align(alignment: Alignment.centerRight,child: Text(percentage)))
      ],
    );
    
  }
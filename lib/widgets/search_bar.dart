import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarWidget extends StatelessWidget {
  final Color color;
  final String label;
  
  const SearchBarWidget({
    this.label='Search',
    required this.color,
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
      height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      decoration: BoxDecoration(
        //color: color, // Background of the search bar
        borderRadius: BorderRadius.circular(10),
      ),
      child: SearchBar(

        elevation: WidgetStatePropertyAll(0),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        leading: const Icon(Icons.search,color: Colors.grey,),
        hintText: label,
        hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
      )
    
    );
  }
}
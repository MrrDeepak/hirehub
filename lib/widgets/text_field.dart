import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  String? labelText;
  final String hintText;

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  CustomTextField({
    this.suffixIcon,
    required this.obscureText,
    this.keyboardType,
    required this.hintText,
    super.key,
    this.labelText = "",
   required this.controller,
   this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border()),
      child: TextFormField
      (
        
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          // suffixIcon: suffixIcon,
          suffix: suffixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 2.8.h),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          //labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(
              color: Colors.black, // Change label color
              fontSize: 16.0,     // Change font size if needed
            ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

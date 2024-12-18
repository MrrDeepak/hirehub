import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/Api_Controller/reset_password_controller.dart';
import 'package:seek_forms/screens/authentication/login.dart';
import 'package:seek_forms/widgets/text_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';

class ResetPassword extends StatefulWidget {
  final String mobileNumber;
  const ResetPassword({required this.mobileNumber, super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    with SingleTickerProviderStateMixin {
      final ResetPasswordService resetPasswordController = Get.put(ResetPasswordService()); 
  late AnimationController _controller;
  //late Animation<Offset> _offsetAnimation;
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  //final _confirmPasswordController = TextEditingController();

  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    /* _offsetAnimation = Tween<Offset>(
      begin: const Offset(-3.0, 0.0), // Starts from right
      end: Offset.zero, // Ends at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );*/
    // Start the animation as soon as the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: Image.asset(
                "assets/images/login.gif",
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ),
            //SizedBox(height: 1.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              height: 76.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    // Use SlideTransition for the "Create an Account" text
                    /*SlideTransition(
                        position: _offsetAnimation,
                        child: Image.asset('assets/images/welcomeBack.png')
                        // Text(
                        //   "Create an Account",
                        //   style: TextStyle(
                        //     fontSize: 2.7.h,
                        //     color: Colors.blue.shade900,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        ),*/
                    Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 2.2.h,
                    ),

                    CustomTextField(
                      obscureText: true,
                      validator: (value) {
                        return createPasswordValidator(value!);
                      },
                      controller: _createPasswordController,
                      hintText: "New Password",
                      labelText: "New Password",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    CustomTextField(
                      obscureText: true,
                      validator: (value) {
                        return confirmPasswordValidator(value!);
                      },
                      controller: _confirmPasswordController,
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    Obx((){
                      return resetPasswordController.isLoading.value
                            ? CircularProgressIndicator(
                                color: const Color(0xffF19157),
                              )
                            :CustomWideButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          resetPasswordController.resetUserPassword(
                            widget.mobileNumber,
                            _createPasswordController.text.trim(),
                            _confirmPasswordController.text.trim(),
                            context,
                          );
                        
                        }
                      },
                      label: "Confirm",
                      buttonBackgroundColor: const Color(0xffF19157),
                    );
                    })
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? createPasswordValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else if (val.length < 6) {
      return "Password must be at least 6 characters.";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else if (val.length < 6) {
      return "Password must be at least 6 characters.";
    }
    if (_createPasswordController.text != val) {
      return "Password do not match";
    } else {
      return null;
    }
  }
}

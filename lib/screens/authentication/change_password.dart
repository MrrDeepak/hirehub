
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/change_password_controller.dart';
import 'package:seek_forms/widgets/text_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>
    with SingleTickerProviderStateMixin {
  final ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  late AnimationController _controller;
  //late Animation<Offset> _offsetAnimation;
  final _oldPasswordController = TextEditingController();
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
                      'Change Password',
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
                        return oldPasswordValidator(value!);
                      },
                      controller: _oldPasswordController,
                      hintText: "Old Password",
                      labelText: "Old Password",
                    ),
                    SizedBox(
                      height: 2.h,
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
                      return changePasswordController.isLoading.value
                            ? CircularProgressIndicator(
                                color: const Color(0xffF19157),
                              )
                            :CustomWideButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          changePasswordController.changePassword(_oldPasswordController.text, _createPasswordController.text,_confirmPasswordController.text, context);
                        }
                      },
                      label: "Confirm",
                      buttonBackgroundColor: Color(0xff18558E),
                    );
                    }),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? oldPasswordValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else if (val.length < 6) {
      return "Password must be at least 6 characters.";
    } else {
      return null;
    }
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/forget_password_controller.dart';
import 'package:seek_forms/screens/authentication/login.dart';
import 'package:seek_forms/widgets/phone_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';
import 'package:seek_forms/widgets/transparent_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final _phoneController = TextEditingController();

  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-3.0, 0.0), // Starts from right
      end: Offset.zero, // Ends at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

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
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/forget.gif",
                    height: 26.h,
                    fit: BoxFit.cover,
                  ),
                ),
                //SizedBox(height: 6.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 70.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        // Use SlideTransition for the "Create an Account" text
                        SlideTransition(
                          position: _offsetAnimation,
                          child:
                              // Image.asset('assets/images/welcomeBack.png')
                              Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 2.7.h,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.2.h,
                        ),

                        CustomPhoneField(
                          validator: (value) {
                            return phoneValidator(value!);
                          },
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          hintText: "Enter your phone",
                          labelText: "Enter your phone",
                          numberLimit: 10,
                        ),
                        SizedBox(
                          height: 2.7.h,
                        ),
                        Obx((){
                          return forgetPasswordController.isLoading.value
                            ? CircularProgressIndicator(
                                color: const Color(0xffF19157),
                              )
                            :CustomWideButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              forgetPasswordController.forgetPassword(
                                  _phoneController.text, context);
                            }
                          },
                          label: "Send OTP",
                          buttonBackgroundColor: const Color(0xffF19157),
                        );
                        }),

                        
                        SizedBox(
                          height: 2.7.h,
                        ),

                        CustomTransparentButton(
                            label: 'Log In',
                            backgroundColor: const Color(0xff74DFE6),
                            nextPage: const LoginScreen())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40.0, // Adjust the position as per your design
            left: 10.0, // Adjust the position as per your design
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  String? phoneValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    }
    if (val.length != 10) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/authentication/reset_password.dart';
import 'package:seek_forms/widgets/wide_button.dart';


class OtpScreen extends StatefulWidget {
  final String otp;
  
  final Widget ontap;
  const OtpScreen({required this.ontap,required this.otp,super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  final _otpController = TextEditingController();
  late AnimationController _controller;
  //late Animation<Offset> _offsetAnimation;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey shakeKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // _offsetAnimation = Tween<Offset>(
    //   begin: const Offset(0.0, -6.0),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    // );
    _controller.forward();
  }
  // Function to verify the entered OTP
  void verifyOtp() {
    String enteredOtp = _otpController.text;

    if (enteredOtp == widget.otp) {
      // If OTP matches, navigate to homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  widget.ontap
        // ResetPassword(mobileNumber: widget.mobileNumber,)
        ),
      );
    } else {
      // Show error message if OTP doesn't match
      print("Invalid OTP");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the keyboard height using MediaQuery
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xffF19157),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            // Background content (Orange background with images)
            // SizedBox(height: 5.5.h,),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5.5.h,
                  ),
                  // SlideTransition(
                  //   position: _offsetAnimation,
                  //   child: SvgPicture.asset(
                  //     "assets/svg/welcomeToSeekForm.svg",
                  //     height: 10.h,
                  //   ),
                  // ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    "assets/images/otpGif.gif",
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
            // Teal container that moves when the keyboard appears
            Positioned(
              // Adjust the position of the teal container based on keyboard height
              top: keyboardHeight > 0 ? 20.h - keyboardHeight * 0.2 : 20.h,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      height: 70.2.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff51D7E0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Enter OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 2.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Pinput(
                              // validator: (value) {
                              //   return optValidator(value!);
                              // },
                              validator: (value) => optValidator(value!),
                              controller: _otpController,
                              length: 6,
                              defaultPinTheme: PinTheme(
                                width: 16.w,
                                height: 5.5.h,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomWideButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                verifyOtp();
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => JobsSection(),));
                                // Navigator.pushAndRemoveUntil(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return const JobsSection();
                                // }), (Route<dynamic> route) => false);
                              }
                            },
                            label: "Confirm",
                            buttonBackgroundColor: const Color(0xffF19157),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 10,
                                ),
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: const Color(0xffF19157),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 100,
                          // ),
                          Text(widget.otp),
                        ],
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }

  String? optValidator(String value) {
    if (value.isEmpty) {
      return 'OTP is required';
    }
    else if(value.length < 6){
      return 'Enter valid OTP';

    }
     else {
      return null;
    }
  }
}

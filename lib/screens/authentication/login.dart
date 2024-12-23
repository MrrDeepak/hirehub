import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/screens/authentication/create_account.dart';
import 'package:seek_forms/screens/authentication/forget_password.dart';
import 'package:seek_forms/Api_Controller/login_controller.dart';
import 'package:seek_forms/widgets/phone_field.dart';
import 'package:seek_forms/widgets/text_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';
import 'package:seek_forms/widgets/transparent_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final LoginUserController loginController = Get.put(LoginUserController());
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final _phoneController = TextEditingController();
  final _createPasswordController = TextEditingController();
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
  ProfileController profileController = Get.put(ProfileController());

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
                      SlideTransition(
                          position: _offsetAnimation,
                          child: 
                          // Image.asset('assets/images/welcomeBack.png')
                          Text(
                            "Create an Account",
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
                        hintText: "Phone",
                        labelText: "Phone",
                        numberLimit: 10,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      CustomTextField(
                        obscureText: true,
                        validator: (value) {
                          return passwordValidator(value!);
                        },
                        controller: _createPasswordController,
                        hintText: "Password",
                        labelText: "Password",
                      ),

                      SizedBox(
                        height: 3.h,
                      ),
                      Obx(() {
                        return loginController.isLoading.value
                            ? CircularProgressIndicator(
                                color:  Colors.white,
                              )
                            : CustomWideButton(
                                onTap: () {
                                  

                                  if (_formKey.currentState!.validate()) {
                                    loginController.loginUser(
                                      _phoneController.text,
                                      _createPasswordController.text,
                                      context,
                                    );
                                  }
                                },
                                label: "Log In",
                                labelColor: Colors.white,
                                buttonBackgroundColor: Color(0xff18558E),
                              );
                      }),
                      

                      SizedBox(
                        height: 1.7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword(),
                                  ));
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 1.9.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("You don’t have an Account?",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 1.7.h)),
                        ],
                      ),
                      SizedBox(
                        height: 1.7.h,
                      ),
                      CustomTransparentButton(
                          label: 'Sign Up',
                          backgroundColor: Colors.white,
                          nextPage: const CreateAccount())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  String? validator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
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

  String? passwordValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else if (val.length < 6) {
      return "Password must be at least 6 characters.";
    } else {
      return null;
    }
  }
}

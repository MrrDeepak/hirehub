import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/authentication/login.dart';
import 'package:seek_forms/Api_Controller/create_account_controller.dart';
import 'package:seek_forms/widgets/phone_field.dart';
import 'package:seek_forms/widgets/text_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';

class CreateAccountPageController extends GetxController {
  RxBool isPasswordVisible = false.obs;
}

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount>
    with SingleTickerProviderStateMixin {
  final CreateAccountController createUserController =
      Get.put(CreateAccountController());
  final CreateAccountPageController pageController =
      Get.put(CreateAccountPageController());
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/createAccGif.gif",
                      height: 19.h,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: 76.h,
                    child: SingleChildScrollView(
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
                              child: Text('Create an Account',style: TextStyle(color: Colors.white,fontSize: 19.sp,fontWeight: FontWeight.bold),)
                              // Image.asset(
                              //     'assets/images/createAccText.png'),
                            ),
                            SizedBox(
                              height: 3.2.h,
                            ),
                            CustomTextField(
                              obscureText: false,
                              validator: (value) {
                                return nameValidator(value!);
                              },
                              controller: _nameController,
                              hintText: "Name",
                              labelText: "Name",
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomTextField(
                              obscureText: false,
                              validator: (value) {
                                return emailValidator(value!);
                              },
                              controller: _emailController,
                              hintText: "Email",
                              labelText: "Email",
                            ),
                            SizedBox(
                              height: 2.h,
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
                                obscureText:true,
                                    
                                validator: (value) {
                                  return createPasswordValidator(value!);
                                },
                                controller: _createPasswordController,
                                hintText: "New password",
                                labelText: "New password",
                               
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
                              height: 1.7.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Colors.white,
                                  height: 2.h,
                                  width: 4.w,
                                  margin: const EdgeInsets.all(10),
                                  child: Checkbox(
                                    activeColor: Colors.black,
                                    checkColor: Colors.white,
                                    value: isCheck,
                                    onChanged: (val) {
                                      setState(() {
                                        isCheck = val!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Agree with ",
                                  style: TextStyle(
                                    fontSize: 1.7.h,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Term ",
                                  style: TextStyle(
                                    fontSize: 1.7.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "& ",
                                  style: TextStyle(
                                    fontSize: 1.7.h,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Privacy Policy ",
                                  style: TextStyle(
                                    fontSize: 1.7.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Obx(() {
                              return createUserController.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : CustomWideButton(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (isCheck) {
                                            // Navigator.of(context).push(PageAnimation()
                                            //     .createAccountRoute(const OtpScreen()));
                                            //createUserData();
                                            createUserController.createUserData(
                                              _nameController.text,
                                              _emailController.text,
                                              _phoneController.text,
                                              _createPasswordController.text,
                                              _confirmPasswordController.text,
                                              context,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Please accept terms and conditions"),
                                              duration: Duration(seconds: 2),
                                            ));
                                          }
                                        }
                                      },
                                      label: "Sign Up",
                                      buttonBackgroundColor:
                                          const Color(0xff18558E),
                                    );
                            }),

                            SizedBox(
                              height: 2.7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 1.7.h)),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 1.7.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Back button in Stack
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

  String? nameValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    }
    if (!val.contains("@")) {
      return "Please enter valid email";
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

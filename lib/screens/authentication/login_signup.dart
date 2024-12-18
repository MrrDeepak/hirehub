import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/authentication/create_account.dart';
import 'package:seek_forms/widgets/transparent_button.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 12.h,
          ),
          SvgPicture.asset(
            "assets/svg/seekformstext.svg",
            height: 5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 24.5.h,
            //width: 22.5.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/signUpGif.gif",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 17.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ellipseBlur.png"),
                          fit: BoxFit.contain)),
                ),
                Center(
                  heightFactor: 2,
                  child: SvgPicture.asset(
                    "assets/svg/signUp.svg",
                    height: 4.h,
                  ),
                ),
                //SizedBox(height: 10.h,),
                Align(
                  alignment: Alignment.bottomCenter,
                  //heightFactor: 0.1.h,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffEFA465),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: 38.h,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60.0),
                        child: Column(
                          children: [
                            CustomTransparentButton(
                              label: 'Start with phone',
                              backgroundColor: const Color(0xffEFA465),
                              nextPage: const CreateAccount(),
                            ),
                            // SizedBox(
                            //   height: 6.h,
                            //   width: 90.w,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //         elevation: 0,
                            //         foregroundColor: Colors.white,
                            //         backgroundColor: const Color(0xffEFA465),
                            //         side: const BorderSide(
                            //             width: 1.0, color: Colors.white)),
                            //     onPressed: () {
                            //       Navigator.of(context).push(PageAnimation()
                            //           .createAccountRoute(const CreateAccount()));
                            //       // Navigator.push(context,
                            //       //     MaterialPageRoute(builder: (context) {
                            //       //   return const CreateAccount();
                            //       // }));
                            //     },
                            //     child: Text(
                            //       'Start with phone',
                            //       style: TextStyle(
                            //           fontSize: 2.2.h,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 6.h,
                                    endIndent: 2.h,
                                  ),
                                ),
                                Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 2.h),
                                ),
                                Expanded(
                                    child: Divider(
                                  endIndent: 6.h,
                                  indent: 2.h,
                                  color: Colors.white,
                                  thickness: 1,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              //margin: EdgeInsets.symmetric(horizontal: 10.w),
                              height: 6.h,

                              width: 90.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        0.3), // Shadow color with transparency
                                    spreadRadius: 3, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset:
                                        const Offset(0, 5), // X and Y offsets
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/google.png",
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 2.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/screens/authentication/login_signup.dart';
import 'package:seek_forms/screens/homepage/bottomBar.dart';
import 'package:seek_forms/screens/jobs_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  ProfileController profileController = Get.put(ProfileController());
  // ApplyJobController jobController = Get.put(ApplyJobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset('assets/animation.json',
            
                fit: BoxFit.fill, height: 100.h, width: 500.w),
          ),
          // Positioned(
          //   top: -12.h,
          //   left: 0,
          //   right: 0,
          //   bottom: 0, // Vertical centering
          //   child: Image.asset(
          //     "assets/images/splashGif.gif",
          //   ),
          // ),
          GestureDetector(
            onTap: () async{
              SharedPreferences pref = await SharedPreferences.getInstance();
              String? token = pref.getString('access_token');
              if(token != null){
                profileController.getProfileDetails();
                // jobController.fetchAppliedJob(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar(),));

              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSignup(),));

              }
              
            },

            /// Transparent button
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 340.0),
                child: Container(
                    height: 12.h,
                    width: 75.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

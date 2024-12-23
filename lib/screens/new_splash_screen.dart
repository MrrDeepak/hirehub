import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';
import 'package:seek_forms/screens/authentication/login_signup.dart';
import 'package:seek_forms/screens/homepage/bottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewSplashScreen extends StatefulWidget {
  const NewSplashScreen({super.key});

  @override
  State<NewSplashScreen> createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController
      _textController; // Controller for text slide animation
  late Animation<Offset> _lampAnimation;
  late Animation<double> _cloudAnimation;
  late Animation<Offset> _trustedSlideAnimation; // Animation for text slide
  late Animation<Offset> _effortlessSlideAnimation;
  Color _backgroundColor = Colors.black;
  bool _showWidget = false;
  bool _showAccuracy = false;
  bool _showSpeed = false;
  bool _showPeaceOfMind = false;
  bool _showSaveTime = false;
  final ProfileController profileController = Get.put(ProfileController());
  final ApplyPrivateJobController jobController = Get.put(ApplyPrivateJobController());
  final HomepageController homepageController = Get.put(HomepageController());
  final SubscriptionDataController subscriptionDataController = Get.put(SubscriptionDataController());


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(seconds: 2), // Duration for text slide
      vsync: this,
    );

    _lampAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset(0.025, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _cloudAnimation = Tween<double>(
      begin: -5.0,
      end: 1.0,
    ).animate(_controller);

    // Your Trusted Partner animation
    _trustedSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -10.0), // Start from below
      end: Offset(0.0, 0.0), // End at original position
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeInOut,
      ),
    );

    // Effortless Form Filling with payment security
    _effortlessSlideAnimation = Tween<Offset>(
      begin: const Offset(-15.0, 0.0), // Start from below
      end: Offset(0.0, 0.0), // End at original position
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeInOut,
      ),
    );

    // Text animation
    // Trigger sequential text visibility
    Future.delayed(Duration(seconds: 5), () {
      setState(() => _showAccuracy = true);
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() => _showSpeed = true);
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() => _showPeaceOfMind = true);
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() => _showSaveTime = true);
          });
        });
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _backgroundColor = Color(0xff5B8CB9);
        // Theme.of(context).primaryColor;
      });
    });

    // Delay the display and animation of the widget
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showWidget = true;
      });
      _textController.forward(); // Start text slide animation
    });

    // Start the initial animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          SlideTransition(
            position: _lampAnimation,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/splashsvg/lamp.svg'),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeTransition(
                    opacity: _cloudAnimation,
                    child: SvgPicture.asset('assets/splashsvg/cloudLeftUp.svg'),
                  ),
                  FadeTransition(
                    opacity: _cloudAnimation,
                    child:
                        SvgPicture.asset('assets/splashsvg/cloudRightUp.svg'),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeTransition(
                    opacity: _cloudAnimation,
                    child:
                        SvgPicture.asset('assets/splashsvg/cloudLeftDown.svg'),
                  ),
                  FadeTransition(
                    opacity: _cloudAnimation,
                    child:
                        SvgPicture.asset('assets/splashsvg/cloudRightDown.svg'),
                  ),
                ],
              ),
            ],
          ),
          // Text widget with slide animation
          if (_showWidget)
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    SlideTransition(
                      position: _trustedSlideAnimation,
                      child: Text(
                        'Your Trusted Partner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SlideTransition(
                      position: _effortlessSlideAnimation,
                      child: Text(
                        'Effortless Form Filling with payment security',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: _showAccuracy ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'Accuracy, ',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _showSpeed ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'Speed, ',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _showPeaceOfMind ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            'Peace of Mind',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedOpacity(
                      opacity: _showSaveTime ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        'and also Save your Time',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // Centre image widget
          if (_showWidget)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 55.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/splashsvg/manCentreImage.svg'),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        String? token = pref.getString('access_token');
                        if (token != null) {
                          profileController.getProfileDetails();
                          jobController.fetchSavedAndAppliedJob(context);
                          homepageController.getHomepageData();
                          subscriptionDataController.getSubscriptionDetails();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomBar(),
                              ));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginSignup(),
                              ));
                        }
                      },
                      child: Container(
                        height: 5.2.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          color: Color(0xffF19157),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white, width: 0.7.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            SvgPicture.asset('assets/splashsvg/line.svg'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/authentication/login_signup.dart';
import 'package:seek_forms/screens/counselling/counselling.dart';

import 'package:seek_forms/screens/government_jobs/government_category.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/widgets/page_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobsSection extends StatefulWidget {
  const JobsSection({super.key});

  @override
  State<JobsSection> createState() => _JobsSectionState();
}

class _JobsSectionState extends State<JobsSection>
    with TickerProviderStateMixin {
  late AnimationController _slideController1;
  late AnimationController _slideController2;
  late AnimationController _slideController3;

  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;

  List<Color> colorData = [
    const Color(0xff8C66F7),
    const Color(0xffE9668D),
    const Color(0xffA880F0),
  ];
  List<Color> backgroundColorData = [
    const Color.fromARGB(255, 156, 122, 251),
    const Color.fromARGB(255, 235, 133, 164),
    const Color.fromARGB(255, 177, 147, 232),
  ];

  List<String> imagePath = [
    "assets/images/adminLogo.png",
    "assets/images/ashok.png",
    "assets/images/counselling.png"
  ];
  List<Widget> pages = [
     PrivateJobHomepage(),
    GovernmentCategory(),
    const PageSlider(),
  ];
  List<String> jobTypes = [
    'Private Jobs',
    'Government Jobs',
    'Counselling',
  ];

  @override
  void initState() {
    super.initState();

    // First card slides from the left
    _slideController1 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _slideAnimation1 = Tween<Offset>(
      begin: const Offset(-2, 0), // Slide from the left
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController1,
      curve: Curves.easeInOut,
    ));

    // Second card slides from the right
    _slideController2 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(2, 0), // Slide from the right
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController2,
      curve: Curves.easeInOut,
    ));

    // Third card slides from the bottom
    _slideController3 = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _slideAnimation3 = Tween<Offset>(
      begin: const Offset(0, 2), // Slide from the bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController3,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _slideController1.forward();
    _slideController2.forward();
    _slideController3.forward();
  }

  @override
  void dispose() {
    _slideController1.dispose();
    _slideController2.dispose();
    _slideController3.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No')),
          TextButton(
              onPressed: () => SystemNavigator.pop(), child: const Text('Yes'))
        ],
      ),
    ));
  }
  void _logout() async {
    // Clear saved data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to the signup page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginSignup()), 
      (route) => false,
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              _logout();
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [PopupMenuItem(onTap:_showLogoutDialog, child: Text('Logout'))];
              },
            )
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pages[index],
                              ),
                            );
                          },
                          child: AnimatedBuilder(
                            animation: index == 0
                                ? _slideController1
                                : index == 1
                                    ? _slideController2
                                    : _slideController3,
                            builder: (context, child) {
                              Widget cardContent = Container(
                                height: 20.h,
                                padding: const EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  color: backgroundColorData[index],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(4, 4),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: colorData[index],
                                              spreadRadius: -4,
                                              blurRadius: 6,
                                              offset: const Offset(2, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                imagePath[index],
                                                height: 8.h,
                                                width: 10.w,
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                jobTypes[index],
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            color: Colors.white,
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 150,
                                            height: 1,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                      "New Jobs",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                      "475",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.sp,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 8.w),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                      "Applied Jobs",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "02",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.sp,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              // Apply slide transition with different directions
                              return SlideTransition(
                                position: index == 0
                                    ? _slideAnimation1
                                    : index == 1
                                        ? _slideAnimation2
                                        : _slideAnimation3,
                                child: cardContent,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

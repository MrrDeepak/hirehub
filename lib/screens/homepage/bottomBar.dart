import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/Ignou_controller.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/mock_test_category_api_controller.dart';

import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/screens/homepage/drawer.dart';
import 'package:seek_forms/screens/homepage/homepage.dart';
import 'package:seek_forms/screens/notification_screen.dart';
import 'package:seek_forms/screens/testing.dart';


import 'package:seek_forms/widgets/search_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of body widgets corresponding to each tab
  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage()
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _pages.length,
        vsync: this,
        initialIndex: 2,
        animationDuration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  ProfileController profileController = Get.put(ProfileController());
  ApplyPrivateJobController jobController =
      Get.put(ApplyPrivateJobController());
  IgnouController ignouController = Get.put(IgnouController());
  // FilterApiController filterApiController = Get.put(FilterApiController());
  // final MockTestCategoryApiController mockTestCategoryApiController = Get.put(MockTestCategoryApiController());
  
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {

        //     // mockTestCategoryApiController.getMockTestCategoryData();
        //     // filterApiController.getFilterData();
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => Testing(),));
        //   },
        //   child: Icon(Icons.add),
        // ),
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.white,
          // bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(6.h),
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          //       child: const SearchBarWidget(color: Colors.white),
          //     )),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ));
                    },
                    icon: Badge(
                      alignment: Alignment.topCenter,
                      isLabelVisible: true,
                      label: 
                      Icon(Icons.circle,color: Colors.red,size: 10,),
                      backgroundColor: Colors.transparent,

                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                    ))
               
                )
          ],
        ),
        drawer: const Drawer(
          backgroundColor: Color(0xff51D7E0),
          child: MyDrawer(),
        ),
        body: Obx(() {
          return profileController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: _pages, // Display the current page
                );
        }),

        // _pages[_selectedIndex], // Display the current page
        bottomNavigationBar: ConvexAppBar(style: TabStyle.react,
          //style: TabStyle.fixed,

          curve: Curves.linear,
          controller: _tabController,
          // height: 6.5.h,
          top: -25,
          color: Colors.black,
          curveSize: 70,
          backgroundColor: Colors.white,
          activeColor: Colors.transparent,
          items: [
            TabItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/apply.svg',
                  fit: BoxFit.contain,
                  color: Color(0xff18558E),
                ),
                icon: SvgPicture.asset(
                  'assets/svg/apply.svg',
                  fit: BoxFit.contain,
                  color: Color(0xff646464),
                ),
                title: 'Apply'),
            TabItem(
                activeIcon: SvgPicture.asset('assets/svg/explore2.svg',
                fit: BoxFit.contain,
                    color: Color(0xff18558E)),
                icon: SvgPicture.asset(
                  'assets/svg/explore2.svg',
                  color: Color(0xff646464),
                ),
                title: 'Explore'),
            TabItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: Color(0xff18558E)
                ),
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: Color(0xff646464),
                ),
                title: 'Home'),
            TabItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/cart.svg',
                  color: Color(0xff18558E)
                ),
                icon: SvgPicture.asset(
                  'assets/svg/cart.svg',
                  color: Color(0xff646464),
                ),
                title: 'Cart'),
            TabItem(
                activeIcon: SvgPicture.asset(
                  'assets/svg/save.svg',
                  color: Color(0xff18558E)
                ),
                icon: SvgPicture.asset(
                  'assets/svg/save.svg',
                  color: Color(0xff646464),
                ),
                title: 'Save'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/login_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/model/user_modal.dart';
import 'package:seek_forms/privacy_policy.dart';
import 'package:seek_forms/screens/about.dart';
import 'package:seek_forms/screens/application_tracking.dart';
import 'package:seek_forms/screens/applied_applications.dart';
import 'package:seek_forms/screens/authentication/change_password.dart';
import 'package:seek_forms/screens/authentication/login_signup.dart';
import 'package:seek_forms/screens/documents.dart';
import 'package:seek_forms/screens/help.dart';
import 'package:seek_forms/screens/homepage/saved_jobs.dart';
import 'package:seek_forms/screens/profile/user_profile.dart';
import 'package:seek_forms/screens/notification_screen.dart';
import 'package:seek_forms/screens/recommended_jobs.dart';
import 'package:seek_forms/screens/seekform_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final LoginUserController loginUserController =
      Get.put(LoginUserController());
  final ProfileController profileController = Get.put(ProfileController());
  final ApplyPrivateJobController jobController =
      Get.put(ApplyPrivateJobController());
  final HomepageController homepageController = Get.put(HomepageController());
  final List<Map<String, dynamic>> drawerrListsMap = [
    {
      'name': "Profile",
      'page': UserProfile(),
    },
    {
      'name': "Recommended Jobs",
      'page': RecommendedJobs(),
    },
    {
      'name': "Saved Jobs",
      'page': SavedJobs(),
    },
    {
      'name': "Notification",
      'page': NotificationScreen(),
    },
    {
      'name': "Documents",
      'page': Documents(),
    },
    {
      'name': "Applied Applications",
      'page': AppliedApplications(),
    },
    {
      'name': "Change Password",
      'page': ChangePassword(),
    },
    {
      'name': "Seekforms Services (PAID)",
      'page': SeekformServices(),
    },
    {
      'name': "Privacy Policy",
      'page': PrivacyPolicy(),
    },
    {
      'name': "Help",
      'page': Help(),
    },
    {
      'name': "About",
      'page': About(),
    },
    {
      'name': "Logout",
      // 'page': _showLogoutDialog,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final userData = profileController.userData;

    return Drawer(
      backgroundColor: Color(0xff51D7E0),
      child: 
      Column(
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(()=> profileController.isLoading.value? Center(child: CircularProgressIndicator(color: Colors.white,),):
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(userData.profileImage?? 'https://image.pngaaa.com/56/5311056-middle.png'),
                          fit: BoxFit.cover)),
                  // child: Image.asset('assets/images/admiLogo.png'),
                ),
                SizedBox(width: 2.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.name.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    Text(
                      userData.profession ?? 'Add profession',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      userData.address ?? 'Add address',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: drawerrListsMap.length,
                  itemBuilder: (context, index) {
                    final ontap = drawerrListsMap[index]["page"];
                    return InkWell(
                      onTap: () {
                        if (index == 11) {
                          _showLogoutDialog();
                        } 
                        else if(index == 0){
                          homepageController.getHomepageData();
                          // profileController.getProfileDetails();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));

                        }
                        else {
                          jobController.fetchSavedAndAppliedJob(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ontap));
                        }
                      },
                      child: ListTile(
                        title: Text(
                          drawerrListsMap[index]["name"],
                          style: TextStyle(
                              fontSize: 2.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        // leading: SvgPicture.asset(
                        //   drawerrListsMap[index]["path"],
                        //   height: 2.7.h,
                        // ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  void _logout() async {
    // Clear saved data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    String? token = prefs.getString('access_token');
    print(token);

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
}

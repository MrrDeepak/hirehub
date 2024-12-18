import 'dart:convert';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';
import 'package:seek_forms/model/user_modal.dart';
import 'package:seek_forms/screens/homepage/bottomBar.dart';

import 'package:seek_forms/screens/subscription_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/animation/page_animation.dart';

class LoginUserController extends GetxController {
  ProfileController profileController = Get.put(ProfileController());
  ApplyPrivateJobController jobController = Get.put(ApplyPrivateJobController());
  final HomepageController homepageController = Get.put(HomepageController());
  final SubscriptionDataController subscriptionDataController = Get.put(SubscriptionDataController());
  RxBool isLoading = false.obs;
  final String baseUrl = ApiConstant.baseUrl;
  final String endPoint = '/mobileApi/login';

  
  Future<void> loginUser(
      String mobile, String password, BuildContext context) async {
    try {
      isLoading.value = true;
      final response = await http.post(Uri.parse('$baseUrl$endPoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'mobile': mobile, 'password': password}));

      // Checking the response
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var accessToken = jsonResponse['result']['token'];
        print(accessToken);
        print('Profile: ${response.body}');
        
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('access_token', accessToken);
        profileController.getProfileDetails();
        jobController.fetchSavedAndAppliedJob(context);
        homepageController.getHomepageData();
        subscriptionDataController.getSubscriptionDetails();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful.'),
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.of(context).pushReplacement(
              PageAnimation().createAccountRoute(BottomBar() ));
        }
        // print('Data sent successfully: ${response.body}');
      } else if (response.statusCode == 401) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('You have entered incorrect password.'),
              duration: Duration(seconds: 3)));
        }
      } else if (response.statusCode == 404) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else if (response.statusCode == 500) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Internal server error.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else if (response.statusCode == 502) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gateway error.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
                child: Text(
                    'Failed to send data. Status Code: ${response.statusCode}')),
            duration: Duration(seconds: 3),
          ),
        );
        print('Failed to send data. Status Code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error occured $e');
    } finally {
      isLoading.value = false;
    }
  }
}


// import 'dart:convert';
// import 'package:seek_forms/constant/Api_constant.dart';

// import 'package:seek_forms/screens/subscription_plan.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:seek_forms/animation/page_animation.dart';


// class LoginUserController {
//   final String baseUrl = ApiConstant.baseUrl;
//   final String endPoint = '/mobileApi/login';

//   /// Function used to login existing user
//   Future<void> loginUser(
//       String mobile, String password, BuildContext context) async {
//     try {
//       final response = await http.post(Uri.parse('$baseUrl$endPoint'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'mobile': mobile, 'password': password}));

//       // Checking the response
//       if (response.statusCode == 200) {

//         var jsonResponse = jsonDecode(response.body);
//         var accessToken = jsonResponse['result']['token'];
//         print(accessToken);

//         SharedPreferences pref = await SharedPreferences.getInstance();
//         await pref.setString('access_token', accessToken);

//         if (context.mounted) {
//           Navigator.of(context).pushReplacement(
//               PageAnimation().createAccountRoute(const SubscriptionPlan()));
//         }
//         //print('Data sent successfully: ${response.body}');
//       } 
      
//       else if (response.statusCode == 401) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text('You have entered incorrect password.'),
//               duration: Duration(seconds: 3)));
//         }
//       } 
      
//       else if (response.statusCode == 404) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('User not found.'),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         }
//       } 
      
//       else if (response.statusCode == 500) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Internal server error.'),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         }
//       } 
      
//       else if (response.statusCode == 502) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Gateway error.'),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         }
//       } 
      
//       else {
//         // Error occurred
//         print('Failed to send data. Status Code: ${response.statusCode}');
//         print('Error: ${response.body}');
//       }
//     } catch (e) {
//       throw Exception('Error occured $e');
//     }
//   }
// }

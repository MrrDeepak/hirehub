import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';
import 'package:seek_forms/screens/authentication/otp_screen.dart';
import 'package:seek_forms/screens/subscription_plan.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CreateAccountController extends GetxController{
  final ProfileController profileController = Get.put(ProfileController());
  final ApplyPrivateJobController jobController = Get.put(ApplyPrivateJobController());
  final HomepageController homepageController = Get.put(HomepageController());
  final SubscriptionDataController subscriptionDataController = Get.put(SubscriptionDataController());
  RxBool isLoading = false.obs;
  final String baseUrl = ApiConstant.baseUrl;
  final String endPoint = '/mobileApi/register';

  /// Function used to register new user
  Future<void> createUserData(String name, String email, String mobile,
      String password, String confirmPassword, BuildContext context) async {
    try {
      isLoading.value = true;
      
      final response = await http.post(Uri.parse('$baseUrl$endPoint'), // post request to hit api
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': name,
            'email': email,
            'mobile': mobile,
            'password': password,
            'confirmPassword': confirmPassword
          }));

      // Checking the response
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var accessToken = jsonResponse["result"]["token"];
        print(accessToken);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('access_token', accessToken); 
        profileController.getProfileDetails();
        jobController.fetchSavedAndAppliedJob(context);
        homepageController.getHomepageData();
        subscriptionDataController.getSubscriptionDetails();
        
        // Perform navigation after ensuring that the widget is still mounted
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Registered Successfully.'),
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.of(context)
              .pushReplacement(PageAnimation().createAccountRoute( OtpScreen(ontap: SubscriptionPlan(), otp: '111111')));
        }
        print('Data sent successfully: ${response.body}');
      } else if (response.statusCode == 421) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User already exists.'),
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
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text('Error: ${response.body}'),
              duration: Duration(seconds: 3),
            ),
          );
        print('Failed to send data. Status Code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error occurred: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
      throw Exception('Error occurred $e');
    }
    finally{
      isLoading.value = false;
    }
  }
}
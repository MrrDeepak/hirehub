import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/constant/Api_constant.dart';

import 'package:seek_forms/screens/authentication/otp_screen.dart';
import 'package:seek_forms/screens/authentication/reset_password.dart';

class ForgetPasswordController extends GetxController{
  RxBool isLoading = false.obs;
  final String baseUrl = ApiConstant.baseUrl;
    final String endPoint = '/mobileApi/forget-password';
  Future<void> forgetPassword(String mobile, BuildContext context) async {
    
    try {
      isLoading.value=true;
      final response = await http.post(Uri.parse('$baseUrl$endPoint'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'mobile': mobile,
            
          }));
      
      /// Checking the response
      if (response.statusCode == 200) {
      
      /// Parse the response to extract the OTP and mobile number
      var jsonResponse = jsonDecode(response.body);
      String otpFromApi = jsonResponse['result']['savedOtp']['otp'];
      String mobileNumber = jsonResponse['result']['savedOtp']['mobile'];
      print(otpFromApi);

      /// If api hit successfully then navigate to next page
        if (context.mounted) {
          Navigator.of(context)
              .push(PageAnimation().createAccountRoute( OtpScreen(otp: otpFromApi,ontap: ResetPassword(mobileNumber: mobileNumber),)));
        }
        if (context.mounted) {}
        print('Data sent successfully: ${response.body}');
      } 
      
      /// User not found
       else if (response.statusCode == 404) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } 
      
      /// Internal server error
      else if (response.statusCode == 500) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Internal server error.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } 
      
      /// Gateway error
      else if (response.statusCode == 502) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gateway error.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } 
      
      /// Unsuccessful api hit
      else {
        // Error occurred
        print('Failed to send data. Status Code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error occured $e');
    }
    finally{
      isLoading.value = false;
    }
  }
}
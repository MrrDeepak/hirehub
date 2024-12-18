import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/animation/page_animation.dart';
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/screens/authentication/login.dart';


class ResetPasswordService extends GetxController{
  RxBool isLoading=false.obs;
  final String baseUrl = ApiConstant.baseUrl;
    final String endPoint = '/mobileApi/reset-password/';
    
  /// Function used to login existing user
  Future<void> resetUserPassword(String mobileNumber , String newPassword, String confirmPassword, BuildContext context) async {
    final String userMobileNumber = mobileNumber;
    try {
      isLoading.value = true;
      final response =
          await http.put(Uri.parse('$baseUrl$endPoint$userMobileNumber'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'newPassword': newPassword,
                'confirmPassword': confirmPassword
              }));
      // Checking the response
      if (response.statusCode == 200) {
        if (context.mounted) {
          Navigator.of(context)
              .pushReplacement(PageAnimation().createAccountRoute(const LoginScreen()));
        }
        if (context.mounted) {}
        print('Data sent successfully: ${response.body}');
      } else if (response.statusCode == 401) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You have entered incorrect password.'),
              duration: Duration(seconds: 3),
            ),
          );
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
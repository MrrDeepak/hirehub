import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/user_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isUpdateLoading = false.obs;
  final String baseUrl = ApiConstant.baseUrl;
  final String endPoint = ApiConstant.authEndPoints.getProfile;
  User userData = User();

  Future<void> getProfileDetails() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.get(Uri.parse('$baseUrl$endPoint'),
          headers: {'Authorization': '$token'});

      // Checking the response
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Get Profile Data ${jsonResponse}');
        var data = jsonResponse['result']['userProfile'];
        userData = User.fromJson(data);
      } else if (response.statusCode == 403) {
        print('Token error');
      } else {
        ScaffoldMessenger(
            child: SnackBar(
                content:
                    Text('Error: Failed to load data ${response.statusCode}')));
        print('Error: Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occured $e');
    } finally {
      isLoading.value = false;
    }
  }

  // function to update profile
  Future<void> updateProfile(User userDetails) async {
    try {
      isUpdateLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.put(
        Uri.parse('$baseUrl$endPoint'),
        headers: {'Authorization': '$token'},
        body: {
          "name": userDetails.name,
          "email": userDetails.email,
          "mobile": userDetails.mobile,
          "education": userDetails.education,
          "address": userDetails.address,
          "profession": userDetails.profession,
        },
      );

      // Checking the response
      if (response.statusCode == 200) {
        print('Data sent Successfully');
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        
      } else if (response.statusCode == 403) {
        print('Token error');
      } else {
        ScaffoldMessenger(
            child: SnackBar(
                content:
                    Text('Error: Failed to load data ${response.statusCode}')));
        print('Error: Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occured $e');
    } finally {
      isUpdateLoading.value = false;
    }
  }
}

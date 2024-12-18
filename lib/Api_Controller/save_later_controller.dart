import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLaterController extends GetxController {
  RxBool isLoading = false.obs;
  // function to save later
  Future<void> saveLater(String jobId) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.post(
        Uri.parse(ApiConstant.baseUrl+ApiConstant.authEndPoints.saveLater),
        headers: {'Authorization': '$token'},
        body: {
          "jobpostId": jobId,
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
      isLoading.value = false;
    }
  }


  Future<void> removeSaveLater(String jobId) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.delete(
        Uri.parse(ApiConstant.baseUrl+ApiConstant.authEndPoints.removeSaveLater),
        headers: {'Authorization': '$token'},
        body: {
          "jobpostId": jobId,
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
      isLoading.value = false;
    }
  }

}
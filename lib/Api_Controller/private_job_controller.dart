import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/private_jobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPrivateJobs {
  /// Function used to login existing user
  final String baseUrl = ApiConstant.baseUrl;
  final String endPoint = ApiConstant.authEndPoints.fetchPrivateJobs;

  Future<PrivateJobsData> getPrivateJobs(String jobTitle, String state,
      String location, String salary, String qualification) async {
    try {
      final String searchWithJobTitle = '?jobTitle=${jobTitle}';

      final String searchWithState = '&state=${state}';
      final String searchWithLocation = '&location=${location}';
      final String searchWithSalary = '&salary=${salary}';
      final String searchWithQualification = '&qualification=${qualification}';

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.get(
          Uri.parse(
              '$baseUrl$endPoint$searchWithJobTitle$searchWithState$searchWithLocation$searchWithSalary$searchWithQualification'),
          headers: {'Authorization': '$token'});
      // print('Url $baseUrl$endPoint$searchWithJobTitle$searchWithState$searchWithLocation$searchWithSalary$searchWithQualification');
      var data = jsonDecode(response.body);
      print(response.body);

      // Checking the response
      if (response.statusCode == 200) {
        print('getting data');
        return PrivateJobsData.fromJson(data);
      } else {
        // Error occurred
        return throw Exception(
            'Failed to send data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occured $e');
    }
  }
}

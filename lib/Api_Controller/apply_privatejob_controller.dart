import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/applied_jobs_modal.dart';
import 'package:seek_forms/screens/job_applied.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyPrivateJobController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<AppliedJobsModal> appliedJobsData = <AppliedJobsModal>[].obs;
  RxList<AppliedJobsModal> savedJobsData = <AppliedJobsModal>[].obs;


  Future<void> applyJob(String jobId, BuildContext context) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.post(
          Uri.parse(
            ApiConstant.baseUrl + ApiConstant.authEndPoints.applyJob,
          ),
          headers: {
            'Authorization': '$token'
          },
          body: {
            "jobpostId": jobId,
          });
      if (response.statusCode == 200) {
        print('Data send successfully: ${response.body}');
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Already applied. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Failed to send data. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> applySaveLaterJob(String jobId, BuildContext context) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.put(
          Uri.parse(
            ApiConstant.baseUrl + ApiConstant.authEndPoints.applySaveLaterJob,
          ),
          headers: {
            'Authorization': '$token'
          },
          body: {
            "jobpostId": jobId,
          });
      if (response.statusCode == 200) {
        print('Data send successfully: ${response.body}');
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Already applied. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Failed to send data. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSavedAndAppliedJob(BuildContext context) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.fetchAppliedJobs,
        ),
        headers: {'Authorization': '$token'},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['applicant'] as List;
        appliedJobsData.clear();
        savedJobsData.clear();
        // for(var i in data){
        //   appliedJobsData.add(AppliedJobsModal.fromJson(i));
        // }
      
      // Logic to filter data
        appliedJobsData.addAll(
        data
            .where((item) => item['status'] == 'applied')
            .map((item) => AppliedJobsModal.fromJson(item))
            .toList(),
      );
       savedJobsData.addAll(
        data
            .where((item) => item['status'] == 'draft')
            .map((item) => AppliedJobsModal.fromJson(item))
            .toList(),
      );
        
        
        print("Applied jobs data: $appliedJobsData");


        print('Data send successfully: ${response.body}');
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Already applied. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Failed to send data. Status Code: ${response.statusCode}'),
              duration: Duration(seconds: 3),
            ),
          );
        }
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
    } finally {
      isLoading.value = false;
    }
  }
}

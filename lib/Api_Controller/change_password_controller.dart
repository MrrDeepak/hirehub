import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController{
  RxBool isLoading = false.obs;
  
  Future<void> changePassword(
      String oldPassword, String newPassword, String confirmPassword, BuildContext context) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.put(
          Uri.parse(
            ApiConstant.baseUrl + ApiConstant.authEndPoints.changePassword,
          ),
          headers: {
            'Authorization': '$token'
          },
          body: {
            "currentPassword": oldPassword,
            "newPassword": newPassword,
            "confirmPassword": confirmPassword
          });
          if(response.statusCode == 200){
            print('Data send successfully: ${response.body}');
            if(context.mounted){
              ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password Changed Successfully.'),
              duration: Duration(seconds: 3),
            ),
          );
              Navigator.pop(context);
            }

          }else if (response.statusCode == 401) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Old password is incorrect.'),
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
    }finally{
      isLoading.value=false;
    }
  }
}

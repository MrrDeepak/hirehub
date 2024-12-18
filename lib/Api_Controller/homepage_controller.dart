import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/homepage_modal.dart';
import 'package:seek_forms/model/ignou_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends GetxController {
  RxBool isLoading = false.obs;
  RxList <HomepageModal> homepageData = <HomepageModal>[].obs;
  Future<void> getHomepageData() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.getHomepageData,
        ),headers: {'Authorization':'$token'}
      );
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['data'] as List;
        homepageData.clear();
        for(var i in data){
          homepageData.add(HomepageModal.fromJson(i));
        }
        print('Data fetched: ${data}');
      }else{
        print('Error ${response.statusCode}');
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}

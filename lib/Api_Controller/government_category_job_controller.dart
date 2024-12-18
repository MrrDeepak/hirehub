import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/government_category_job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetGovernmentCategoryController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<GovernmentCategoryModel> governmentCategoryModel = <GovernmentCategoryModel>[].obs;
  
  Future<void> getGovernmentCategory() async {
    final String baseUrl = ApiConstant.baseUrl;
    final String endPoint = ApiConstant.authEndPoints.fetchGovernmentCategory;
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
        var data = jsonResponse['result']['data'] as List;
        governmentCategoryModel.clear();
        for(var i in data){
          governmentCategoryModel.add(GovernmentCategoryModel.fromJson(i));
        }
      print(response.body);
        // return GovernmentJobData.fromJson(data);
      } else {
        print('Failed to send data. Status Code: ${response.statusCode}');
        
      }
    } catch (e) {
      throw Exception('Error occured $e');
    }finally{
      isLoading.value=false;

    }
  }
}
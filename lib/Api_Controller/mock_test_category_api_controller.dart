import 'dart:convert';
import 'package:get/get.dart';
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/mock_category_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MockTestCategoryApiController extends GetxController{
   RxBool isLoading = false.obs;
  RxList <MockTestCategoryModal> mockTestCategory = <MockTestCategoryModal>[].obs;
  Future<void> getMockTestCategoryData() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.mockTestCategory,
        ),headers: {'Authorization':'$token'}
      );
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['data'] as List;
        mockTestCategory.clear();
        for(var i in data){
          mockTestCategory.add(MockTestCategoryModal.fromJson(i));
        }
        print('Data fetched: ${data}');
      }else{
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error $e');
    } finally {
      isLoading.value = false;
    }
  }

}
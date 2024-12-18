import 'dart:convert';
import 'package:get/get.dart';
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/mock_category_modal.dart';
import 'package:seek_forms/model/mock_question_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MockQuestionApiController extends GetxController{
   RxBool isLoading = false.obs;
  RxList <MockQuestionModal> mockQuestions = <MockQuestionModal>[].obs;
  Future<void> getMockQuestionData(String mockCategory) async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      String mockParam = '?testType=$mockCategory';
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.mockQuestions+mockParam,
        ),headers: {'Authorization':'$token'}
      );
      print(ApiConstant.baseUrl + ApiConstant.authEndPoints.mockQuestions+mockCategory);
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['entry'] as List;
        mockQuestions.clear();
        for(var i in data){
          mockQuestions.add(MockQuestionModal.fromJson(i));
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
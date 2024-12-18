import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/counselling_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounsellingController extends GetxController {
  RxBool isLoading = false.obs;
  RxList <CounsellingModal> counsellingData = <CounsellingModal>[].obs;
  Future<void> getCounsellingData() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.getCounsellingData,
        ),headers: {'Authorization':'$token'}
      );
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['counsellors'] as List;
        counsellingData.clear();
        for(var i in data){
          counsellingData.add(CounsellingModal.fromJson(i));
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

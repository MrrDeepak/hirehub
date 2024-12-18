import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/filter_modal.dart';
import 'package:seek_forms/model/ignou_data_model.dart';
import 'package:seek_forms/model/subscription_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterApiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList <String> salary = <String>[].obs;
  RxList <String> qualification = <String>[].obs;
  RxList <String> state = <String>[].obs;
  RxList <String> location = <String>[].obs;
  RxList <Map<String,dynamic>> filterData = <Map<String,dynamic>>[].obs;
  Future<void> getFilterData() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.filterData,
        ),headers: {'Authorization':'$token'}
      );
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        // var stateList = jsonResponse['result']['data']['state'] as List;
        var salaryList = jsonResponse['result']['data']['salary'] as List;
        var qualificationList = jsonResponse['result']['data']['qualification'] as List;
        var filterDataList = jsonResponse['result']['data']['indianStates'] as List;
        
        // var locationList = jsonResponse['result']['data']['location'] as List;
        // state.clear();
        salary.clear();
        qualification.clear();
        filterData.clear();
        // location.clear();
        // for(var i in stateList){
        //   state.add(i);
        // }
        for(var i in salaryList){
          salary.add(i);
        }
        for(var i in qualificationList){
          qualification.add(i);
        }
        for(var i in filterDataList){
          filterData.add(i);
        }
        // for(var i in locationList){
        //   location.add(i);
        // }
        print('data: $filterData');

        // print('Data fetched: ${jsonResponse}');

      }else{
        print('Error ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

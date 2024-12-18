import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/ignou_data_model.dart';
import 'package:seek_forms/model/subscription_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionDataController extends GetxController {
  RxBool isLoading = false.obs;
  RxList <SubscriptionModal> subscriptionData = <SubscriptionModal>[].obs;
  Future<void> getSubscriptionDetails() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);
      final response = await http.get(
        Uri.parse(
          ApiConstant.baseUrl + ApiConstant.authEndPoints.getSubscriptionDetails,
        ),headers: {'Authorization':'$token'}
      );
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result'] as List;
        subscriptionData.clear();
        for(var i in data){
          subscriptionData.add(SubscriptionModal.fromJson(i));
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

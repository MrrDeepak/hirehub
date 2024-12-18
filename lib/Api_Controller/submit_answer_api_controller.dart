import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seek_forms/constant/Api_constant.dart';
import 'package:seek_forms/model/mock_test_result_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitAnswerApiController extends GetxController{
  RxBool isLoading = false.obs;
  Result previewData = Result();
  RxList<UnattemptedQuestions> unattemptData = <UnattemptedQuestions>[].obs;
  RxList<Correct> correctAnswerData = <Correct>[].obs;
  RxList<IncorrectFinal> incorrectData = <IncorrectFinal>[].obs;
  RxList<Answers> allAnswersData = <Answers>[].obs;
  Future<void> submitAnswer(String testId, List<Map<String,dynamic>> quesAndAnswer)async{
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('access_token');
      print(token);

      final response = await http.post(Uri.parse(ApiConstant.baseUrl+ApiConstant.authEndPoints.submitAnswer),
      headers: {'Authorization': '$token'},
      body: 
      {
        "testId":testId.toString(),
        "answers":
        // quesAndAnswer.toString()
        jsonEncode(quesAndAnswer)
      }
      );
      print(jsonEncode(quesAndAnswer));
      if(response.statusCode ==200){
        var jsonResponse = jsonDecode(response.body);
        var preview = jsonResponse['result']['finalResult'];
        previewData = Result.fromJson(preview);
        var unattempt = jsonResponse['result']['finalResult']['unattemptedQuestions'] as List;
        var correctAnswer = jsonResponse['result']['finalResult']['correct'] as List;
        var incorrect = jsonResponse['result']['finalResult']['incorrectFinal'] as List;
        var allAnswers = jsonResponse['result']['finalResult']['answers'] as List;
        unattemptData.clear();
        correctAnswerData.clear();
        incorrectData.clear();
        allAnswersData.clear();

        for(var i in unattempt){
          unattemptData.add(UnattemptedQuestions.fromJson(i));
        }
        print(unattemptData);
        for(var i in correctAnswer){
          correctAnswerData.add(Correct.fromJson(i));
        }
        for(var i in incorrect){
          incorrectData.add(IncorrectFinal.fromJson(i));
        }
        for(var i in allAnswers){
          allAnswersData.add(Answers.fromJson(i));
        }
        print('Data sent Successfully');
      }else{
        print('Error ${response.statusCode}');
      }
      
    } catch (e) {
      print('Error $e');
      
    }finally{
      isLoading.value=false;
    }

  }

}
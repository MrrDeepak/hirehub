import 'dart:async';
import 'package:get/get.dart';
import 'package:seek_forms/Api_Controller/mock_question_api_controller.dart';
import 'package:seek_forms/Api_Controller/submit_answer_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_page.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_submit_page.dart';

class TimerController extends GetxController {
  final SubmitAnswerApiController submitAnswerApiController = Get.put(SubmitAnswerApiController());
  final AnswerController answerController = Get.put(AnswerController());
  RxString testId=''.obs;
  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  Timer? _timer;

  // Dynamically set the initial time for the timer
  void startTimer(int totalSeconds) {
    // If a timer is already running, cancel it first
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
    }

    // Convert total seconds to hours, minutes, and seconds
    int hoursRemaining = totalSeconds ~/ 3600;
    int minutesRemaining = (totalSeconds % 3600) ~/ 60;
    int secondsRemaining = totalSeconds % 60;

    // Reset time
    hours.value = hoursRemaining;
    minutes.value = minutesRemaining;
    seconds.value = secondsRemaining;

    // Start the countdown timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        if (minutes.value > 0) {
          minutes.value--;
          seconds.value = 59;
        } else {
          if (hours.value > 0) {
            hours.value--;
            minutes.value = 59;
            seconds.value = 59;
          } else {
            // Stop timer when countdown reaches 0
            
            // submitAnswerApiController.submitAnswer(testId.value, answerController.questionList);
            // Get.off(MockTestSubmitPage());
            _timer?.cancel();
          }
        }
      }
    });
  }

  // Stop the timer and reset
  void stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
    }

    // Reset the time to 0
    hours.value = 0;
    minutes.value = 0;
    seconds.value = 0;
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}

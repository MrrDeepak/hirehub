import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MockTestPageController extends GetxController {

  RxInt currentIndex = 0.obs;  // Track the current page index
  PageController pageController = PageController();  // PageController to control the PageView

  // Function to move to the next page
  void nextPage(int questionCount) {
    if (currentIndex.value < questionCount+1) {  // Limit the range based on the number of questions
      currentIndex.value++;
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  // Function to move to the previous page
  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void onClose() {
    pageController.dispose();  // Dispose the PageController when done
    super.onClose();
  }
}

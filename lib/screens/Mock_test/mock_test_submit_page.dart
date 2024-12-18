import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/submit_answer_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/Submit_pages/answers.dart';
import 'package:seek_forms/screens/Mock_test/Submit_pages/correct.dart';
import 'package:seek_forms/screens/Mock_test/Submit_pages/incorrect.dart';
import 'package:seek_forms/screens/Mock_test/Submit_pages/preview.dart';
import 'package:seek_forms/screens/Mock_test/Submit_pages/unattempt.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_list.dart';
import 'package:seek_forms/screens/homepage/bottomBar.dart';
import 'package:seek_forms/util.dart';

class MockTestSubmitController extends GetxController {
  // Track the current page index
  RxInt currentIndex = 1.obs;

  // Track the selection state for each card (5 cards in this case)
  RxList<bool> isSelected = List.generate(5, (index) => false).obs;

  // Track the PageController to update the PageView on card tap
  late PageController pageController;

  // Initialize PageController
  @override
  void onInit() {
    super.onInit();
    isSelected[0]= true;
    pageController = PageController();
  }
  @override
  void onClose() {
    currentIndex.value = 1; 
    pageController.dispose();  
    super.onClose();  
  }

  // Method to select a card and update the current index
  void selectCard(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index); // Move the page to the selected index
    // Reset selection for all cards and select the tapped card
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
  }
}

class MockTestSubmitPage extends StatelessWidget {
  MockTestSubmitPage({super.key});
  List<String> result = [
    'Preview',
    'Unattempt',
    'Correct',
    'Incorrect',
    'Answers',
  ];
  final MockTestSubmitController controller = Get.put(MockTestSubmitController());
  final SubmitAnswerApiController submitAnswerApiController = Get.put(SubmitAnswerApiController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.offAll(BottomBar());
        return false;
        
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  flex: 9,
                  child: Align(
                      alignment: Alignment.center,
                      child: customBoldText('Result', Colors.white))),
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.download,
                    color: Colors.white,
                  ))
            ],
          ),
          actions: [
            PopupMenuButton<int>(
              padding: EdgeInsets.zero,
              menuPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey)),
              constraints: BoxConstraints.tightFor(width: 54.w),
              iconColor: Color(0xffF5F5F5),
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  // enabled: false,
                  padding: EdgeInsets.zero,
                  value: 1,
                  // row has two child icon and text.
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 0.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Review"),
                        Icon(
                          Icons.paste,
                          color: Color(0xffF19157),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuDivider(),
      
                // popupmenu item 2
                PopupMenuItem(
                  height: 4.h,
                  padding: EdgeInsets.zero,
                  value: 2,
                  // row has two child icon and text
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Share"),
                        Icon(
                          Icons.share,
                          color: Color(0xffF19157),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  padding: EdgeInsets.zero,
      
                  value: 3,
                  // row has two child icon and text
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Submit"),
                        Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0xffF19157),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              offset: Offset(0, 40),
              color: Colors.white,
              elevation: 2,
            ),
          ],
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Obx(()=> submitAnswerApiController.isLoading.value? Center(child: CircularProgressIndicator(color: Colors.white,),):
        Column(
          children: [
            SizedBox(
              height: 5.h,
              width: double.infinity,
              child: 
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: result.length,
                
                itemBuilder: (context, index) {
                  // bool isSelected = (controller.currentIndex.value == index);
                  return GestureDetector(
                    onTap: () {
                      controller.selectCard(index);
                      // controller.currentIndex.value = index;
                    },
                    child: Obx(()=>
                    Card(
                      color: controller.isSelected[index]? Color(0xffF19157):Color(0xffF5F5F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Center(
                              child: Text(
                            result[index],
                            style: TextStyle(
                              color: controller.isSelected[index]?Colors.white:Colors.black
                            ),
                          )),
                        )),),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    controller.selectCard(value);
                  },
                  controller: controller.pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Preview();
                      case 1:
                        return Unattempt();
                      case 2:
                        return Correct();
                      case 3:
                        return Incorrect();
                      case 4:
                        return Answers();
                      default:
                        return Center(child: Text('Unknown Page'));
                    }
                    // return Preview();
                  },
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}

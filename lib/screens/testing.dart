import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //     child: Story(
          //         numberOfarc: 11, centerImageUrl: 'assets/svg/Ignou_home.svg')),
        ],
      ),
    );
  }
}

// class MockTestSubmitPage extends StatelessWidget {
//   MockTestSubmitPage({super.key});
//   final MockTestSubmitController controller = Get.put(MockTestSubmitController()); // Controller instance

//   List<String> result = [
//     'Preview',
//     'Unattempt',
//     'Correct',
//     'Incorrect',
//     'Answers',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 5.h,
//             width: double.infinity,
//             child: Obx(() {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: result.length,
//                 itemBuilder: (context, index) {
//                   // Change the card color based on whether it's selected
//                   bool isSelected = controller.currentIndex.value == index;
//                   return GestureDetector(
//                     onTap: () {
//                       // Update currentIndex on card tap
//                       controller.currentIndex.value = index;
//                     },
//                     child: Card(
//                       color: isSelected ? Colors.blue : Colors.white,  // Change color when selected
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 7.w),
//                         child: Center(
//                           child: Text(
//                             result[index],
//                             style: TextStyle(
//                               color: isSelected ? Colors.white : Colors.black, // Text color change
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(2.h),
//               child: PageView.builder(
//                 itemCount: 5,  // You have 5 pages based on your result list
//                 controller: PageController(
//                   initialPage: controller.currentIndex.value, // Set the initial page to the selected index
//                 ),
//                 onPageChanged: (index) {
//                   // Update the selected index when the page is swiped
//                   controller.currentIndex.value = index;
//                 },
//                 itemBuilder: (context, index) {
//                   // Switch case to return different pages based on the index
//                   switch (index) {
//                     case 0:
//                       return Preview();
//                     case 1:
//                       return Unattempt();
//                     case 2:
//                       return Correct();
//                     case 3:
//                       return Incorrect();
//                     case 4:
//                       return Answers();
//                     default:
//                       return Center(child: Text('Unknown Page'));
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
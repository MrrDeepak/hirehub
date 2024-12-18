import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:seek_forms/Api_Controller/Ignou_controller.dart';
import 'package:seek_forms/model/ignou_data_model.dart';
import 'package:seek_forms/screens/Entrance_exams/examination_category.dart';
import 'package:seek_forms/screens/Ignou/ignou_programs.dart';
import 'package:seek_forms/widgets/search_bar.dart';

class IgnouHomepage extends StatefulWidget {
  const IgnouHomepage({super.key});

  @override
  State<IgnouHomepage> createState() => _IgnouHomepageState();
}

class _IgnouHomepageState extends State<IgnouHomepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with duration and vsync
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // The duration for zoom in and out
      vsync: this,
    ); // Repeat the animation in reverse (zoom in, zoom out)

    // Create the scaling animation that goes from 1.0 (original size) to 1.2 (zoomed in)
    _animation = Tween<double>(begin: 8, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  final int numberOfContainers = 11;
  final double horizontalRadius = 150.0; // Radius for horizontal (x) direction
  final double verticalRadius = 220.0;

  final List<String> ignouDetails = [
    'Programs',
    'Re-Apply',
    'Re-Valuation',
    'Know your Sheet',
    'Result',
    'Examination',
    'Assignment',
    'Latest Update',
    'Date Sheet',
    'Admission Form',
    'Solved Assignment',
  ];
  List<Widget> _pages = [

  ];
  final IgnouController ignouController = Get.put(IgnouController());

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xff5963F4),
    appBar: AppBar(
      leading: BackButton(
        color: Colors.white,
      ),
      backgroundColor: Color(0xff5963F4),
    ),
    body: Obx(
      () => ignouController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 230,
                    width: 200,
                    child: Center(
                      child: SvgPicture.asset('assets/svg/Ignou_home.svg'),
                    ),
                  ),
                ),
                // Call the method to position containers in a circle
                _containersInCircularForm(
                  numberOfContainers,
                  150,  // horizontal radius
                  180,  // vertical radius
                ),
              ],
            ),
    ),
  );
}

AnimatedBuilder _containersInCircularForm(
    int numberOfContainers, double horizontalRadius, double verticalRadius) {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Transform.scale(
        scale: _animation.value,
        child: child,
      );
    },
    child: LayoutBuilder(
      builder: (context, constraints) {
        // Get the center of the screen dynamically
        double centerX = constraints.maxWidth / 2;
        double centerY = constraints.maxHeight / 2;

        return Stack(
          children: List.generate(numberOfContainers, (index) {
            // Calculate position based on circular path
            double angle = (index * 2 * pi) / numberOfContainers;
            double x = horizontalRadius * cos(angle);
            double y = verticalRadius * sin(angle);

            return Positioned(
              // Adjust the position relative to the center of the screen
              left: centerX + x - 35, // Adjust for item size (width/2)
              top: centerY + y - 35,  // Adjust for item size (height/2)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IgnouPrograms()),
                      );
                    },
                    child: Container(
                      width: 70, // Final size of the container
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Image.asset('assets/images/exam.png'),
                      ),
                    ),
                  ),
                  Text(
                    ignouDetails[index],
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            );
          }),
        );
      },
    ),
  );
}
    }
//   Widget build(BuildContext context) {
//     // Radius for vertical (y) direction
//     return Scaffold(
//       backgroundColor: Color(0xff5963F4),
//       appBar: AppBar(
//         leading: BackButton(
//           color: Colors.white,
//         ),
//         backgroundColor: Color(0xff5963F4),
//       ),
//       body: Obx(
//         () => ignouController.isLoading.value
//             ? Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               )
//             : Stack(
//                 children: [
//                   Align(
//                       alignment: Alignment.center,
//                       child: Container(
//                           height: 230,
//                           width: 200,
//                           // color: Colors.amber,
//                           child: Center(
//                             child:
//                                 SvgPicture.asset('assets/svg/Ignou_home.svg'),
//                           ))),

//                   _containersInCircularForm(
//                     numberOfContainers,
//                     horizontalRadius,
//                     verticalRadius,
//                   ),
//                   // SearchBarWidget(color: Colors.white),
//                 ],
//               ),
//       ),
//     );
//   }

//   AnimatedBuilder _containersInCircularForm(
//       int numberOfContainers, double horizontalRadius, double verticalRadius) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _animation.value,
//           child: child,
//         );
//       },
//       child: Stack(
//         children: List.generate(numberOfContainers, (index) {
//           // Calculate position based on circular path
//           double angle = (index * 2 * pi) / numberOfContainers;
//           double x = horizontalRadius * cos(angle);
//           double y = verticalRadius * sin(angle);
          

//           return Positioned(
//             left: 160 + x, // Positioning on the X-axis
//             top: 350 + y, // Positioning on the Y-axis
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,MaterialPageRoute(builder: (context) => IgnouPrograms(),));
//                   },
//                   child: Container(
//                     width: 70, // Final size of the container
//                     height: 70,
//                     decoration: BoxDecoration(
//                       // color: Colors.blue,
//                       borderRadius: BorderRadius.circular(50),
//                     ),
//                     child: Center(child: Image.asset('assets/images/exam.png')),
//                   ),
//                 ),
//                 Text(
//                   // '$index',
//                   ignouDetails[index],
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

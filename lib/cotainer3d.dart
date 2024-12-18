// import 'package:flutter/material.dart';

// class ThreeDContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('3D Container Example'),
//       ),
//       body: Center(
//         child: Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               // Bottom-right shadow (creates the depth)
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.5),
//                 offset: const Offset(10, 10),
//                 blurRadius: 15,
//               ),
//               // Top-left shadow (light reflection)
//               const BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-5, -5),
//                 blurRadius: 15,
//               ),
//             ],
//             // gradient: const LinearGradient(
//             //   begin: Alignment.topLeft,
//             //   end: Alignment.bottomRight,
//             //   colors: [
//             //     Color(0xFF6BAED9), // Light shade
//             //     Color(0xFF1B6BB5), // Darker shade
//             //   ],
//             // ),
//           ),
//           child:  Center(
//             child: Container(
//                height: 130,
//           width: 130,
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               // Bottom-right shadow (creates the depth)
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 offset: const Offset(10, 10),
//                 blurRadius: 30,
//               ),
//               // Top-left shadow (light reflection)
//               const BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-5, -5),
//                 blurRadius: 30,
//               ),
//             ],
//             // gradient: const LinearGradient(
//             //   begin: Alignment.topLeft,
//             //   end: Alignment.bottomRight,
//             //   colors: [
//             //     Color(0xFF6BAED9), // Light shade
//             //     Color(0xFF1B6BB5), // Darker shade
//             //   ],
//             // ),
//           ),
//             )
//             // Text(
//             //   '3D Box',
//             //   style: TextStyle(
//             //     color: Colors.white,
//             //     fontWeight: FontWeight.bold,
//             //     fontSize: 18,
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ThreeDContainer(),
//   ));
// }
import 'package:flutter/material.dart';
import 'dart:math';

class Engou extends StatefulWidget {
  const Engou({super.key});

  @override
  State<Engou> createState() => _EngouState();
}

class _EngouState extends State<Engou> with SingleTickerProviderStateMixin {
late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    // Initialize the AnimationController with duration and vsync
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // The duration for zoom in and out
      vsync: this,
    ); // Repeat the animation in reverse (zoom in, zoom out)
    
    // Create the scaling animation that goes from 1.0 (original size) to 1.2 (zoomed in)
    _animation = Tween<double>(begin: 9, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final int numberOfContainers = 11;
  final double horizontalRadius = 150.0; // Radius for horizontal (x) direction
  final double verticalRadius = 220.0; // Radius for vertical (y) direction
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
      appBar: AppBar(
        title: const Text('Circular Container without Animation'),
        backgroundColor: Color(0xff5963F4),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Stack(
            children: List.generate(numberOfContainers, (index) {
              // Calculate position based on circular path
              double angle = (index * 2 * pi) / numberOfContainers;
              double x = horizontalRadius * cos(angle);
              double y = verticalRadius * sin(angle);
          
              return Positioned(
                left: 160 + x,  // Positioning on the X-axis
                top: 300 + y,   // Positioning on the Y-axis
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,  // Final size of the container
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Text('Admission form')
                  ],
                ),
              );
            }),
            
          ),
        ),
      ),
    );
  }
}

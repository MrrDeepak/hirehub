import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/private_job_controller.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';

class JObApplied extends StatefulWidget {
  const JObApplied({super.key});

  @override
  _JObAppliedState createState() => _JObAppliedState();
}

class _JObAppliedState extends State<JObApplied>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with duration and vsync
    _controller = AnimationController(
      duration:
          const Duration(milliseconds: 900), // The duration for zoom in and out
      vsync: this,
    )..repeat(
        reverse: true); // Repeat the animation in reverse (zoom in, zoom out)

    // Create the scaling animation that goes from 1.0 (original size) to 1.2 (zoomed in)
    _animation = Tween<double>(begin: 1.2, end: 0.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  final ApplyPrivateJobController jobController = Get.put(ApplyPrivateJobController());
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        jobController.fetchSavedAndAppliedJob(context);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton(onPressed: () {
            jobController.fetchSavedAndAppliedJob(context);
            Navigator.pop(context);
            
          },),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Obx(
                () => jobController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Animated zoom-in and zoom-out effect on the applied image
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _animation
                                        .value, // Apply the scale to the image
                                    child: child,
                                  );
                                },
                                child: SvgPicture.asset('assets/svg/applied.svg'),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            'Applied Successfully',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1.h),
                          Text('Your application is successfully sent to HR'),
                          SizedBox(height: 3.h),
                          Text(
                            'Web Developer',
                            style: TextStyle(
                                color: Color(0xffF19157), fontSize: 17.sp),
                          ),
                          SizedBox(height: 5.h),
                          Container(
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Wait for HR to contact you',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
              )),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class JObApplied extends StatelessWidget {
//   const JObApplied({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 3.h),
//           child: Column(
//             children: [
//               SizedBox(height: 5.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Applied image
//                   SvgPicture.asset('assets/svg/applied.svg'),
//                 ],
//               ),
//               SizedBox(height: 1.h),
//               Text('Applied Successfully',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
//               SizedBox(height: 1.h),
//               Text('Your application is successfully sent to HR'),
//               SizedBox(height: 3.h),
//               Text('Web Developer',style: TextStyle(color: Color(0xffF19157),fontSize: 17.sp,),),
//               SizedBox(height: 5.h),
//               Container(
//                 height: 15.h,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                   child: Text('Wait for HR to contact you',style: TextStyle(fontWeight:FontWeight.bold ),),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/screens/job_type_selection/job_field.dart';
import 'package:seek_forms/screens/job_type_selection/job_roles.dart';
import 'package:seek_forms/screens/job_type_selection/job_type.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({super.key});

  @override
  State<PageSlider> createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  final PageController controller = PageController();
  
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  List<Widget> pages = [
    JobField(),
    JobType(),
    JobRoles(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff74DFE6),
      body: Column(
        children: [
          SizedBox(
            height: 98.h,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: _onPageChanged,
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xffF19157),
                dotColor: Color(0xffF19157),
                dotHeight: 0.5.h,
              ),
            )
        ],
      ),
    );
  }
}

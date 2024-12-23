import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/Ignou_controller.dart';
import 'package:seek_forms/Api_Controller/counselling_controller.dart';
import 'package:seek_forms/Api_Controller/entrance_exam_controller.dart';
import 'package:seek_forms/Api_Controller/filter_api_controller.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/subscription_controller.dart';
import 'package:seek_forms/screens/Ignou/ignou_homepage.dart';
import 'package:seek_forms/screens/Entrance_exams/entrance_exam.dart';
import 'package:seek_forms/screens/counselling/counselling.dart';
import 'package:seek_forms/screens/getQueries.dart';
import 'package:seek_forms/screens/government_jobs/government_category.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/util.dart';
import 'package:seek_forms/widgets/breaking_news_widget.dart';
import 'package:seek_forms/widgets/filter/expanded_filter_button.dart';
import 'package:seek_forms/widgets/government_job_widget/government_card.dart';
import 'package:seek_forms/widgets/page_slider.dart';

class GridController extends GetxController {
  RxBool scroll = false.obs;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final IgnouController ignouController = Get.put(IgnouController());
  final EntranceExamController entranceExamController =
      Get.put(EntranceExamController());
  final CounsellingController counsellingController =
      Get.put(CounsellingController());
  final FilterApiController filterApiController =
      Get.put(FilterApiController());
  final PrivateJobSearchController privateJobController =
      Get.put(PrivateJobSearchController());
  final FilterButtonController filterButtonController= Get.put(FilterButtonController());
  final GovernmentJobSearchController governmentJobController = Get.put(GovernmentJobSearchController());

  void _handleApiCall(int index) {
    switch (index) {
      case 1:
        filterApiController.getFilterData();
        privateJobController.state.value = '';
        privateJobController.location.value = '';
        privateJobController.salary.value = '';
        privateJobController.qualification.value = '';
        privateJobController.showFilterButton.value=false;
        filterButtonController.selectedFilters.clear();
        break;
      case 2:
        ignouController.getIgnouDetails(); // API call for index 2
        break;
      case 3:
        counsellingController.getCounsellingData();
        break;
      case 4:
        entranceExamController.getEntranceExamDetails();
        break;
      default:
        print("No API defined for index $index");
        break;
    }
  }

  List<Widget> pages = [
    const GovernmentCategory(),
    PrivateJobHomepage(),
    const IgnouHomepage(),
    Counselling(),
    EntranceExam(),
    GetQueries()
  ];
  List<Color> colorData = [
    const Color(0xffE4E9DE),
    const Color(0xffE4E9DE),
    const Color(0xffBCE7F0),
    const Color(0xffFBE285),
    const Color(0xffF0F4FF),
    const Color(0xffFBF0FF),
  ];
  List pngdata = [
    'assets/images/gov.png',
    'assets/images/pvt.png',
    'assets/images/ignou.png',
    'assets/images/couns.png',
    'assets/images/entrance.png',
    'assets/images/query.png'
  ];

  List UPSC = [
    'New',
    'SSC',
    'UPSC',
    'SSC',
    'Police',
    'SSC',
    'Railway'
        'JK SSB'
  ];
  GovernmentCardController cardController = Get.put(GovernmentCardController());
  final HomepageController homepageController = Get.put(HomepageController());
  GridController gridController = Get.put(GridController());
  final GovernmentCardController controller =
      Get.put(GovernmentCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              BreakingNewsContainer(),
              Container(
                height: 11.5.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffE3B396), Color(0xffF19157)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: UPSC.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 3.5.w,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.7.h,
                            ),
                            Container(
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(1.5.h),
                                child: SvgPicture.asset('assets/svg/books.svg'),
                              ),
                            ),
                            Text(
                              UPSC[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              //SizedBox(height: 0.5.h,),
              SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/offer.png',
                    fit: BoxFit.cover,
                  )),

              /// Grid View Builder
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
                  child: Obx(
                    () => homepageController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent:
                                  gridController.scroll.value ? 25.h : 15.8.h,
                                  // 16.8.h,
                              crossAxisSpacing: 3.w,
                              mainAxisSpacing: 1.h
                              // gridController.scroll.value ? 10.h : 1.h,
                            ),
                            itemCount: homepageController.homepageData.length,
                            itemBuilder: (context, index) {
                              final homeData =
                                  homepageController.homepageData[index];
                              if (index == 0) {
                                return GovernmentCard(
                                  homeData: homeData,
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    _handleApiCall(index);
                                    // ignouController.getIgnouDetails();
                                    

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => pages[index],
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        margin: EdgeInsets.all(0),
                                        elevation: 0,
                                        color: colorData[index],
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 6.0,
                                                  top: 8),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    pngdata[index],
                                                  ),
                                                  // SvgPicture.asset(
                                                  //   svgData[index],
                                                  //   color: Colors.black,
                                                  //   height: 38,
                                                  //   width: 38,
                                                  // ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  SizedBox(
                                                    width: 22.w,
                                                    child: Text(
                                                      // 'Government Jobs Jobs Jobs',
                                                      homeData.name ?? '',
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // SizedBox(height: 3,),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'New Jobs',
                                                      style: TextStyle(
                                                        // fontSize: 15.5.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      homeData.newJobs
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Applied Jobs',
                                                      style: TextStyle(
                                                        // fontSize: 15.5.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      homeData.applied
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            )
                                          ],
                                        ),
                                      ),

                                      // Using AnimatedContainer for expansion with dynamic height calculation
                                      Obx(() {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              height:
                                                  controller.isExpanded.value
                                                      ? 10.h
                                                      : 0,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Container()),
                                        );
                                      }),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                  )),
              SizedBox(
                height: 6.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

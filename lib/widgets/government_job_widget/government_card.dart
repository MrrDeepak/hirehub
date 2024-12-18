import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/filter_api_controller.dart';
import 'package:seek_forms/Api_Controller/government_category_job_controller.dart';
import 'package:seek_forms/model/homepage_modal.dart';
import 'package:seek_forms/screens/government_jobs/government_category.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/screens/homepage/homepage.dart';
import 'package:seek_forms/util.dart';
import 'package:seek_forms/widgets/filter/expanded_filter_button.dart';

class GovernmentCardController extends GetxController {
  var isExpanded = false.obs;
}

class GovernmentCard extends StatelessWidget {
  final HomepageModal homeData;
  GovernmentCard({required this.homeData, super.key});
  // We use GetX to get the controller instance
  final GovernmentCardController controller =
      Get.put(GovernmentCardController());
  final GridController gridController = Get.put(GridController());
  final GovernmentCardController cardController =
      Get.put(GovernmentCardController());
  final GetGovernmentCategoryController governmentCategoryController =
      Get.put(GetGovernmentCategoryController());
  final FilterButtonController filterButtonController= Get.put(FilterButtonController());
  final FilterApiController filterApiController =
      Get.put(FilterApiController());
   final GovernmentJobSearchController governmentJobController = Get.put(GovernmentJobSearchController());
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() {
            return GestureDetector(
              onTap: () {
                gridController.scroll.value = !gridController.scroll.value;
                cardController.isExpanded.value =
                    !cardController.isExpanded.value;
              },
              child: Card(
                margin: EdgeInsets.all(0),
                elevation: 0,
                color: const Color(0xffEB7296),
                shape: RoundedRectangleBorder(
                  // color: const Color(0xffEB7296),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: controller.isExpanded.value
                        ? Radius.circular(0)
                        : Radius.circular(12),
                    bottomRight: controller.isExpanded.value
                        ? Radius.circular(0)
                        : Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 6.0, top: 8),
                      child: Row(
                        children: [
                          Image.asset('assets/images/gov.png'),
                          // SvgPicture.asset(
                          //   'assets/svg/peopleGroup.svg',
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(height: 3,),
                    const Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'New Jobs',
                              style: TextStyle(
                                // fontSize: 15.5.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              homeData.newJobs.toString(),
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              homeData.applied.toString(),
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
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
            );
          }),

          // Using AnimatedContainer for expansion with dynamic height calculation
          Obx(() {
            return Padding(
              padding: EdgeInsets.only(top: 0.1.h),
              child: AnimatedContainer(
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
                height: controller.isExpanded.value ? 10.h : 0,
                decoration: BoxDecoration(
                  color: Color(0xffF19157),
                  borderRadius: BorderRadius.only(
                    bottomLeft: controller.isExpanded.value
                        ? Radius.circular(12)
                        : Radius.circular(0),
                    bottomRight: controller.isExpanded.value
                        ? Radius.circular(12)
                        : Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText('Offline', Colors.white),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    InkWell(
                        onTap: () {
                          print('Item is clicked');
                          filterApiController.getFilterData();
                          governmentJobController.state.value = '';
                          governmentJobController.location.value = '';
                          governmentJobController.salary.value = '';
                          governmentJobController.qualification.value = '';
                          governmentJobController.showFilterButton.value = false;
                          filterButtonController.selectedFilters.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GovernmentCategory(),
                              ));
                          governmentCategoryController.getGovernmentCategory();
                          controller.isExpanded.value = false;
                          gridController.scroll.value = false;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText('Online', Colors.white),
                          ],
                        ))
                  ],
                ),
              ),
            );
          }
          ),
        ],
      ),
    );
  }
}

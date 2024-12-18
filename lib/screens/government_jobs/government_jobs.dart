import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/government_job_controller.dart';
import 'package:seek_forms/Api_Controller/save_later_controller.dart';
import 'package:seek_forms/model/government_job_model.dart';
import 'package:seek_forms/screens/private_job/job_details.dart';
import 'package:seek_forms/widgets/filter/expanded_filter_button.dart';
import 'package:get/get.dart';
import 'package:seek_forms/widgets/wide_button.dart'; // Import GetX

class GovernmentJobSearchController extends GetxController {
  // Reactive search query
  var searchQuery = ''.obs;
  var state = ''.obs;
  var location = ''.obs;
  var qualification = ''.obs;
  var salary = ''.obs;

  RxBool showFilterButton = false.obs;
  RxBool isJobApplied = false.obs;

  RxBool change = false.obs;
  // Reactive boolean list
  RxList<RxBool> rxBooleanList = <RxBool>[].obs;
  // Method to dynamically generate rxBooleanList
  void updateCount(int itemCount) {
    rxBooleanList.value = List.generate(itemCount, (_) => false.obs);
  }

  // Method to update the search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void filterData(String updateState, String updateLocation,
      String updateQualification, String updateSalary) {
    state.value = updateState;
    location.value = updateLocation;
    qualification.value = updateQualification;
    salary.value = updateSalary;
  }
}

class GovernmentJobs extends StatefulWidget {
  String category;
  GovernmentJobs({required this.category, super.key});

  @override
  State<GovernmentJobs> createState() => _GovernmentJobsState();
}

class _GovernmentJobsState extends State<GovernmentJobs> {
  // Instantiate the GovernmentJobSearchController
  final GovernmentJobSearchController governmentJobController =
      Get.put(GovernmentJobSearchController());

  final SaveLaterController saveLaterController =
      Get.put(SaveLaterController());

  final FilterButtonController filterButtonController =
      Get.put(FilterButtonController());
  late Future<void> _jobsData;
  @override
  void initState() {
    _jobsData = GetGovernmentJobs().getGovernmentJobs(widget.category, '','','','','');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Define the UI as before
    List<Color> jobCardColor = [
      const Color(0xffF19157),
      const Color(0xffE7F3FF),
      const Color(0xffEEEAFF),
      const Color(0xffFFF1DE),
    ];
    List<Color> jobCardTextColor = [
      Colors.white,
      const Color(0xff557FFD),
      const Color(0xff557FFD),
      const Color(0xffFD5555),
    ];
    List<String> jobCardName = ['Finance', 'Defence', 'SSC', 'Railway'];
    List<String> jobCardIcon = [
      'assets/svg/finance.svg',
      'assets/svg/defenceBlue.svg',
      'assets/svg/SSC.svg',
      'assets/svg/railRed.svg'
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 5.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SearchBar(
                                onChanged: (query) {
                                  governmentJobController
                                      .updateSearchQuery(query);
                                },
                                controller: TextEditingController(
                                    text: governmentJobController
                                        .searchQuery.value),
                                elevation: WidgetStatePropertyAll(0),
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.white),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                leading: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: 'Search',
                                hintStyle: WidgetStatePropertyAll(
                                    TextStyle(color: Colors.grey)),
                              )),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Obx(() => governmentJobController.showFilterButton.value
                        ? SizedBox(
                            height: 5.h,
                            child: ListView.builder(
                              itemCount:
                                  filterButtonController.selectedFilters.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    filterButtonController.selectedFilters
                                        .removeAt(index);
                                    if (filterButtonController
                                            .selectedFilters.length ==
                                        0) {
                                      governmentJobController
                                          .showFilterButton.value = false;

                                      governmentJobController.state.value = '';
                                      governmentJobController.location.value = '';
                                      governmentJobController.salary.value = '';
                                      governmentJobController.qualification.value =
                                          '';
                                    }
                                  },
                                  child: Card(
                                      color: Color(0xffF19157),
                                      child: Center(
                                        child: Badge(
                                          isLabelVisible: true,
                                          backgroundColor: Colors.white,
                                          label: Icon(
                                            Icons.close,
                                            color: Color(0xffF19157),
                                            size: 1.h,
                                          ),
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 1.h),
                                            child: Text(
                                              filterButtonController
                                                  .selectedFilters[index],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            height: 9.h,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 1.h),
                                  child: Container(
                                    width: 9.8.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: jobCardColor[index],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(jobCardIcon[index]),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          jobCardName[index],
                                          style: TextStyle(
                                              color: jobCardTextColor[index]),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      // Accessing the search query from the controller
                      String searchQuery =
                          governmentJobController.searchQuery.value;
                      print("Category Name: ${widget.category}");
                      // Parameters to search with
                      String state = governmentJobController.state.value;
                      String location = governmentJobController.location.value;
                      String salary =
                          // '12,000-18,000';
                          governmentJobController.salary.value;
                      String qualification =
                          governmentJobController.qualification.value;

                      return FutureBuilder(
                        future: GetGovernmentJobs()
                            .getGovernmentJobs(widget.category, searchQuery,state,location,salary,qualification),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: 70.h,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Failed to load jobs'),
                            );
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.result!.data!.isEmpty) {
                              return Expanded(
                                  child: Center(
                                child: Text(
                                  'No Jobs Found',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ));
                            } else {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      snapshot.data!.result!.data!.length,
                                  itemBuilder: (context, index) {
                                    final jobData =
                                        snapshot.data!.result!.data![index];
                                    final int dataCount =
                                        snapshot.data!.result!.data!.length;
                                    governmentJobController
                                        .updateCount(dataCount);

                                    return Card(
                                      color: Color(0xffE7F3FF),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 2.5.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Top Row: Logo, Title, Share, Notification icons
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          backgroundImage:
                                                              NetworkImage(jobData
                                                                      .companyLogo ??
                                                                  'https://cdn-images.himalayas.app/grvfhn8czypmnm6mdsjurzaz38ri')),
                                                      // SizedBox(width: 2.w),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              jobData.jobTitle!
                                                                      .capitalizeFirst ??
                                                                  '',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17.sp,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            Text(
                                                              ("${jobData.companyName!.capitalizeFirst ?? ''}"),
                                                              softWrap: true,
                                                              maxLines: null,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Spacer(),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.share,
                                                      color: Color(0xffF19157),
                                                    ),
                                                  ],
                                                ),
                                                //SizedBox(width: 2.w),
                                              ],
                                            ),
                                            SizedBox(height: 1.h),

                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Salary',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff929292),
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        jobData.salary ?? '',
                                                        maxLines: null,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Education',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff929292),
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        jobData.qualification!
                                                                .capitalizeFirst ??
                                                            '',
                                                        maxLines: null,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Location',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff929292),
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        jobData.locality
                                                                ?.capitalizeFirst ??
                                                            '',
                                                        maxLines: null,
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 3.h),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                              child: CustomWideButton(
                                                onTap: () async{
                                                 bool? shouldRefresh =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Jobdetails(
                                                        jobData: jobData,
                                                      ),
                                                    ),
                                                  );
                                                  if (shouldRefresh == true) {
                                                    setState(() {
                                                      _jobsData =
                                                          GetGovernmentJobs()
                                                              .getGovernmentJobs(
                                                                  widget.category,
                                                                  '',
                                                                  '',
                                                                  '',
                                                                  '','');
                                                      // Refresh the future data when coming back
                                                    });
                                                  }
                                                },
                                                label: "Apply Now",
                                                buttonBackgroundColor:
                                                    const Color(0xffF19157),
                                                borderRadius: 10,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            Obx(
                                              () => SizedBox(
                                                height: 5.h,
                                                child: CustomWideButton(
                                                  onTap: () {
                                                    // saveLaterController.saveLater(jobData.sId??'');
                                                    governmentJobController
                                                            .rxBooleanList[index]
                                                            .value =
                                                        !governmentJobController
                                                            .rxBooleanList[
                                                                index]
                                                            .value;
                                                    if (jobData.isSaved
                                                            .toString() ==
                                                        'false') {
                                                      print('Save later');
                                                      saveLaterController
                                                          .saveLater(
                                                              jobData.sId ??
                                                                  '');
                                                    } else if (jobData.isSaved
                                                            .toString() ==
                                                        'true') {
                                                      print(
                                                          'Remove Save later');
                                                      saveLaterController
                                                          .removeSaveLater(
                                                              jobData.sId ??
                                                                  '');
                                                    }
                                                  },
                                                  label: () {
                                                    if (governmentJobController
                                                            .rxBooleanList[
                                                                index]
                                                            .value ||
                                                        jobData.isSaved
                                                                .toString() ==
                                                            'true') {
                                                      return "Saved";
                                                    } else {
                                                      return "Save for later";
                                                    }
                                                  }(),
                                                  labelColor: Colors.black,
                                                  buttonBackgroundColor:
                                                      Colors.white,
                                                  borderRadius: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          } else {
                            return const Center(
                              child: Text('No data found'),
                            );
                          }
                        },
                      );
                    }),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ExpandedFilterButton(),
                ),
              ],
            )),
      ),
    );
  }
}

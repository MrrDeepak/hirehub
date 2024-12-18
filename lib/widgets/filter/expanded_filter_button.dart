import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/filter_api_controller.dart';
import 'package:seek_forms/Api_Controller/private_job_controller.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/widgets/constant.dart';

class FilterButtonController extends GetxController {
  RxBool stateExpanded = false.obs;
  RxBool salaryExpanded = false.obs;
  RxBool locationExpanded = false.obs;
  RxBool qualificationExpanded = false.obs;

  RxBool showState = false.obs;
  RxBool showSalary = false.obs;
  RxBool showLocation = false.obs;
  RxBool showQualification = false.obs;
  // Reactive variables using GetX
  RxString stateName = ''.obs;
  RxString salary = ''.obs;
  RxString location = ''.obs;
  RxString qualification = ''.obs;

  // List to store selected filters
  RxList<String> selectedFilters = <String>[].obs;

  // Method to toggle state expanded
  void toggleStateExpanded() {
    stateExpanded.value = !stateExpanded.value;
  }

  // Method to toggle salary expanded
  void toggleSalaryExpanded() {
    salaryExpanded.value = !salaryExpanded.value;
  }

  void togglelocationExpanded() {
    locationExpanded.value = !locationExpanded.value;
  }

  void toggleQualificationExpanded() {
    qualificationExpanded.value = !qualificationExpanded.value;
  }

  // Method to update selected state
  void updateState(String selectedState) {
    stateName.value = selectedState;
    stateExpanded.value = false;
    // Add the state to the list if not already present, otherwise remove it
    if (selectedFilters.contains(selectedState)) {
      selectedFilters.remove(selectedState); // Remove if already in the list
    } else {
      selectedFilters.add(selectedState); // Add if not in the list
    }
  }

  // Method to update selected salary
  void updateSalary(String selectedSalary) {
    salary.value = selectedSalary;
    salaryExpanded.value = false;

    // Add the salary to the list if not already present, otherwise remove it
    if (selectedFilters.contains(selectedSalary)) {
      selectedFilters.remove(selectedSalary); // Remove if already in the list
    } else {
      selectedFilters.add(selectedSalary); // Add if not in the list
    }
  }

  void updateLocation(String selectedLocation) {
    location.value = selectedLocation;
    locationExpanded.value = false;

    // Add the location to the list if not already present, otherwise remove it
    if (selectedFilters.contains(selectedLocation)) {
      selectedFilters.remove(selectedLocation); // Remove if already in the list
    } else {
      selectedFilters.add(selectedLocation); // Add if not in the list
    }
  }

  void updateQualification(String selectedQualification) {
    qualification.value = selectedQualification;
    qualificationExpanded.value = false;

    // Add the qualification to the list if not already present, otherwise remove it
    if (selectedFilters.contains(selectedQualification)) {
      selectedFilters
          .remove(selectedQualification); // Remove if already in the list
    } else {
      selectedFilters.add(selectedQualification); // Add if not in the list
    }
  }
}

class ExpandedFilterButton extends StatefulWidget {
  ExpandedFilterButton({super.key});

  @override
  State<ExpandedFilterButton> createState() => _ExpandedFilterButtonState();
}

class _ExpandedFilterButtonState extends State<ExpandedFilterButton> {
  final FilterButtonController filterController =
      Get.put(FilterButtonController());
  final PrivateJobSearchController privateJobController =
      Get.put(PrivateJobSearchController());
  final FilterApiController filterApiController =
      Get.put(FilterApiController());
  final GovernmentJobSearchController governmentJobController =
      Get.put(GovernmentJobSearchController());
  // String _stateName = 'State';
  // String _salary = 'Salary';
  double _height = 5.h;
  double _width = 12.w;
  bool _filterButtonExpanded = false;

  List<String> defaultCity = [
    "Bengaluru",
    "Hyderabad",
    "Chennai",
    "Pune",
    "Gurugram (Gurgaon)",
    "Noida",
    "Kolkata",
    "Mumbai",
    "Chandigarh",
    "Ahmedabad",
    "Kochi",
    "Thiruvananthapuram",
    "Indore",
    "Bhopal",
    "Jaipur",
    "Nagpur",
    "Visakhapatnam",
    "Coimbatore"
  ];

  List<dynamic> city = [];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _filterButtonExpanded = true;
          _height = 30.h;
          _width = 56.w;
          // _filterColor =
          //     Colors.white ;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 210),
          curve: Curves.ease,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: _filterColor,
          ),
          child:
              _filterButtonExpanded ? expandedFilterButton() : filterButton()),
    );
  }

  Container filterButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: _filterColor,
        color: const Color(0xffF19157),
      ),
      child: const Icon(
        Icons.tune,
        color: Colors.white,
      ),
    );
  }

  Container expandedFilterButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: _filterColor,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(0xffF19157),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add filter',
                  style: TextStyle(color: Colors.white),
                ),
                //SizedBox(width: 4.h,),
                Icon(
                  Icons.tune,
                  color: Colors.white,
                )
              ],
            ),
          ),

          /// Middle container
          // State or Salary Expanded Container
          Obx(
            () {
              if (filterController.stateExpanded.value) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: filterApiController.filterData.length,
                    // filterApiController.filterData.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          filterApiController.filterData[index];
                      print('data ${index}');
                      // city= data['location'];
                      // print('City in: $city');
                      // final stateName = filterApiController.state;
                      return InkWell(
                        onTap: () {
                          filterController.updateState(data['state']);
                          city = data['location'];
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(child: Text(data['state'])),
                        ),
                      );
                    },
                  ),
                );
              } else if (filterController.salaryExpanded.value) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: filterApiController.salary.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          filterController
                              .updateSalary(filterApiController.salary[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(
                              child: Text(filterApiController.salary[index])),
                        ),
                      );
                    },
                  ),
                );
              } else if (filterController.locationExpanded.value) {
                if (city.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: city.length,
                      // filterApiController.location.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            filterController.updateLocation(city[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: Center(child: Text(city[index])),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                      child:
                      ListView.builder(
                      itemCount: defaultCity.length,
                      // filterApiController.location.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            filterController.updateLocation(defaultCity[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: Center(child: Text(defaultCity[index])),
                          ),
                        );
                      },
                    ),
                      
                      );
                }
              } else if (filterController.qualificationExpanded.value) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: filterApiController.qualification.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          filterController.updateQualification(
                              filterApiController.qualification[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(
                              child: Text(
                                  filterApiController.qualification[index])),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return SizedBox(
                  height: 20.h,
                  child: Column(
                    children: [
                      Obx(
                        () => filterController.showState.value
                            ? SizedBox(
                                height: 5.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.transparent,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          filterController
                                              .toggleStateExpanded();
                                          filterController.showState.value =
                                              true;
                                        },
                                        child: Center(
                                          child: Text(
                                              // 'State'
                                              filterController.stateName.value),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              filterController.showState.value =
                                                  false;
                                              filterController.stateName.value =
                                                  '';
                                              filterController.selectedFilters
                                                  .removeLast();
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Color(0xffF19157),
                                              size: 1.8.h,
                                            )))
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  filterController.toggleStateExpanded();
                                  filterController.showState.value = true;
                                },
                                child: SizedBox(
                                  height: 5.h,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('State'
                                        // filterController.stateName.value
                                        ),
                                  ),
                                ),
                              ),
                      ),
                      Obx(
                        () => filterController.showLocation.value
                            ? SizedBox(
                                height: 5.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.transparent,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          filterController
                                              .togglelocationExpanded();
                                          filterController.showLocation.value =
                                              true;
                                        },
                                        child: Center(
                                          child: Text(
                                              // 'State'
                                              filterController.location.value),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              filterController
                                                  .showLocation.value = false;
                                              filterController.location.value =
                                                  '';
                                              filterController.selectedFilters
                                                  .removeLast();
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Color(0xffF19157),
                                              size: 1.8.h,
                                            )))
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  filterController.togglelocationExpanded();
                                  filterController.showLocation.value = true;
                                },
                                child: SizedBox(
                                  height: 5.h,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('City'
                                        // filterController.stateName.value
                                        ),
                                  ),
                                ),
                              ),
                      ),
                      Obx(
                        () => filterController.showSalary.value
                            ? SizedBox(
                                height: 5.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.transparent,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          filterController
                                              .toggleSalaryExpanded();
                                          filterController.showSalary.value =
                                              true;
                                        },
                                        child: Center(
                                          child: Text(
                                              // 'State'
                                              filterController.salary.value),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              filterController
                                                  .showSalary.value = false;
                                              filterController.salary.value =
                                                  '';
                                              filterController.selectedFilters
                                                  .removeLast();
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Color(0xffF19157),
                                              size: 1.8.h,
                                            )))
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  filterController.toggleSalaryExpanded();
                                  filterController.showSalary.value = true;
                                },
                                child: SizedBox(
                                  height: 5.h,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('Salary'
                                        // filterController.stateName.value
                                        ),
                                  ),
                                ),
                              ),
                      ),
                      Obx(
                        () => filterController.showQualification.value
                            ? SizedBox(
                                height: 5.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.transparent,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: () {
                                          filterController
                                              .toggleQualificationExpanded();
                                          filterController
                                              .showQualification.value = true;
                                        },
                                        child: Center(
                                          child: Text(
                                              // 'State'
                                              filterController
                                                  .qualification.value),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            onTap: () {
                                              filterController.showQualification
                                                  .value = false;
                                              filterController
                                                  .qualification.value = '';
                                              filterController.selectedFilters
                                                  .removeLast();
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: Color(0xffF19157),
                                              size: 1.8.h,
                                            )))
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  filterController
                                      .toggleQualificationExpanded();
                                  filterController.showQualification.value =
                                      true;
                                },
                                child: SizedBox(
                                  height: 5.h,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('Qualification'
                                        // filterController.stateName.value
                                        ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          InkWell(
            onTap: () {
              privateJobController.filterData(
                filterController.stateName.value,
                filterController.location.value,
                filterController.qualification.value,
                filterController.salary.value,
              );
              governmentJobController.filterData(
                filterController.stateName.value,
                filterController.location.value,
                filterController.qualification.value,
                filterController.salary.value,
              );

              if (filterController.selectedFilters.length > 0) {
                privateJobController.showFilterButton.value = true;
                governmentJobController.showFilterButton.value = true;
              }
              // GetPrivateJobs().getPrivateJobs('flu');
              filterController.showState.value = false;
              filterController.showLocation.value = false;
              filterController.showSalary.value = false;
              filterController.showQualification.value = false;

              filterController.stateExpanded.value = false;
              filterController.salaryExpanded.value = false;
              filterController.locationExpanded.value = false;
              filterController.qualificationExpanded.value = false;
              // filterController.location.value='';
              filterController.stateName.value = '';
              filterController.location.value = '';
              filterController.salary.value = '';
              filterController.qualification.value = '';
              // filterController.selectedFilters.clear();

              setState(() {
                _filterButtonExpanded = false;
                _height = 5.h;
                _width = 12.w;
              });
            },
            child: Container(
              height: 5.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color(0xffF19157),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

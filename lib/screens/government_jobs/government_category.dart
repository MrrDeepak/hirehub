import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/government_category_job_controller.dart';
import 'package:seek_forms/Api_Controller/mock_test_category_api_controller.dart';
import 'package:seek_forms/screens/Mock_test/mock_test_homepage.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/widgets/app_bar.dart';


class GovernmentCategory extends StatefulWidget {
  const GovernmentCategory({super.key});

  @override
  State<GovernmentCategory> createState() => _GovernmentCategoryState();
}

class _GovernmentCategoryState extends State<GovernmentCategory> {

  int selectedCategoryIndex = 0;
  List topOnlineForms = [
    'Category',
    'Upcoming Jobs',
    'Mock Test',
    'Favourite',
    'View Expired Jobs'
  ];

  List svgData = [
    'assets/svg/latest.svg',
    'assets/svg/defence.svg',
    'assets/svg/10th.svg',
    'assets/svg/police.svg',
    'assets/svg/police.svg',
    'assets/svg/police.svg',
    'assets/svg/banking.svg',
    'assets/svg/medical.svg',
    'assets/svg/gate.svg',
    'assets/svg/contractual.svg',
    'assets/svg/pcs.svg',
    'assets/svg/jk.svg',
    'assets/svg/walkin.svg',
    'assets/svg/railway.svg',
    'assets/svg/other.svg',
  ];
  List <Widget> _pages =[
    

  ];
  final GetGovernmentCategoryController getGovernmentCategory =
      Get.put(GetGovernmentCategoryController());
  final MockTestCategoryApiController mockTestCategoryApiController = Get.put(MockTestCategoryApiController());
  
  String formatText(String input) {
    return input.replaceAll('#', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF19157),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar - Ensure it exists
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.0),
              child: CustomAppBar(
                onTap: () {
                  _showSearchDialog();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Container(
                width: double.infinity,
                height: 4.5.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Top Online forms',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff74DFE6),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xffF19157), Color(0xff74DFE6)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.5, 0])),
                        child: ListView.builder(
                          itemCount: topOnlineForms.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 1.w,left: 1.w),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                  });
                                  if(index == 2){
                                    mockTestCategoryApiController.getMockTestCategoryData();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MockTestHomepage(),));
                                  }
                                },
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(8)),
                                  color: selectedCategoryIndex == index
                                      ? const Color(0xff102D5C)
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    child: Center(
                                      child: Text(
                                        topOnlineForms[index],
                                        style: selectedCategoryIndex == index
                                            ? const TextStyle(
                                                color: Colors.white,
                                              )
                                            : const TextStyle(
                                                color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Column(
                          children: [
                            Container(
                              // height: 50.h,
                              child: Obx(
                                () => getGovernmentCategory.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : LayoutBuilder(
                                        builder: (context, constraints) {
                                          return GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    // mainAxisExtent: 12.h,
                                                    crossAxisCount: 3,
                                                    childAspectRatio:
                                                        constraints.maxWidth <
                                                                600
                                                            ? 1
                                                            : 0.8),
                                            itemCount: getGovernmentCategory
                                                .governmentCategoryModel.length,
                                            itemBuilder: (context, index) {
                                              final jobData = getGovernmentCategory
                                                      .governmentCategoryModel[
                                                  index];

                                              String processedString =
                                                  formatText(
                                                      jobData.color ?? '');

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            GovernmentJobs(
                                                          category: jobData
                                                                  .categoryName ??
                                                              '',
                                                        ),
                                                      ));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                      color: Color(int.parse(
                                                          '0xff$processedString')),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      // boxShadow: [
                                                      //   // Bottom-right shadow (creates the depth)
                                                      //   BoxShadow(
                                                      //     color: Colors.black
                                                      //         .withOpacity(0.5),
                                                      //     offset: const Offset(1, 1),
                                                      //     blurRadius: 5,
                                                      //   ),
                                                      // ],
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.5.h),
                                                          child: FittedBox(
                                                            child: Text(
                                                              // 'Diploma or ITI jobs'
                                                              jobData
                                                                  .categoryName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        SvgPicture.asset(
                                                          svgData[index],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            GestureDetector(
                              onTap: () {
                                // Get.to(Engou());
                              },
                              child: const AdmitCard(
                                label: 'Admit card',
                                iconpath: 'assets/svg/admitCard.svg',
                                color: Color(0xff008000),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                            const AdmitCard(
                              label: 'Result',
                              iconpath: 'assets/svg/result.svg',
                              color: Color(0xff4F38FF),
                            ),
                            SizedBox(height: 1.5.h),
                            const AdmitCard(
                              label: 'Update',
                              labelColor: Color(0xffF5F81B),
                              iconpath: 'assets/svg/update.svg',
                              color: Color(0xffE02728),
                            ),
                            SizedBox(height: 1.5.h),
                            const AdmitCard(
                                label: 'Answer key',
                                labelColor: Color(0xffF5F81B),
                                iconpath: 'assets/svg/update.svg',
                                color: Color(0xff43035B))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(

        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        title: const Text('Search'),
        // content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}

class AdmitCard extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String iconpath;
  final Color color;
  const AdmitCard({
    this.labelColor=Colors.white,
    required this.label,
    required this.iconpath,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.symmetric(vertical: 5.h),
      color: color,
      elevation: 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric( vertical: 3.5.h)),
          Expanded(flex: 2 ,child: Align(alignment: Alignment.centerRight,child: SvgPicture.asset(iconpath))),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/homepage_controller.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/model/homepage_modal.dart';
import 'package:seek_forms/screens/profile/update_profile.dart';
import 'package:seek_forms/widgets/homepage_wiget/custom_rows.dart';
import 'package:seek_forms/widgets/homepage_wiget/pie_chart.dart';

class UserProfile extends StatelessWidget {
   UserProfile({super.key});
final ProfileController profileController = Get.put(ProfileController());
final HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    final userData = profileController.userData;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(color: Colors.white,),
      ),
      body: Obx((){
        return profileController.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.white,),):
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff435FEE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 5.h,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userData.profileImage??'https://image.pngaaa.com/56/5311056-middle.png'),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData.name.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                           "${userData.education??'Add education'}, ${userData.profession??'Add profession'}",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile(userData: userData),));
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),

          /// User Job section
          Obx(()=> homepageController.isLoading.value? Expanded(child: Center(child: CircularProgressIndicator(color: Colors.white,),)):
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserGovernmentJobStatus(
                    governmentdata: homepageController.homepageData[0],

                    height: 45.h,
                    position: MainAxisAlignment.end,
                    align: Alignment.bottomLeft,
                    imageUrl: 'assets/images/fullAvatar.png',
                  ),
                  SizedBox(height: 2.h),
                  UserPrivateJobStatus(
                    privateData: homepageController.homepageData[1],

                    position: MainAxisAlignment.start,
                    height: 45.h,
                    align: Alignment.bottomRight,
                    imageUrl: 'assets/images/flipAvatar.png',
                  )
                ],
              ),
            ),
          ),),
        ],
      );
      })
      
    );
  }
}

class UserGovernmentJobStatus extends StatelessWidget {
  final HomepageModal governmentdata;
  final MainAxisAlignment position;
  final double height;
  final String imageUrl;
  final Alignment align;
  UserGovernmentJobStatus(
      {super.key,
      required this.governmentdata,
      required this.position,
      required this.height,
      this.imageUrl = '',
      this.align = Alignment.bottomLeft});

  @override
  Widget build(BuildContext context) {
    
    return Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(1.5.h),
              child: Row(
                mainAxisAlignment: position,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                            width: 75.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Column(
                                children: [
                                  customTextRow(governmentdata.name!, 'Apply', '%'),
                                  Divider(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  customFieldRow('Applied Govt. forms', governmentdata.applied.toString(),
                                      '${calculatePercentage().toString()}%', Color(0xff14B8A6)),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  customFieldRow('Applied Entrance forms', '0',
                                      '0.0%', Color(0xffF59E0B)),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  customFieldRow('Admit Card', '0',
                                      '0.0%', Color(0xff6366F1)) ,
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  PieChartWidget()
                                ],
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: align,
              child: Image.asset(imageUrl,),
              // Image.asset('assets/images/halfAvatar.png')
            ),
          ],
        ));
  }
  double calculatePercentage(){
    int appliedJobs = governmentdata.applied!;
    int totalJobs=governmentdata.newJobs!;
    double total = appliedJobs/totalJobs;
    double percentage = total*100;
    return percentage;
  }
  
}
class UserPrivateJobStatus extends StatelessWidget {
  final HomepageModal privateData;
  final MainAxisAlignment position;
  final double height;
  final String imageUrl;
  final Alignment align;
  UserPrivateJobStatus(
      {super.key,
      required this.privateData,
      required this.position,
      required this.height,
      this.imageUrl = '',
      this.align = Alignment.bottomLeft});
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(1.5.h),
              child: Row(
                mainAxisAlignment: position,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                            width: 75.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Column(
                                children: [
                                  customTextRow(privateData.name!, 'Apply', '%'),
                                  Divider(),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  customFieldRow('Applied Jobs', privateData.applied.toString(),
                                      '${calculatePercentage().toString()}%', Color(0xff14B8A6)),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  customFieldRow('Rejected', '0',
                                      '0.0%', Color(0xffF59E0B)),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  PieChartWidget()
                                ],
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: align,
              child: Image.asset(imageUrl,),
              // Image.asset('assets/images/halfAvatar.png')
            ),
          ],
        ));
  }
  double calculatePercentage(){
    int appliedJobs = privateData.applied!;
    int totalJobs=privateData.newJobs!;
    double total = appliedJobs/totalJobs;
    double percentage = total*100;
    return percentage;
  }
}

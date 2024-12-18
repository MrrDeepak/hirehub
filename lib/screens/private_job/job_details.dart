import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/apply_privatejob_controller.dart';
import 'package:seek_forms/Api_Controller/private_job_controller.dart';
import 'package:seek_forms/model/private_jobs_model.dart';
import 'package:seek_forms/screens/government_jobs/government_jobs.dart';
import 'package:seek_forms/screens/private_job/job_description.dart';
import 'package:seek_forms/screens/private_job/private_job_homepage.dart';
import 'package:seek_forms/widgets/filter/expanded_filter_button.dart';
import 'package:seek_forms/widgets/private_job_widget/about_company.dart';

class Jobdetails extends StatefulWidget {
  final Data jobData;

  const Jobdetails({
    super.key,
    required this.jobData,
  });

  @override
  State<Jobdetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<Jobdetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PrivateJobSearchController privateJobController =
      Get.put(PrivateJobSearchController());
  final FilterButtonController filterController =
      Get.put(FilterButtonController());
  final GovernmentJobSearchController governmentJobController = Get.put(GovernmentJobSearchController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        privateJobController.isJobApplied.value = false;
        governmentJobController.isJobApplied.value = false;
        Navigator.pop(context,true);
        return false;
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: BackButton(
              onPressed: () {
                privateJobController.isJobApplied.value = false;
                governmentJobController.isJobApplied.value=false;
                Navigator.pop(context,true);
              },
              color: Colors.white,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: const Icon(
                  Icons.share,
                  color: Color(0xffF19157),
                ),
              )
            ],
            bottom: TabBar(
                physics: NeverScrollableScrollPhysics(),
                indicator: BoxDecoration(),
                labelColor: Color(0xffF19157),
                unselectedLabelColor: Colors.white,
                labelStyle:
                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text('Job Details'),
                  ),
                  Tab(
                    child: Text('About Company'),
                  )
                ]),
          ),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                JobDescription(
                  jobData: widget.jobData,
                ),
                AboutCompany(
                  jobData: widget.jobData,
                )
              ])),
    );
  }
}

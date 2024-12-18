import 'package:seek_forms/widgets/order_tracker_zen.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ApplicationTracking extends StatelessWidget {
  const ApplicationTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
      appBar: AppBar(
        backgroundColor: Color(0xff5963F4),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/admission.svg'),
                SvgPicture.asset('assets/svg/tracking.svg'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xffF5F5F5)),
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracking Number:',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '#152485485665659',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Status:',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: TrackingStatus()))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TrackingStatus extends StatelessWidget {
//   const TrackingStatus({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: OrderTrackerZen(
//             activeIndex: 2,
            

//             text_primary_color: Colors.blue,
//             success_color: Colors.green, 
//             tracker_data: [
//             TrackerData(
//               title: 'Payment', date: "", tracker_details: [
//               TrackerDetails(
//                   title: 'Payment completed', datetime: '12/12/2024 12:59 AM')
//             ]),
//             TrackerData(
//                 title: 'Document Exchange Process',
//                 date: "",
//                 tracker_details: [
//                   TrackerDetails(
//                       title: 'Done!!', datetime: '12/12/2024 12:59 AM')
//                 ]),
//             TrackerData(
//                 title: 'Form Filling Process',
//                 date: "",
//                 tracker_details: [
//                   TrackerDetails(
//                       title: 'Done!!', datetime: '12/12/2024 12:59 AM')
//                 ]),
//             TrackerData(title: 'Done', date: '', tracker_details: []),
//           ]),
//         )
//       ],
//     );
//   }
// }
class TrackingStatus extends StatelessWidget {
  TrackingStatus({super.key});

  final List<String> title = [
    "Payment",
    "Document Exchange Process",
    "Form Filling Process",
    "Job Appling Process",
    "Final Process",
    "Complete"
  ];

  final List<String> subTitle = [
    "12/12/2024 12:59 AM Payment Complete",
    "12/12/2024 12:59 AM Done !!",
    "12/12/2024 12:59 AM Done !!",
    "12/12/2024 12:59 AM Done !!",
    "12/12/2024 12:59 AM Done !!",
    ""
  ];

  final int activeIndex = 2;

  // Index of the current active step
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0, // Position the node at the start of the tile
              color: Colors.grey,
              indicatorTheme: IndicatorThemeData(
                size: 20,
              ),
              connectorTheme: ConnectorThemeData(
                thickness: 3.0,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              itemCount: title.length,
              contentsBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title[index],
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: index <= activeIndex
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Color(0xff5963F4)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      subTitle[index],
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              indicatorBuilder: (context, index) => Indicator.widget(
                position: 0.3,
                size: 25,
                // color: index <= activeIndex ? Colors.green : Colors.grey,
                child: index <= activeIndex
                    ? CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, size: 14, color: Colors.white))
                    : CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
              ),
              connectorBuilder: (context, index, type) => SolidLineConnector(
                color: index <= activeIndex ? Color(0xff5963F4) : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

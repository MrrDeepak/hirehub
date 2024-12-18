import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/Ignou_controller.dart';
import 'package:seek_forms/model/ignou_data_model.dart';
import 'package:seek_forms/screens/payment/payment_screen.dart';
import 'package:seek_forms/widgets/Ignou_widget/Ignou_job_card.dart';
import 'package:seek_forms/widgets/private_job_widget/private_job_card.dart';
import 'package:seek_forms/widgets/search_bar.dart';

class IgnouPrograms extends StatelessWidget {
  
   IgnouPrograms({super.key});
final IgnouController ignouController = Get.put(IgnouController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5963F4),
      appBar: AppBar(
        backgroundColor: Color(0xff5963F4),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: SearchBarWidget(color: Colors.white),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ignouController.ignoudata.length,
            itemBuilder: (context, index) {
              final ignouData = ignouController.ignoudata[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
                child: GestureDetector(
                  onTap: () {
                    _modalBottomSheetMenu(ignouData,context);
                  },
                  child: Container(
                    height: 6.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffEC7979)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           ignouData.degreeType??'',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
  void _modalBottomSheetMenu(IgnouDataModel ignouData,BuildContext context){
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
          color: Color(0xffEC7979),
        ),
        
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
            SizedBox(height: 2.h,),
            Text(ignouData.degreeType??'',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.sp),),
            SearchBarWidget(color: Colors.white),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: ignouData.formData!.length!,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 1.h),
                      child: IgnouJobCard(
                        formdata: ignouData.formData![index],
                        ontap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                      },),
                    );
                  },
                  ),
              ),
            )
          ],),
        )
      );
    },);
  }
}

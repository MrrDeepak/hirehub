import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seek_forms/Api_Controller/profile_controller.dart';
import 'package:seek_forms/model/user_modal.dart';
import 'package:seek_forms/util.dart';
import 'package:seek_forms/widgets/phone_field.dart';
import 'package:seek_forms/widgets/text_field.dart';
import 'package:seek_forms/widgets/wide_button.dart';

class UpdateProfile extends StatefulWidget {
  final User userData;
  UpdateProfile({required this.userData, super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _professionController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _educationController;
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData.name);
    _professionController =
        TextEditingController(text: widget.userData.profession);
    _addressController = TextEditingController(text: widget.userData.address);
    _phoneController = TextEditingController(text: widget.userData.mobile);
    _emailController = TextEditingController(text: widget.userData.email);
    _educationController =
        TextEditingController(text: widget.userData.education);
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      // Update the userData's data with the new values
      widget.userData.name = _nameController.text;
      widget.userData.address = _addressController.text;
      widget.userData.mobile = _phoneController.text;
      widget.userData.profession = _professionController.text;
      widget.userData.email = _emailController.text;
      widget.userData.education = _educationController.text;

      
      profileController.updateProfile(widget.userData);
      profileController.getProfileDetails();
      // After sending the request, you can pop the page and go back
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(flex: 4,child: Align(alignment: Alignment.center,child: customBoldText('Update Profile', Colors.white))),
            Expanded(flex: 1,child: Container())
          ],
        ),
        

        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                Container(
                  height: 12.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 2)
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.userData.profileImage ??'https://image.pngaaa.com/56/5311056-middle.png',),
                  )
                  // Image.asset('assets/images/loan.png',fit: BoxFit.cover,),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _nameController,
                  hintText: "Name",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _emailController,
                  hintText: "Email",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomPhoneField(
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  hintText: "Phone",
                  numberLimit: 10,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _professionController,
                  hintText: "Profession",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _educationController,
                  hintText: "Education",
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: _addressController,
                  hintText: "Address",
                ),
                SizedBox(
                  height: 1.7.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  return profileController.isUpdateLoading.value
                      ? CircularProgressIndicator(
                          color: const Color(0xffF19157),
                        )
                      : CustomWideButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                            _saveChanges();
                            }
                          },
                          label: "Save Changes",
                          buttonBackgroundColor: const Color(0xffF19157),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? nameValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    }
    if (!val.contains("@")) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  String? phoneValidator(String val) {
    if (val.isEmpty) {
      return "This field is required";
    }
    if (val.length != 10) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }
}

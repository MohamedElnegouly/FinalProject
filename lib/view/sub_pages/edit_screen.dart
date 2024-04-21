import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduationproject/widget/app_button.dart';
import 'package:graduationproject/widget/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';
import '../../core/shared_preferences.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final countryController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Edit Profile",style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Padding(
        padding:  EdgeInsets.all(15.sp),
        child: ListView(children: [
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child:
            CustomInputField(
              hintText: PreferenceUtils.getString(
                  PreferenceKey.name,),
              labelText:
              PreferenceUtils.getString(
                PreferenceKey.name,),
              //"full name",
            controller: nameController,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: CustomInputField(
              labelText: "user name",controller: usernameController,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: CustomInputField(
              labelText: PreferenceUtils.getString(
                  PreferenceKey.email,),
              hintText: PreferenceUtils.getString(
                  PreferenceKey.email,
              ),
              controller: emailController,),
          ),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child:
            TextFormField(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              maxLength: 11,
              keyboardType: TextInputType.phone,
              decoration:
              InputDecoration(
                border : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.sp),
                    borderSide:
                    BorderSide(color: mainColor)
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                labelText: "Phone number"
              ),
              ),
            ),
          Row(children: [
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(8.sp),
                child: CustomInputField(labelText: "country",controller: countryController,),
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(8.sp),
                child: CustomInputField(labelText: "Gender",controller: genderController,),
              ),
            )
          ],),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: CustomInputField(labelText: "Address",controller: addressController,),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 15.sp),
            child:
            AppButton(title: 'Update')
          ),

        ],),
      ),
    );
  }
  void saveUserData() {
    PreferenceUtils.setString(
        PreferenceKey.name,
        nameController.text
    );
    PreferenceUtils.setString(
        PreferenceKey.email,
        emailController.text
    );
    PreferenceUtils.setString(
        PreferenceKey.phone,
        phoneController.text
    );
  }
}

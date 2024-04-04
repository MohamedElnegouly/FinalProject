import 'package:flutter/material.dart';
import 'package:graduationproject/models/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../colors/colors.dart';
import '../../models/custom_button.dart';

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
            child: CustomInputField(
              labelText: "full name",
            controller: nameController,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: CustomInputField(labelText: "user name",controller: usernameController,),
          ),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: CustomInputField(labelText: "Email",controller: emailController,),
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
            child: CustomFormButton(
                innerText: 'Update',
                onPressed: () {}
            ),
          ),

        ],),
      ),
    );
  }
}

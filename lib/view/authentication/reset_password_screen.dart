import 'package:flutter/material.dart';
import 'package:graduationproject/view/login/view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../core/validator/validator.dart';
import '../../widget/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                SizedBox(height: 100),
                //title
                Text(
                  "Create new password ",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                //subtitle
                Text(
                  "your new password must be unique form those previously used.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 50,),
                CustomInputField(
                  hintText: 'New Password',
                  labelText: 'password',
                  validator: (value) {
                    return Validator.validatePassword(value);
                  },
                ),
                SizedBox(height: 15),
                CustomInputField(
                  hintText: 'Confirm Password',
                  labelText: 'confirm',
                  validator: (value) {
                    return Validator.validatePassword(value);
                  },
                ),
                //reset passwords
                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 30.sp,
                  child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

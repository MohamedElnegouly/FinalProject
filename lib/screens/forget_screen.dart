import 'package:flutter/material.dart';
import 'package:graduationproject/screens/otp_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../colors/colors.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Text(
                  "Forget Password?",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                //subtitle
                Text(
                  "Don't worry!it occurs.Please enter the email\naddress linked with your account",
                  style: TextStyle(fontSize: 18),
                ),
                //email textfiled
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your email"),
                  ),
                ),

                //sendcode

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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ReciveOtpScreen()));

                  },
                  child: Text(
                    "Send Code",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),),
            ),
                //text:login
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "remember password ?",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        "  login",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

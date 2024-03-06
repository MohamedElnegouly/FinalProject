import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/screens/reset_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReciveOtpScreen extends StatefulWidget {
  const ReciveOtpScreen({super.key});

  @override
  State<ReciveOtpScreen> createState() => _ReciveOtpScreenState();
}

class _ReciveOtpScreenState extends State<ReciveOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              //title
              Text(
                "OTP Verification",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              //subtitle
              Text(
                "Enter the verification code we just sent on your email address ",
                style: TextStyle(fontSize: 18),
              ),
              //Verify
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Textfiledotp(),
                    Textfiledotp(),
                    Textfiledotp(),
                    Textfiledotp()
                  ]),

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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen()));

                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),),
              ),

              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn\'t received code?",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "  Resend",
                    style: TextStyle(
                        color: Color.fromARGB(255, 20, 255, 255),
                        fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Textfiledotp extends StatelessWidget {
  const Textfiledotp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 220, 220),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 222, 220, 220),
              width: 2,
            )),
        child: TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.green),),
              border: InputBorder.none,
              constraints: BoxConstraints(maxWidth: 80, maxHeight: 80)),
        ));
  }
}

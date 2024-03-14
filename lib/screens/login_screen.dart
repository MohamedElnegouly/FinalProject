import 'package:flutter/material.dart';
import 'package:graduationproject/screens/forget_screen.dart';
import 'package:graduationproject/screens/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/custom_button.dart';
import '../models/square_tile.dart';
import '../models/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool obscureText = false;

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back! Glad \n to see you, Again!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.sp),

                CustomInputField(
                    hintText: 'Enter your Email',
                  controller: usernameController,
                ),

                SizedBox(height: 10.sp),

                SizedBox(
                  height: 35.sp,
                  child:
                  CustomInputField(
                    hintText: 'Your password',
                    obscureText: true,
                    suffixIcon: true,
                    controller: passwordController,
                  ),

                ),

                SizedBox(height: 5.sp),

                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> ForgetScreen()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),

                SizedBox(height: 30.sp),

                // sign in button
                CustomFormButton(
                    innerText: "Login",
                    onPressed: ()=> signUserIn),

                SizedBox(height: 15.sp),

                // or continue with
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or login with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.sp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google but
                    SquareTile(imagePath: 'assets/images/Facebook.png'),

                    SquareTile(imagePath: 'assets/images/google.png'),

                    SquareTile(imagePath: 'assets/images/apple.png'),
                  ],
                ),

                SizedBox(height: 40.sp),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context)=> RegisterScreen()));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.cyanAccent[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/models/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/square_tile.dart';
import '../models/text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool obscureText =false;
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
            icon: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(15.sp),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome! Glad to\n see you!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 25.sp),

                MyTextField(
                  controller: usernameController ,
                  hintText: 'Username',
                  obscureText: false,
                ),

                 SizedBox(height: 10.sp),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                 SizedBox(height: 10.sp),

                SizedBox(
                  height: 33.sp,
                  child: MyTextField(
                    controller: passwordController,
                    hintText: "password",
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off :
                        Icons.visibility,
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Your password';
                      }if(value.length < 6){
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                ),


                 SizedBox(height: 10.sp),

                SizedBox(
                  height: 33.sp,
                  child: MyTextField(
                    controller: passwordController,
                    hintText: "confirm password",
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off :
                        Icons.visibility,
                      ),
                    ),
                  ),
                ),



                 SizedBox(height: 20.sp),

                // sign in button
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding:  EdgeInsets.all(17.sp),
                  decoration:  BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Agree and Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

                 SizedBox(height: 25.sp),

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
                        padding:  EdgeInsets.symmetric(horizontal: 10.sp),
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

                 SizedBox(height: 20.sp),

                const  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google but
                    SquareTile(imagePath: 'assets/images/Facebook.png'),

                    SquareTile(imagePath: 'assets/images/google.png'),

                    SquareTile(imagePath: 'assets/images/apple.png'),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graduationproject/models/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/square_tile.dart';
import '../models/custom_text_field.dart';

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

                 SizedBox(height: 20.sp),

                SizedBox(
                  height: 35.sp,
                  child: CustomInputField(
                    hintText: 'UserName',
                    controller: usernameController,
                  ),
                ),

                 SizedBox(height: 10.sp),

               SizedBox(
                 height: 35.sp,
                 child: CustomInputField(
                     hintText: "Email",
                 controller: emailController,
                 ),
               ),
                 SizedBox(height: 10.sp),

                SizedBox(
                  height: 35.sp,
                  child:
                  CustomInputField(
                    hintText: 'password',
                    obscureText: true,
                    suffixIcon: true,
                    controller: passwordController,
                  ),
                ),
                 SizedBox(height: 10.sp),

                SizedBox(
                  height: 35.sp,
                  child:
                  CustomInputField(
                    hintText: 'Confirm password',
                    obscureText: true,
                    suffixIcon: true,
                    controller: confirmPasswordController,
                  ),
                ),

                 SizedBox(height: 20.sp),

                // sign in button

                CustomFormButton(
                    innerText:  "Agree and Register",
                    onPressed: (){
                      Navigator.pop(context);
                    }),

                 SizedBox(height: 20.sp),

                // or continue with
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.sp),
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

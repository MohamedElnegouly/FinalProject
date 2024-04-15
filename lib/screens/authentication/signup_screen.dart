import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/models/custom_button.dart';
import 'package:graduationproject/screens/nav_bar_screens/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/auth_cubit.dart';
import '../../models/shared_preferences.dart';
import '../../models/square_tile.dart';
import '../../models/custom_text_field.dart';
import 'signin_screen.dart';

class SignUPScreen extends StatefulWidget {
  SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  bool obscureText = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {
      if(state is RegisterSuccessState)
      {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Account created"),
              behavior: SnackBarBehavior.floating,
            ));
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else if(state is RegisterFailedState)
      {
        showDialog(context: context, builder: (context)=>
            AlertDialog(
              content: Text(state.errorMessage,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
      }
    },
    builder: (context,state){
    return
      GestureDetector(
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
          toolbarHeight: 30,
        ),
        backgroundColor: Colors.white,
        body:  Form(
    key: formKey,
    child:Padding(
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

           SizedBox(height: 15.sp),

          SizedBox(
            height: 36.sp,
            child: CustomInputField(
              hintText: 'UserName',
              controller: nameController,
            ),
          ),

           SizedBox(height: 10.sp),

         SizedBox(
           height: 36.sp,
           child: CustomInputField(
               hintText: "Email",
           controller: emailController,
           ),
         ),
           SizedBox(height: 10.sp),

          SizedBox(
            height: 36.sp,
            child:
            CustomInputField(
              hintText: 'password',
              obscureText: true,
              suffixIcon: true,
              controller: passwordController,
            ),
          ),
           SizedBox(height: 10.sp),

          // SizedBox(
          //   height: 35.sp,
          //   child:
          //   CustomInputField(
          //     hintText: 'Confirm password',
          //     obscureText: true,
          //     suffixIcon: true,
          //     controller: confirmPasswordController,
          //   ),
          // ),
          SizedBox(
            height: 36.sp,
            child:
            CustomInputField(
              hintText: 'country',
              controller: countryController,
            ),
          ),
          SizedBox(
            height: 36.sp,
            child:
            CustomInputField(
              hintText: 'city ',
              controller: cityController,
            ),
          ),
           SizedBox(height: 20.sp),

          // sign in button

          CustomFormButton(
              innerText: state is RegisterLoadingState
    ? "loading..."
        :
    "Agree and Register",
              onPressed: (){
      if(formKey.currentState!.validate())
      {
        saveUserData();
        BlocProvider.of<AuthCubit>(context).register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      //phone: phoneController.text
      country: countryController.text,
      city: cityController.text
      ).then((value) => Navigator.pop(context));
      }
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
      )
      );
    },
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

  }
}

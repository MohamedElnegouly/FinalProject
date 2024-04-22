import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/validator/validator.dart';
import 'package:graduationproject/view/register/register_cubit.dart';
import 'package:graduationproject/widget/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/assets/app_assets.dart';
import '../../core/shared_preferences.dart';
import '../../widget/app_text.dart';
import '../../widget/square_tile.dart';
import '../../widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
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
      BlocConsumer<RegisterCubit,RegisterState>(
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
            height: 42.sp,
            child:
                CustomInputField(
                  labelText: "UserName",
                  hintText: 'enter your name',
                  controller: nameController,
                  validator: (value){
                    return Validator.validateName(value);}
                )
          ),

           SizedBox(height: 10.sp),

         SizedBox(
           height: 42.sp,
           child: CustomInputField(
             labelText: "email",
             hintText: "Enter your Email",
           controller: emailController,
               validator: (value){
                 return Validator.validateEmail(value);}
           ),
         ),
           SizedBox(height: 10.sp),

          SizedBox(
            height: 42.sp,
            child:
            CustomInputField(
              labelText: "password",
              hintText: 'password',
              obscureText: true,
              suffixIcon: true,
              controller: passwordController,
              validator: (value) {
                return Validator.validatePassword(value);
              }
              )
          ),
           SizedBox(height: 10.sp),

          SizedBox(
            height: 42.sp,
            child:
            CustomInputField(
              hintText: 'country',
              controller: countryController,
                validator: (value) {
                  return Validator.validateAnotherField(value);
                }
            ),
          ),
          SizedBox(
            height: 42.sp,
            child:
            CustomInputField(
              hintText: 'city ',
              controller: cityController,
                validator: (value) {
                  return Validator.validateAnotherField(value);
                }
            ),
          ),
           SizedBox(height: 20.sp),
          AppButton(title:
           state is RegisterLoadingState
          ? "loading..."
              : "Agree and Register",
          onTap: (){
            if(formKey.currentState!.validate())
            {
              saveUserData();
              BlocProvider.of<RegisterCubit>(context).register(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  country: countryController.text,
                  city: cityController.text
              ).then((value) => Navigator.pop(context));
            }
          },
          ),
           SizedBox(height: 20.sp),
          Align(
            alignment: Alignment.center,
            child: AppText(
              text: 'Or login with social account',
            ),
          ),

           SizedBox(height: 15.sp),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: AppAssets.faceBookAsset),
              SquareTile(imagePath: AppAssets.googleAsset),
              SquareTile(imagePath: AppAssets.appleAsset),
            ],
          ),

        ],
      ),
    ),
      ),
    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/forget_password/view/view.dart';
import 'package:graduationproject/view/nav_bar/view.dart';
import 'package:graduationproject/widget/app_button.dart';
import 'package:graduationproject/widget/app_text.dart';
import 'package:graduationproject/widget/dont_have_account.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/assets/app_assets.dart';
import '../../core/shared_preferences.dart';
import '../../core/validator/validator.dart';
import 'login_cubit.dart';
import '../../widget/square_tile.dart';
import '../../widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  bool obscureText = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
          create: (context) => LoginCubit(),
          child: Builder(builder: (context)
    {
      final cubit = BlocProvider.of<LoginCubit>(context);
      return
        GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Form(
                key: formKey,
                child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                "logged in successfully"),
                              behavior: SnackBarBehavior.floating,
                            ));
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                            builder: (context) => NavBarView()));
                      }
                      else if (state is LoginFailedState) {
                        showDialog(context: context, builder: (context) =>
                            AlertDialog(
                              content: Text(state.errorMessage,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ));
                      }
                    },
                    builder: (context, state) {
                      return
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: ListView(
                              children: [
                                Text(
                                  "Welcome back! Glad \n to see you, Again!",
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 25
                                  ),
                                ),
                                SizedBox(height: 30.sp),
                                CustomInputField(
                                  hintText: 'Enter your Email',
                                  controller: emailController,
                                  labelText: "email",
                                ),

                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 45.sp,
                                  child:
                                  CustomInputField(
                                    hintText: 'Your password',
                                    labelText: "password",
                                    obscureText: true,
                                    suffixIcon: true,
                                    controller: passwordController,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPasswordView()));
                                    },
                                    child: const AppText(
                                      text: 'Forgot your password? ',
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10.sp),
                                AppButton(
                                  title: state is LoginLoadingState
                                      ? "loading..."
                                      : 'Login',
                                  onTap: () {
                                    if (formKey.currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login(
                                          email: emailController.text,
                                          password: passwordController
                                              .text);
                                    }
                                  },
                                ),
                                SizedBox(height: 15.sp),
                                 Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                    text: 'Or login with social account',
                                  ),
                                ),

                                SizedBox(height: 10.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SquareTile(imagePath: AppAssets.faceBookAsset),
                                    SquareTile(imagePath: AppAssets.googleAsset),
                                    SquareTile(imagePath: AppAssets.appleAsset),
                                  ],
                                ),
                                SizedBox(height: 20.sp),
                                DontHaveAnAccountWidget(),
                              ],
                            ),
                          ),
                        );
                    }),
              ),
            )
        );
    }
    )
      );
  }
  }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/widget/custom_text_field.dart';
import '../../../constants.dart';
import '../../../core/validator/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_text.dart';
import '../manager/forget_password_cubit.dart';

class ForgetScreenBody extends StatelessWidget {
  const ForgetScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: Builder(builder: (context) {
          final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * .0418, horizontal: 14.0
            ),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autovalidateMode,
              child: ListView(
                children: [
                  const AppText(
                    text: "Forgot password",
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const AppText(
                      text: 'Don\'t Worry! It Occurs.Please Enter The Email Address Linked With Your Account.'
                  ),
                   SizedBox(
                    height: height * .0971,
                  ),
                  CustomInputField(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    validator: (value) {
                      return Validator.validateEmail(value);
                    },
                  ),
                  SizedBox(
                    height: height * .0300,
                  ),
                  AppButton(
                    title: 'SEND CODE',
                    onTap: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.formKey.currentState!.save();
                      } else {
                        cubit.autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }),
    );
  }
}

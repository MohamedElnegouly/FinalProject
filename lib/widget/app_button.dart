import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.sp,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: mainColor),
        child: Align(
            alignment: Alignment.center,
            child: AppText(
              text: title,
              color: white,
            )),
      ),
    );
  }
}
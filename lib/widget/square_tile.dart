import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Image.asset(
            imagePath,
            height: 25.sp,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 40.sp,),
        Expanded(
          child:
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Expanded(child: Image.asset("assets/images/image 1.png")),
                Expanded(
                  child: Container(
                    height: 50.sp,
                    width: 50.sp,
                    child:
                    Image.asset("assets/images/image 2.png"),
                  ),
                ),
              ]),
        ),
        SizedBox(height: 30.sp,),
        Image.asset('assets/images/Desk Share-logos.png'),
        SizedBox(height: 30.sp,),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Image.asset('assets/images/image 3.png')),
              Expanded(
                child: Container(
                  height: 80.sp,
                  width: 60.sp,
                  child:
                  Image.asset('assets/images/image 4.png'),
                ),
              ),
            ],),
        ),
        SizedBox(height: 30.sp,),
      ],);
  }
}

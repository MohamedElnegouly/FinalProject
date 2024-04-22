import 'package:flutter/material.dart';
import 'package:graduationproject/core/assets/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkSpaceAvailable extends StatelessWidget {
  const WorkSpaceAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp,top: 10.sp),
            child: Container(
              width: 55.sp,
              child: Image.asset(
                AppAssets.imageTest1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: 'Single space\n\n',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(253, 172, 172, 172),
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: '\$4',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black)),

                  TextSpan(
                      text: '/Hour',
                      style: TextStyle(
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
        ]
    );
  }
}

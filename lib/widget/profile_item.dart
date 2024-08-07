import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../core/constants/colors.dart';
import '../core/shared/shared_preferences.dart';

class ProfileItem extends StatelessWidget {
   ProfileItem({super.key,
     required this.onTap,
     required this.icon,
     required this.title,
     this.value=''});

  final GestureTapCallback onTap;
  final IconData icon;
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: onTap,
          child:
          Padding(
            padding: EdgeInsets.only(left: 15.sp, top: 15.sp,bottom: 10.sp),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(
                    icon,
                    color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : mainColor,),
                  ),

                const SizedBox(width: 5),
                Text(
                  title!,
                  style: TextStyle(color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
                      ? Colors.white
                      : Colors.black,),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 10.sp,right: 15.sp),
                  child: Text(
                    value!,
                    style: TextStyle(color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : mainColor,
                    ),
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
}

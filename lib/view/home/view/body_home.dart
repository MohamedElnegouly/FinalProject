import 'package:flutter/material.dart';
import 'package:graduationproject/core/assets/app_assets.dart';
import 'package:graduationproject/view/workspace/view/workspace_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../generated/l10n.dart';
import '../../login/view.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}
class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.location_on_outlined),
        ),
        RichText(
          text: TextSpan(
            text: S().Currentlocation+'\n',
            style: TextStyle(
              color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.white
                  : Colors.black54,
            ),
            children: [
              TextSpan(
                text: S().KualaLumpur +','+ S().Malaysia,
                style: TextStyle(
                  color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                      ? Colors.white
                      : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

          },
          icon: Icon(Icons.logout),
        )
      ]),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            S().OnlyforToday,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      Stack(children: [
        Image.asset(
            AppAssets.imageTest1,
            height: 55.sp,
            width: double.infinity,
            fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S().percent,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
              Text(S().foodBeverage,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 25.sp,
              ),
              Text(S().ByOnlybookfor1hour,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        )
      ]),
      SizedBox(height: 10.sp,),
      Align(
          alignment: Alignment.centerLeft,
          child: Text(S().SponsoredbySomerandomplace,style: TextStyle(color: Colors.grey),)),
      SizedBox(
        height: 15.sp,
      ),
      Row(
        children: [
          Text(
            S().PopularWorkspace,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> WorkScreen()
                  ));
            },
              child: Text(S().Seeall))
        ],
      ),
    ],);
  }
}

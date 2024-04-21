import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/view/login/view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
       Column(
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
       ],)
    );
  }


}

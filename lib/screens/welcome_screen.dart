import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           SizedBox(height: 70,),
         Expanded(
           child:
           Row(
               crossAxisAlignment: CrossAxisAlignment.start,
       children:[
             Image.asset("assets/images/image 1.png"),
         Container(
           height: 150,
           width: 150,
           child:
           Image.asset("assets/images/image 2.png"),
         ),
           ]),
         ),
         Image.asset('assets/images/Desk Share-logos_transparent 1.png'),
        SizedBox(height: 60,),
         Expanded(
           child: Row(
   crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Image.asset('assets/images/image 3.png'),
           Container(
             height: 230,
             width: 215,
             child:
               Image.asset('assets/images/image 4.png'),
           ),
           ],),
         )

       ],)
    );
  }


}

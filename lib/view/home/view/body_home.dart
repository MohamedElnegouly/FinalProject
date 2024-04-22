import 'package:flutter/material.dart';
import 'package:graduationproject/core/assets/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          text: const TextSpan(
            text: 'Current location\n',
            style: TextStyle(
              color: Colors.black38,
            ),
            children: [
              TextSpan(
                text: 'Kuala Lumpur, Malaysia',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Icon(
          Icons.notifications_none,
          size: 30,
        )
      ]),
      TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            border: InputBorder.none,
            hintText: "  Where do you want yo work?",
            hintStyle: TextStyle(height: 4,fontSize: 15)),
      ),
      Text(
        "  Only for Today",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              Text("30% Off",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 33)),
              Text("All Food & Beverage",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 25,
              ),
              Text("By Only book for 1 hour",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ],
          ),
        )
      ]),
      Text("Sponsored by Some random place",style: TextStyle(color: Colors.grey),),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text(
            "Popular Workspace",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          Text("See all")
        ],
      ),
    ],);
  }
}

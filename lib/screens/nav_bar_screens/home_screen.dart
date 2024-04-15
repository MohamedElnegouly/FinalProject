import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp),
        child: ListView(
          children: [
            //1**********************************
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
            //4************************************************************************* */

            Stack(children: [
              Image.asset(
                  "assets/images/photo_2024-04-04_12-18-30.jpg",
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

    ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
    itemCount: 1,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Stack(
    alignment: Alignment.topLeft,
    children: [
    Image.asset(
    "assets/images/photo_2024-04-04_12-19-27.jpg",
    height: 50.sp,
    width: 50.sp,
    fit: BoxFit.cover,
    ),
    Container(
    child: Icon(
    Icons.favorite,
    size: 30,
    color: Color.fromARGB(255, 0, 85, 255),
    ),
    padding: EdgeInsetsDirectional.only(top: 50, start: 20),
    )
    ],
    ),
///////////////////////

    Padding(
    padding: EdgeInsets.all(15.sp),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Gowork park 29",
    style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20),
    ),
    Row(
    children: [
    Icon(Icons.location_on_outlined),
    Text("petaling Malaysia")
    ]),

    Padding(
    padding: EdgeInsets.only(top: 8.sp,bottom: 8.sp),
    child: RatingBar.builder(
    initialRating: 3,
    minRating: 1,
    itemSize: 15,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
    Icons.star,
    color: Colors.blue,
    ),
    onRatingUpdate: (rating) {
    print(rating);
    },
    ),
    ),
    Padding(
    padding: EdgeInsets.only(top: 25.sp),
    child:
    RichText(
    text: const TextSpan(
    text: '\$17 ',
    style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w900, fontSize: 15),
    children: [
    TextSpan(
    text: '/Hour',
    style: TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal
    ),
    ),
    ],
    ),
    ),
    ),
    ]),
    ),
    ],
    ),
    );
  }
    )
          ],
        ),
      ),

    );
  }
}

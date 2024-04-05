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
      body: Container(
        margin: EdgeInsets.all(25.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1**********************************
            Row(children: [
              Icon(Icons.location_on_outlined),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current location"),
                  Text(
                    "Kuala Lumpur,Malaysia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   width: 220.sp,
              // ),
              Icon(
                Icons.notifications_none,
                size: 30,
              )
            ])

            ///2******************************************************************** */
            ,
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: InputBorder.none,
                  hintText: "  Where do you want yo work?",
                  hintStyle: TextStyle(height: 5)),
            ),

            ///3************************************************************************ */

            Text(
              "  Only for Today",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //4************************************************************************* */

            Stack(children: [
              Image.asset(
                  "assets/images/photo_2024-04-04_12-18-30.jpg",
                  height: 170,
                  width: 500,
                  fit: BoxFit.cover),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("30% Off",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      Text("All Food & Beverage",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Text("By Only book for 1 hour",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                    ],
                  ))
            ]),
            //5********************************************************************

            Text("Sponsored by Some random place"),
            SizedBox(
              height: 20,
            ),
            //6********************************************************* */

            Row(
              children: [
                Text(
                  "Popular Workspace",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                // SizedBox(
                //   width: 120,
                // ),
                Text("See all")
              ],
            ),

            //7********************************************************

            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/photo_2024-04-04_12-19-27.jpg",
                      height: 150,
                      width: 150,
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

                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gowork park 29",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Row(children: [
                          Icon(Icons.location_on_outlined),
                          Text("petaling Malaysia")
                        ]),

                        Padding(
                          padding: EdgeInsets.only(left: 15,bottom: 15),
                          child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            itemSize: 20,
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
                          )
                        ),
                            Text(
                              "&17/Hour",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                      ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}

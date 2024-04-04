import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';

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
        margin: EdgeInsets.all(25),
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
              SizedBox(
                width: 220,
              ),
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
                  "FinalProject/assets/images/photo_2024-04-04_12-18-30.jpg",
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
                SizedBox(
                  width: 120,
                ),
                Text("See all")
              ],
            ),

            //7********************************************************

            Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "FinalProject/assets/images/photo_2024-04-04_12-18-30.jpg",
                      height: 200,
                      width: 200,
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
                Container(
                  padding: EdgeInsetsDirectional.only(top: 50),
                  width: 250,
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gowork park 29",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(children: [
                          Icon(Icons.location_on_outlined),
                          Text("petaling Malaysia")
                        ]),
                        Row(
                          children: [
                            Icon(
                              Icons.grade,
                              color: Color.fromARGB(255, 24, 42, 238),
                            ),
                            Icon(
                              Icons.grade,
                              color: Color.fromARGB(255, 24, 42, 238),
                            ),
                            Icon(
                              Icons.grade,
                              color: Color.fromARGB(255, 24, 42, 238),
                            ),
                            Icon(
                              Icons.grade,
                              color: Color.fromARGB(255, 24, 42, 238),
                            ),
                            Icon(
                              Icons.grade,
                              color: Color.fromARGB(255, 24, 42, 238),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "&17",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text("/Hour"),
                            SizedBox(width: 120),
                            Text(
                              "&*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

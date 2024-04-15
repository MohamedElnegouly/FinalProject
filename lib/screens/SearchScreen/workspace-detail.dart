import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../colors/colors.dart';

class WorkSpaceDetails extends StatefulWidget {
  const WorkSpaceDetails({super.key});

  @override
  State<WorkSpaceDetails> createState() => _WorkSpaceDetailsState();
}

class _WorkSpaceDetailsState extends State<WorkSpaceDetails> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Stack(
              alignment: Alignment.topRight,
              children: [
                const Positioned.fill(
                  child: FadeInImage(
                    image: AssetImage("assets/images/photo_2024-04-04_12-19-27.jpg"),
                    placeholder: AssetImage("assets/images/loadingimage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: IconButton(
                            onPressed: () {},
                            //onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            iconSize: 18,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 750),
                          height: 35,
                          width: 35,
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                              iconSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //backgroundColor: Colors.blue,
            leadingWidth: 0,
            toolbarHeight: 250,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: SizedBox()),
            ),
          ),

          ///***************************************************************************************** */
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                height: 3000,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: const TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 20,
                                    color: Color.fromARGB(253, 172, 172, 172),
                                  ),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                  text: " Kota Kinabalu sabah",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  )),
                            ])),
                            Text("Artsy Co-Working Space and Cafe",
                          style: Theme.of(context).textTheme.titleLarge),

                            Padding(
                              padding: EdgeInsets.only(bottom: 15,top: 10),
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 17,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: mainColor,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),

                             SizedBox(
                              height: 15.sp,
                            ),
                          ]),

                       Text(
                        "About",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                       SizedBox(
                        height: 5.sp,
                      ),

                     Text("Welcome to our vibrant and inspiring workspace designed to foster productivity and collaboration in a dynamic environment",
                            style: Theme.of(context).textTheme.titleSmall),

                      SizedBox(
                        height: 20,
                      ),

                       Text(
                        "Detail",
                     style: Theme.of(context).textTheme.titleMedium),

                       SizedBox(
                        height: 6,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround ,
                          children: [
                        RichText(
                          text: TextSpan(
                            text: 'open hour\n',
                            style:Theme.of(context).textTheme.titleSmall,
                           children: [
                              TextSpan(
                                text: '08:00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' - 22:00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        //000000000
                        RichText(
                          text:  TextSpan(
                            text: 'Minimum booking\n',
                             style: Theme.of(context).textTheme.titleSmall,
                         children: [
                              TextSpan(
                                text: '3 Hours',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),

                       SizedBox(
                        height: 20.sp,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Facilities",style: Theme.of(context).textTheme.titleMedium,),
                        Text("See all",style: Theme.of(context).textTheme.titleSmall,),

                      ],),

                      SizedBox(
                        height: 100,
                        child:
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 10.sp,top: 10.sp),
                                child: Container(
                                  height: 50.sp,
                                  width: 40.sp,
                                  child: Image.asset(
                                    "assets/images/photo_2024-04-04_12-18-30.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),

                       SizedBox(
                        height: 20,
                      ),
                       Text(
                        "what's people say",
                        style:  Theme.of(context).textTheme.titleMedium
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                    "images/photo_2024-04-04_12-19-27.jpg"),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: 10),
                                child: RichText(
                                  text:  TextSpan(
                                    text: 'Rahma Ahmed\n',
                                    style: Theme.of(context).textTheme.titleSmall,
                                    children: [
                                      WidgetSpan(child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        itemSize: 15,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: mainColor,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),),
                                      TextSpan(
                                        text: '1 month ago',
                                        style: Theme.of(context).textTheme.titleSmall
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                         Text("Love the food and atmosphere here.very cozy",
                                  style: Theme.of(context).textTheme.titleSmall
                         )
                        ],
                      ),

                       SizedBox(
                        height: 25.sp,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Workplace Available\n',
                      style: Theme.of(context).textTheme.titleMedium,
                       children: [
                            TextSpan(
                                text: 'For 26 June',
                                style: Theme.of(context).textTheme.titleSmall
                        ),
                        ]
                      ),
                      ),
                       SizedBox(
                        height: 10,
                      ),

                      //000000000000000
                      SizedBox(
                        height: 200,
                        child:
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.sp,top: 10.sp),
                                    child: Container(
                                      width: 55.sp,
                                      child: Image.asset(
                                        "assets/images/photo_2024-04-04_12-18-30.jpg",
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
                            }),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 30.sp,
                        child: ElevatedButton.icon(
                         style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5),
                              ),
                           ),
                            onPressed: () async{
                              final DateTime? dateTime = await showDatePicker(context: context,
                                  initialDate: selectedDate, firstDate: DateTime(2000), lastDate:DateTime (3000)
                              );
                              if(dateTime != null ) {
                                setState(() {
                                  selectedDate = dateTime;
                                });
                              }
                             // Text("${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}"),
                            },
                            icon: const Icon(Icons.calendar_month_outlined,color: Colors.white,),
                            label: const Text(
                                "Booking Now",
                              style: TextStyle(color: Colors.white),

                            )
                        ),
                      ),
                    ])),
          )
        ],
      ),
    );
  }
}

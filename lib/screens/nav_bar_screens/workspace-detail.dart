import 'package:flutter/material.dart';

class workspacedetail extends StatefulWidget {
  const workspacedetail({super.key});

  @override
  State<workspacedetail> createState() => _workspacedetailState();
}

class _workspacedetailState extends State<workspacedetail> {
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
                    image: AssetImage("assets/images/welcome_one.png"),
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
                      //11111111111111111111111111111111111111111111111111111111111111111111111111111111

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: const TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                    color: Color.fromARGB(253, 172, 172, 172),
                                  ),
                                  alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                  text: " Kota Kinabalu sabah",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(253, 172, 172, 172))),
                            ])),
                            //000
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: " Artsy Co-Working Space and Cafe",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ])),
                            //000
                            const SizedBox(
                              height: 7,
                            ),
                            //000

                            const Row(
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
                                ),
                                Text(" (30)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(253, 172, 172, 172)))
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                          ]),

                      ///ا22222222222222222222222222222222222
                      const Text(
                        "About",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text:
                                " Welcome to our vibrant and inspiring workspace designed to foster productivity and collaboration in a dynamic environment",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(253, 172, 172, 172))),
                      ])),

                      const SizedBox(
                        height: 20,
                      ),

                      //33333333333333333333333333333333333333333333333333333333333333333333
                      const Text(
                        "Detail",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      //0000000
                      const SizedBox(
                        height: 6,
                      ),
                      //0000000
                      Row(children: [
                        RichText(
                          text: const TextSpan(
                            text: 'open hour\n',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(253, 172, 172, 172)),
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
                          text: const TextSpan(
                            text: 'Minimum booking\n',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(253, 172, 172, 172)),
                            children: [
                              TextSpan(
                                text: '3',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Hours',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      //0000000000
                      const SizedBox(
                        height: 70,
                      ),

                      //4444444444444444444444444444444444444444444444444

                      RichText(
                        text: const TextSpan(
                          text: 'Facilities          ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '              See all',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(248, 188, 186, 185)),
                            ),
                          ],
                        ),
                      ),

                      //0000000000000000

                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            child: Image.asset(
                              "images/photo_2024-04-04_12-18-30.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            child: Image.asset(
                              "images/photo_2024-04-04_12-18-30.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            child: Image.asset(
                              "images/photo_2024-04-04_12-18-30.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            child: Image.asset(
                              "images/photo_2024-04-04_12-18-30.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),

                      //5555555555555555555555555555555555
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "what's people say",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //00000

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                    "images/photo_2024-04-04_12-19-27.jpg"),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ahmed alraey",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.grade,
                                        size: 20,
                                        color: Color.fromARGB(255, 24, 42, 238),
                                      ),
                                      Icon(
                                        Icons.grade,
                                        size: 20,
                                        color: Color.fromARGB(255, 24, 42, 238),
                                      ),
                                      Icon(
                                        Icons.grade,
                                        size: 20,
                                        color: Color.fromARGB(255, 24, 42, 238),
                                      ),
                                      Icon(
                                        Icons.grade,
                                        size: 20,
                                        color: Color.fromARGB(255, 24, 42, 238),
                                      ),
                                      Icon(
                                        Icons.grade,
                                        size: 20,
                                        color: Color.fromARGB(255, 24, 42, 238),
                                      ),
                                      Text(" 1month ago",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  253, 172, 172, 172)))
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          RichText(
                              text: const TextSpan(
                                  text:
                                      "Love the food and atmosphere here.very cozy",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(248, 188, 186, 185))))
                        ],
                      ),
                      //66666666666666666666666666666666666666666
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Workplace Available\n',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'For 26 June',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(253, 172, 172, 172))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //000000000000000
                      Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 200,
                                child: Image.asset(
                                  "images/photo_2024-04-04_12-18-30.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
//000000
                              RichText(
                                text: const TextSpan(
                                  text: 'Single space\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(253, 172, 172, 172),
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: '\$4/hour',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ]),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 200,
                                child: Image.asset(
                                  "images/photo_2024-04-04_12-19-27.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
//000000
                              RichText(
                                text: const TextSpan(
                                  text: 'Single space\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(253, 172, 172, 172),
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: '\$4/hour',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ]),
                      ]),
                      //7777777777777777777777777777777777
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 17, 33, 255),
                            //  borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Center(
                            child: Text(
                              "Booking now",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      //123456789***************************************************************
                    ])),
          )
        ],
      ),
    );
  }
}

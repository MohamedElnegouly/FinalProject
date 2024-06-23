import 'package:flutter/material.dart';
import 'package:graduationproject/core/assets/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkSpaceAvailable extends StatefulWidget {
  const WorkSpaceAvailable({super.key});

  @override
  State<WorkSpaceAvailable> createState() => _WorkSpaceAvailableState();
}

class _WorkSpaceAvailableState extends State<WorkSpaceAvailable> {
  List placesImages = [
    "https://cdn-images.wework.com/images/AED3BBCA-1127-11EA-8122-0A5BC5747799/aed3bbca-1127-11ea-8122-0a5bc5747799_1.jpg?width=540",
    "https://webunwto.s3.eu-west-1.amazonaws.com/2020-07/wtd-old-event.jpg",
    "https://img.freepik.com/premium-photo/workspace-mockup-hd-8k-wallpaper-stock-photographic-image_915071-31713.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxKZOrkWVB-VJAiMObFdz-gw9VP4QQL2mtL_8IldWYwZPnsXKjdIroxojdJEPHTkveI-A&usqp=CAU",
    "https://www.shutterstock.com/image-photo/modern-office-space-tables-chairs-260nw-763511701.jpg",
  ];
  List namesList = [
    "Cardenas Inc",
    "Adams Smith",
    "Russell Canyon",
    "Scott Zhang",
    "Dickson",
  ];
  List hoursList = [
    "19",
    "17",
    "8",
    "15",
    "12",
  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(
            height: 130,
            child:
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: placesImages.length,
                itemBuilder: (context, index) {
                  return availableItem(index: index);
                  // WorkSpaceAvailable();
                }),
          ),
    ]);

  }
  Widget availableItem({required int index}) {
    return Column(children: [
      CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      foregroundImage: NetworkImage(placesImages[index]),
    ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            text: '${namesList[index]}\n',
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(253, 172, 172, 172),
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: '\$${hoursList[index]}',
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
    ],);
  }
}

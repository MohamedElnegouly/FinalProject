import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets/app_assets.dart';
import '../../../widget/booking_button.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../../widget/rich_text_widget.dart';
import '../view/details_review.dart';
import '../view/text_sliver_bar.dart';
import '../view/workspace_available.dart';
import 'model.dart';

class Testoooo extends StatefulWidget {
  Testoooo({this.model,required this.id, super.key});
  WorkspaceDetaislModel? model;
  String? id;
  @override
  State<Testoooo> createState() => _TestooooState();
}

class _TestooooState extends State<Testoooo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1500,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            leadingWidth: 0,
            toolbarHeight: 90,
            backgroundColor: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
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
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SizedBox()),
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: widget.model!.cover == null
                  ? Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                  ),
                ),
              )
                  : CachedNetworkImage(
                imageUrl: widget.model!.cover!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child:
          Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white),
          height: 1800,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          RichText(
          text: TextSpan(children: [
          WidgetSpan(
          child: Icon(
          Icons.location_on_outlined,
          size: 20,
          color: Color.fromARGB(253, 172, 172, 172),
          ),
          alignment: PlaceholderAlignment.middle),
    TextSpan(
    text: widget.model!.address,
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey
    )),
    ])),
    Text(widget.model!.name!,
    style: Theme.of(context).textTheme.titleLarge),
    StarRatingBar(size: 20,),
    SizedBox(
    height: 15.sp,
    ),
    ]),
    SliverBarText(),
    SizedBox(
    height: 100,
    child:
    ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
    return Padding(
    padding: EdgeInsets.only(left: 10.sp,top: 10.sp),
    child:
    Container(
    height: 50.sp,
    width: 40.sp,
    child: Image.asset(
    AppAssets.imageTest1,
    fit: BoxFit.fill,
    ),
    ),
    );
    }),
    ),

    SizedBox(
    height: 20,
    ),
    DetailsScreenReview(),
    SizedBox(
    height: 25.sp,
    ),
    AppRichText(text2:'Workplace Available\n',text3: 'For 26 June',),
    SizedBox(
    height: 10,
    ),
    SizedBox(
    height: 200,
    child:
    ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
    return
    WorkSpaceAvailable();
    }),
    ),
    SizedBox(
    width: double.infinity,
    height: 30.sp,
    child: BookingButton()
    ),
    ]))
              // Padding(
              //     padding: const EdgeInsets.only(bottom: 8),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.all(15),
              //             child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     widget.model!.name!,
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 20),
              //                   ),
              //                   Row(children: [
              //                     Icon(Icons.location_on_outlined),
              //                     Text(
              //                       widget.model!.address!,
              //                       style: TextStyle(color: Colors.black87),
              //                     )
              //                   ]),
              //                   Padding(
              //                     padding: EdgeInsets.only(top: 25),
              //                     child: RichText(
              //                       text: TextSpan(
              //                         text: '\$17 ',
              //                         style: TextStyle(
              //                             color: Colors.black,
              //                             fontWeight: FontWeight.w900,
              //                             fontSize: 15),
              //                         children: [
              //                           TextSpan(
              //                             text: '/Hour',
              //                             style: TextStyle(
              //                                 fontSize: 13,
              //                                 fontWeight: FontWeight.normal),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   )
              //                 ]),
              //           ),
              //         ]))
            ),
        ]));
  }
}

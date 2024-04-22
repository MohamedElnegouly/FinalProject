import 'package:flutter/material.dart';
import 'package:graduationproject/core/assets/app_assets.dart';
import 'package:graduationproject/view/workspac_details/view/workspace_available.dart';
import 'package:graduationproject/widget/app_text.dart';
import 'package:graduationproject/widget/booking_button.dart';
import 'package:graduationproject/widget/rich_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants.dart';
import '../../../widget/rating_bar_widget.dart';

class DetailsScreenBody extends StatefulWidget {
  const DetailsScreenBody({super.key});
  @override
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}
class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        height: 1000,
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
                              text: "widget.workspaceDetails.address",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              )),
                        ])),
                    Text("widget.workspaceDetails.name!",
                        style: Theme.of(context).textTheme.titleLarge),
                    StarRatingBar(),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ]),
              Text("About",style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(
                height: 5.sp,
              ),
             Text("Welcome to our vibrant and inspiring workspace designed to foster productivity and collaboration in a dynamic environment",
             style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(
                height: 20.sp,
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
                    AppRichText(
                        text1: 'open hour\n',
                      text2: '08:00',
                      text3: ' - 22:00',),

                    const SizedBox(
                      width: 22,
                    ),
                    AppRichText(text1: 'Minimum booking\n', text2: '3 Hours'),

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
              Text(
                  "what's people say",
                  style: Theme.of(context).textTheme.titleMedium
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
                            AppAssets.imageTest2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Rahma Ahmed\n',
                            style: Theme.of(context).textTheme.titleSmall,
                            children: [
                              WidgetSpan(child:
                              StarRatingBar(),),
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
                    style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
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
            ]));
  }
}

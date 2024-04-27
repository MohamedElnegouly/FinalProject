import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/workspac_details/view/details_review.dart';
import 'package:graduationproject/view/workspac_details/view/sliver_bar_details.dart';
import 'package:graduationproject/view/workspac_details/view/text_sliver_bar.dart';
import 'package:graduationproject/view/workspac_details/view/workspace_available.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets/app_assets.dart';
import '../../../widget/booking_button.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../../widget/rich_text_widget.dart';
import '../manager/workspace_details_cubit.dart';

class ViewWorkspaceDetails extends StatefulWidget {
   ViewWorkspaceDetails({
    super.key,
     //this.workspaceDetails,
    required this.id
  });
  // WorkspaceDetaislModel? workspaceDetails;
  final String id;

  @override
  State<ViewWorkspaceDetails> createState() => _ViewWorkspaceDetailsState();
}

class _ViewWorkspaceDetailsState extends State<ViewWorkspaceDetails> {

  final cubit = WorkspaceDetailsCubit();
   int index = 0;
  @override
  void initState() {
    super.initState();
    cubit.getWorkspacesDetails(id: '6622c211e5b1d7c1f63d21f0');
  }
  @override
  Widget build(BuildContext context) {
    final cubit = WorkspaceDetailsCubit();
    return Scaffold(
      body:
    //   MultiBlocProvider(
    //     providers: [
    //     BlocProvider(create: (context) => WorkspaceDetailsCubit()..getWorkspacesDetails(id: '6622c211e5b1d7c1f63d21f0'))
    // ],
    // child: BlocBuilder<WorkspaceDetailsCubit, WorkspaceDetailsState>(builder: (context, state) {
    // return
      CustomScrollView(
        slivers: [
         SliverBarDetailsScreen(),
          SliverToBoxAdapter(
            child:
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
                                      text: cubit.workspaceDetails[index].address,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey
                                      )),
                                ])),
                            Text(cubit.workspaceDetails[index].name!,
                                style: Theme.of(context).textTheme.titleLarge),
                            StarRatingBar(),
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
          ),
        ],
    //   );
    //
    // })
       )
    );
  }
}
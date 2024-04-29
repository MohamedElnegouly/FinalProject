import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/assets/app_assets.dart';
import 'details_review.dart';
import 'text_sliver_bar.dart';
import 'workspace_available.dart';
import '../../../widget/booking_button.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../../widget/rich_text_widget.dart';

class Details extends StatefulWidget {
  static String id = 'Details view';

  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    WorkspaceModel model =
    ModalRoute.of(context)!.settings.arguments as WorkspaceModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
          leading: const SizedBox(),
      leadingWidth: 0,
      toolbarHeight: 90,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.5),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(Icons.arrow_back_ios,),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
      bottom:
      PreferredSize(
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
        background:
        model.cover == null
            ? Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 50.sp,
            ),
          ),
        )
            : Hero(
          tag: model.cover!,
          child: CachedNetworkImage(
            imageUrl: model.cover!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
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
                                        text: model.address,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey
                                        )),
                                  ])),
                              Text(model.name!,
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
                            height: 40.sp,
                            child: BookingButton()
                        ),
                      ]))
          ),
        ],
      )
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/constants/colors.dart';
import 'package:graduationproject/view/workspac_details/view/facilities_images.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:graduationproject/widget/app_button.dart';
import 'package:lottie/lottie.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/assets/app_assets.dart';
import '../../../widget/favorite_button.dart';
import '../../reservations/manager/reservation_cubit.dart';
import 'details_review.dart';
import 'text_sliver_bar.dart';
import 'workspace_available.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../../widget/rich_text_widget.dart';

class Details extends StatefulWidget {
  static String id = 'Details view';

  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}
List placesImages = [
  "https://ec.europa.eu/eurostat/documents/747990/17157919/Davide_Angelini_AdobeStock_437556662_RV.jpg/ecb23e13-0be4-354d-f4a8-25c0ff17d413?t=1689325477418",
  "https://webunwto.s3.eu-west-1.amazonaws.com/2020-07/wtd-old-event.jpg",
  "https://www.un.org/sites/un2.un.org/files/2020/09/sustainable_tourism.jpg",
  "https://images.pexels.com/photos/572056/pexels-photo-572056.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/572056/pexels-photo-572056.jpeg?auto=compress&cs=tinysrgb&w=600",
];
class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ReservationCubit>(context);
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
            child: FavoriteButton(product: model)
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

                           Facilites(),

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
                        WorkSpaceAvailable(),
                        Center(
                          child: ElevatedButton(onPressed:() async {
    DateTime? dateTime = await showOmniDateTimePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate:
    DateTime(1600).subtract(const Duration(days: 3652)),
    lastDate: DateTime.now().add(
    const Duration(days: 3652),
    ),
    is24HourMode: false,
    isShowSeconds: false,
    minutesInterval: 1,
    secondsInterval: 1,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    constraints: const BoxConstraints(
    maxWidth: 350,
    maxHeight: 650,
    ),
    transitionBuilder: (context, anim1, anim2, child) {
    return FadeTransition(
    opacity: anim1.drive(
    Tween(
    begin: 0,
    end: 1,
    ),
    ),
    child: child,
    );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    );
    print("id:${model.id}\n date: ${dateTime} ");
    cubit.AddToReservation(id: model.id!, date: "${dateTime}");
    },
                              child: Text("Booking Now",style: TextStyle(color: mainColor),)),
                        ),
                        SizedBox(height: 10,),
                        AppButton(title: "Confirm",
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:
                                Lottie.asset("assets/animations/success.json"),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.white,
                                  duration: Duration(seconds: 1),
                                ));
                          },),

                       ] )

    ))

        ],
      )
    );
  }
}

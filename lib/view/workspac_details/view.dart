import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/view/custom_details/workspace_details_cubit.dart';
import 'package:graduationproject/view/workspac_details/workspace_detail_model.dart';
import 'package:graduationproject/view/workspace/workspace_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants.dart';
import '../home/home_cubit.dart';

class WorkSpaceDetailsScreen extends StatefulWidget {
   WorkSpaceDetailsScreen({
    super.key,
    required this.workspaceDetails,
     required this.id
  });
   WorkspaceModel workspaceDetails;
   int id;

   @override
  State<WorkSpaceDetailsScreen> createState() => _WorkSpaceDetailsScreenState();
}

class _WorkSpaceDetailsScreenState extends State<WorkSpaceDetailsScreen> {
  double dimension = 40;
  DateTime selectedDate = DateTime.now();
  late Timer timer;

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(
  //     const Duration(milliseconds: 1000),
  //         (timer) {
  //       setState(() {
  //         dimension = dimension == 40 ? 50 : 40;
  //       });
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   timer.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkspaceDetailsCubit>(context);
    return
      MultiBlocProvider(
          providers: [
            //BlocProvider(create: (context) => HomeCubit()..getWorkspacesDetails(id: widget.workspaceDetails.id!))
          ],
          child: BlocBuilder<WorkspaceDetailsCubit, WorkspaceDetailsState>(builder: (context, state) {
    return Scaffold(
    body: CustomScrollView(
    slivers: [
    SliverAppBar(
    leading: const SizedBox(),
    leadingWidth: 0,
    toolbarHeight: 90,
    backgroundColor: Colors.blue,
    title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    CircleAvatar(
    backgroundColor: Colors.grey.withOpacity(0.5),
    child: IconButton(
    onPressed: () {
    Navigator.pop(context);
    },
    icon: Padding(
    padding: const EdgeInsets.only(left: 5),
    child: const Icon(Icons.arrow_back_ios,color: mainColor,),
    ),
    ),
    ),
    AnimatedContainer(
    duration: const Duration(milliseconds: 1000),
    width: dimension,
    height: dimension,
    child: CircleAvatar(
    backgroundColor: Colors.grey.withOpacity(0.5),
    child: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.favorite_border,color: mainColor,),
    ),
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
    widget.workspaceDetails.cover == null
        ? nullImage
        : CachedNetworkImage(
    imageUrl: widget.workspaceDetails.cover!,
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
    text: widget.workspaceDetails.address,
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey
    )),
    ])),
    Text(widget.workspaceDetails.name!,
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
    text: TextSpan(
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
    "images/photo_2024-04-04_12-19-27.jpg"),
    ),

    Padding(
    padding: EdgeInsets.only(left: 10),
    child: RichText(
    text: TextSpan(
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
    ),
    ],
    ),
    );
    })
    );
  }
}
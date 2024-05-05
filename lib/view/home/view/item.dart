import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/rating_bar_widget.dart';

class PopularItem extends StatelessWidget {
   PopularItem({super.key,
    required this.imageUrl,
    required this.name,
    required this.hours,
  required this.address
  });
  String imageUrl;
  String name;
  String address;
  String hours;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    // print('taped');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context)=> DetailView() ,));
                  },
                  child:
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 50.sp,
                        height: 50.sp,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        height: 40,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border,
                            size: 27,),
                          color: mainColor,
                          onPressed: () {
                            //Navigator.push(context, route),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(address,
                                style: TextStyle(color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                                    ? Colors.white
                                    : Colors.black87
                                ),
                              )
                            ]),
                        StarRatingBar(size: 15),
                        Padding(
                          padding: EdgeInsets.only(top: 25.sp),
                          child:
                          RichText(
                            text: TextSpan(
                              text: '\$${hours} ',
                              style: TextStyle(
                                  color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15),
                              children: [
                                TextSpan(
                                  text: '/Hour',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                )
              ])

    );
  }
}

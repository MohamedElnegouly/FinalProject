import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/constants/constants.dart';
import 'package:graduationproject/widget/rating_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../core/shared/shared_preferences.dart';

class SearchCategory extends StatelessWidget {
  const SearchCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(10.sp),
        child: Container(
          decoration: BoxDecoration(
              color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.black38
                  : Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Stack(
                    alignment: Alignment.topRight,
                    children:[
                      SizedBox(
                        width: double.infinity,
                        height: 170,
                        child:
                        CachedNetworkImage(
                          imageUrl: 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child:
                          InkWell(
                              onTap: (){
                              },
                              child: Icon(Icons.favorite_border,color: mainColor,)
                          ),
                        ),
                      ),
                    ]
                ),

              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                    "title",
                    style: Theme.of(context).textTheme.titleMedium
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                        "address",
                        style: Theme.of(context).textTheme.titleSmall

                    ),
                  ],
                ),
              ),
              StarRatingBar(size: 15),

              Padding(
                padding: EdgeInsets.only(left: 15,bottom: 15),
          child: RichText(
                    text: TextSpan(
                      text: '\$20 ',
                      style: TextStyle(
                          color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                              ? Colors.white
                              : Colors.black54,
                          fontWeight: FontWeight.w900, fontSize: 15),
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
            ],
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../constants.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15,bottom: 15,top: 10),
        child: RatingBar.builder(
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
        ),
      );
  }
}


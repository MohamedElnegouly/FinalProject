import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/constants.dart';

class StarRatingBar extends StatelessWidget {
  const StarRatingBar({super.key, this.itemCount, required this.size});
  final int? itemCount;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RatingBar.builder(
        initialRating: 5,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: itemCount ?? 5,
        itemSize: size,
        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../../../widget/rating_bar_widget.dart';

class DetailsScreenReview extends StatelessWidget {
  const DetailsScreenReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                      StarRatingBar(size: 20,),),
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
    ],);
  }
}

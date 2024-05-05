import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/rich_text_widget.dart';

class SliverBarText extends StatelessWidget {
  const SliverBarText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    ],);
  }
}

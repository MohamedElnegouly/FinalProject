import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({super.key,
    this.text1,
    this.text2,
    this.text3
  });
  final String? text1;
  final String? text2;
  final String? text3;


  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        text: text1,
        style:Theme.of(context).textTheme.titleSmall,

      children: [
          TextSpan(
            text: text2,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text3,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

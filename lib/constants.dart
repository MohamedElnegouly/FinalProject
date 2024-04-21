import 'package:flutter/material.dart';

String? token;

const nullImage = const Padding(
  padding: EdgeInsets.only(top: 20),
  child: Center(
    child: Icon(
      Icons.image_not_supported_outlined,
      size: 70,
    ),
  ),
);

const Color mainColor = Color(0XFF0D9276);
const Color primaryAppColor = Color(0XFFFDFDFF);
Color grey = Colors.grey.shade200;
const white = Color(0xffFFFFFF);
const success = Color(0xff2AA952);
const error = Color(0xffF01F0E);

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


final GlobalKey<ScaffoldMessengerState> scaffoldKey =
GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

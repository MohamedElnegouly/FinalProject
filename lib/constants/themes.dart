import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle:
        TextStyle(color: Colors.black87, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.black87)),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        titleSmall: TextStyle(
          color: Colors.black87.withOpacity(0.8),
          fontSize: 15,
        ),
        titleMedium: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.bold)),
    iconTheme: IconThemeData(color: mainColor));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        color: Colors.black54,
        titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
        iconTheme: IconThemeData(color: Colors.white)
    ),
    scaffoldBackgroundColor: Colors.black54,
    textTheme: TextTheme(
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
        )
    ),
    iconTheme: IconThemeData(color: Color(0XFF95d5b2))
);
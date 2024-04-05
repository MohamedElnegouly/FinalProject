import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/screens/nav_bar_screens/home_screen.dart';
import 'package:graduationproject/screens/nav_bar_screens/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List screens = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    ProfileScreen(),
  ];

  final items = <Widget> [
    Icon(Icons.apps,),
    Icon(Icons.search_rounded,),
    Icon(Icons.favorite_border,),
    Icon(Icons.perm_identity)
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: Scaffold(
          bottomNavigationBar: Theme(
            data:Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white,)
            ) ,
            child: CurvedNavigationBar(
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              color: mainColor,
              backgroundColor:
              Colors.transparent,
              height: 60,
              index: currentIndex,
              items: items,
              onTap: (value){
                currentIndex = value;
                setState(() {
                });
              },
            ),
          ) ,
          body: screens[currentIndex],
        ),
      ),
    );
  }

}

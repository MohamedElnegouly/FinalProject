import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/home/view/view.dart';
import '../../constants.dart';
import '../favorite/favorite_view.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});
  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List screens = [
    HomeView(),
    SearchScreen(),
    FavoriteScreen(),
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
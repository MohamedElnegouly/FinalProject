import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/favorite/view/fav_view.dart';
import 'package:graduationproject/view/home/view/view.dart';
import 'package:graduationproject/view/search/view/search_view.dart';
import '../../core/constants/colors.dart';
import '../../core/shared/shared_preferences.dart';
import '../profile/view/profile_screen.dart';

class NavBarView extends StatefulWidget {
  static String id = 'NavBar view';

  const NavBarView({super.key});
  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  List screens = [
    HomeView(),
    SearchView(),
    FavoriteView(),
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
              color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.white24
                  : mainColor,
              backgroundColor:
              PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.black87
                  : Colors.white,
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
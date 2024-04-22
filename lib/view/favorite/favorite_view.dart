
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/constants.dart';

import '../../core/shared_preferences.dart';
import 'favorite_body.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title:  Text("Favorite"),
      ),
      body:
      ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          print(index);
          return BodyOfFavoriteScreen();
        },
      ),
    );
  }
}
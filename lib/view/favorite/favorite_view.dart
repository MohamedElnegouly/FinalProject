
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/constants/constants.dart';

import '../../core/shared/shared_preferences.dart';
import '../../generated/l10n.dart';
import 'favorite_body.dart';

class FavoriteScreen extends StatefulWidget {
  static String id = 'Favorite view';

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
        title:  Center(child: Text(S().favorite)),
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
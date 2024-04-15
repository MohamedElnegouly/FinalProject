
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/colors/colors.dart';

import 'models/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  double rating = 3.5;

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

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
          return buildNoteItem(index);
        },
      ),
    );
  }

  Widget buildNoteItem(int index) {
    return
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],

              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Stack(
                    alignment: Alignment.topRight,
                    children:[
                      SizedBox(
                        width: double.infinity,
                        height: 170,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network('https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
                              fit: BoxFit.fill,)),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child:
                          InkWell(
                              onTap: (){
                              },
                              child: Icon(Icons.favorite,color: Colors.red,)
                          ),
                        ),
                      ),
                    ]
                ),

              ),


              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "title",
                    style: Theme.of(context).textTheme.titleMedium

                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "address",
                        style: Theme.of(context).textTheme.titleSmall

                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,bottom: 15,top: 10),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: mainColor,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),

            ],
          ),
        ),
      );
  }

  void isLoggedIn() async {
    final loggedIn = PreferenceUtils.getBool(PreferenceKey.loggedIn);
    print('LoggedIn => $loggedIn');
  }

  void saveLogout() async {
    PreferenceUtils.setBool(PreferenceKey.loggedIn, false);
  }
}
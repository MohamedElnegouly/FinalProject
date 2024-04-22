
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/widget/rating_bar_widget.dart';
import '../../constants.dart';

class BodyOfFavoriteScreen extends StatelessWidget {
  const BodyOfFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            child: Image.network('https://thumbs.dreamstime.com/b/green-landscape-13598486.jpg',
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
              StarRatingBar(),
            ],
          ),
        ),
      );
  }
}

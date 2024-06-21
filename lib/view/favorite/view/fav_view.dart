import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/favorite/manager/favorite_cubit.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/rating_bar_widget.dart';


class FavoriteView extends StatefulWidget {
  static String id = 'SearchView view';

  FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _SearchViewState();
}

class _SearchViewState extends State<FavoriteView> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavoriteCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("favorite"),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: ListView(
            shrinkWrap: true,
            children:
            [
              const SizedBox(height: 15,),
              BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    return state is FavoriteLoading
                        ? const Center(child: CupertinoActivityIndicator(),)
                        :
                    ListView.builder(
                        itemCount: cubit.favorites.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                                      ? Colors.black38
                                      : Colors.white,
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
                                                child: Image.network('https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg',
                                                  fit: BoxFit.fill,)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child:
                                            GestureDetector(
                                              onTap: () {
                                                print('product id : ${cubit.favorites[index].id}');
                                                cubit.favoritsID.contains(cubit.favorites[index].id) ? cubit.RemoveFromFavorite(id: cubit.favorites[index].id.toString())
                                              : cubit.AddToFavorite(id: cubit.favorites[index].id.toString());
                                                },
                                              child: Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(18),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.black12, offset: Offset(0, 4), blurRadius: 4)
                                                    ]),
                                                child: Icon(
                                                  cubit.favoritsID.contains(cubit.favorites[index].id)
                                                      ? Icons.favorite_rounded
                                                      : Icons.favorite_outline_rounded,
                                                  color:
                                                  cubit.favoritsID.contains(cubit.favorites[index].id) ?  Colors.red :
                                                  Colors.grey,
                                                  size: 16,
                                                ),
                                              ),
                                            )
                                          ),
                                        ]
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      cubit.favorites[index].name!,
                                        style: Theme.of(context).textTheme.titleMedium
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        Text(
                                            cubit.favorites[index].address!,
                                            style: Theme.of(context).textTheme.titleSmall
                                        ),
                                      ],
                                    ),
                                  ),
                                  StarRatingBar(size: 15,),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  })
            ],
          ),
        )
    );
    //     }
    // );
  }
}

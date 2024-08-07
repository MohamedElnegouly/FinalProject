import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:graduationproject/view/workspace/view/workspace_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../workspac_details/view/details_view.dart';
import '../manager/search_cubit.dart';

class SearchView extends StatefulWidget {
  static String id = 'SearchView view';

  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  List<String> hourSearchList = [
    "19", "17", "8", "15", "12", "7", "14", "6", "19", "17", "8", "15", "12", "7", "14", "6",
    "11", "9", "17", "12", "5", "13", "18","14","17","5"];

  List<int> rateSearch = [
    5, 4, 3, 2, 5, 3, 4, 5,5, 3, 4, 2, 5, 3, 4, 5,
    5, 3, 4, 2, 5, 3, 4,5,3,5];
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          title: TextFormField(
            onChanged:(input)
            {
              cubit.filterProducts(input: input);
            } ,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search...",
              filled: true,
              fillColor: Colors.black12.withOpacity(0.1),
              contentPadding: EdgeInsets.symmetric(vertical: 17),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
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
                    return state is SearchLoading
                        ? const Center(child: CupertinoActivityIndicator(),)
                        :
                    ListView.builder(
                        itemCount: cubit.filteredProducts.isEmpty ?
                        cubit.products.length :
                        cubit.filteredProducts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Details.id,
                                arguments: cubit.products[index],
                              );
                            },
                            child: _productItem(
                                model: cubit.filteredProducts.isEmpty ?
                                cubit.products[index] :
                                cubit.filteredProducts[index],
                                cubit: cubit,
                                hours: hourSearchList[index],
                                rate: rateSearch[index]
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

Widget _productItem({required WorkspaceModel model,required SearchCubit cubit,required String hours,required int rate}){
  return Padding(
    padding: EdgeInsets.all(2.sp),
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
                    child:
                    model.cover == null
                        ? Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40.sp,
                        ),
                      ),
                    )
                        :
                    Hero(
                      tag: model.cover!,
                      child: CachedNetworkImage(
                        imageUrl: model.cover!,
                        width: 50.sp,
                        height: 50.sp,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),

                ]
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              model.name!,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(
                  model.address!,
                ),
              ],
            ),
          ),
          StarRatingBar(size: 15,itemCount: rate,),

          Padding(
            padding: EdgeInsets.only(left: 15,bottom: 15),
            child: RichText(
              text: TextSpan(
                text: '\$${hours}',
                style: TextStyle(
                    color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : Colors.black54,
                    fontWeight: FontWeight.w900, fontSize: 15),
                children: [
                  TextSpan(
                    text: '/Hour',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
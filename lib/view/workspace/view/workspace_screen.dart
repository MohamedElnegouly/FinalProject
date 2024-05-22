import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/workspac_details/view/details_view.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:http/http.dart'as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/rating_bar_widget.dart';
import '../manager/workspace_cubit.dart';
class WorkScreen extends StatefulWidget {
  static String id = 'WorkScreen view';

  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {

  // List<WorkspaceModel> items = [];
  // int skip = 0;
  // int limit = 17;
  // bool isLoadMore = false;
  // ScrollController scrollController =ScrollController();
  //
  // fetchData() async {
  //   var url = Uri.parse(
  //       "https://desk-share-api.onrender.com/workspaces?limit=$limit&skip=$skip");
  //   var response = await http.get(url,
  //       headers:
  //       {
  //         'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NGIwZWNkODg4NjYyNDExNGVkMzE5MSIsImlhdCI6MTcxNjE5NTAyNn0.9IBB_DfQxtbb0M8c_ZHxVzZ4mAEFXkSvaBZbYJkSD0U',
  //         'x-api-key': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
  //       }
  //   );
  //   if (response.statusCode == 200) {
  //
  //     var responseBody = jsonDecode(response.body);
  //     print('workspacedata is : ${responseBody}');
  //
  //     if (response.statusCode == 200) {
  //       for (int i = 0; i < responseBody['limit']; i++) {
  //         items.add(
  //             WorkspaceModel.fromJson(data: responseBody['workspaces'][i])
  //         );
  //       }
  //       print('length: ${items.length}');
  //     }
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  //   scrollController.addListener(() async {
  //     if(isLoadMore) return;
  //     if(scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent
  //     ){
  //       if (!mounted) return;
  //       setState(() {
  //      isLoadMore = true;
  //    });
  //    skip= skip+limit;
  //    await fetchData();
  //       if (!mounted) return;
  //       setState(() {
  //      isLoadMore=false;
  //    });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkspaceCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text("All Workspaes",
        style: TextStyle(
            fontWeight: FontWeight.bold),),),
        body:
    BlocBuilder(
    bloc: cubit,
    builder: (context, state) {
      return state is WorkspaceDetailsLoading
          ? const Center(child: CupertinoActivityIndicator(),)
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: PageScrollPhysics(),
           // controller: scrollController,
            itemCount:
            // isLoadMore
            //     ? items.length + 1
            //     :items.length,
            cubit.workspaceList.length,
            itemBuilder: (context, index) {
              // if (index >= cubit.workspaceList.length) {
              //   return Center(child: CircularProgressIndicator(),);
              // }
              // else {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Details.id,
                                arguments: cubit.workspaceList[index],
                              );
                            },
                            child:
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                cubit.workspaceList[index].cover == null
                                    ? Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 50.sp,
                                    ),
                                  ),
                                )
                                    : Hero(
                                  tag: cubit.workspaceList[index].cover!,
                                  child: CachedNetworkImage(
                                    imageUrl: cubit.workspaceList[index].cover!,
                                    width: 50.sp,
                                    height: 50.sp,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  height: 40,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite_border,
                                      size: 27,),
                                    color: mainColor,
                                    onPressed: () {
                                      //Navigator.push(context, route),
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.workspaceList[index].name!.length > 10
                                        ? cubit.workspaceList[index].name!.substring(0, 10) +
                                        '...'
                                        : cubit.workspaceList[index].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text(
                                          cubit.workspaceList[index].address!.length > 15
                                              ? cubit.workspaceList[index].address!.substring(
                                              0, 20) + '...'
                                              : cubit.workspaceList[index].address!,
                                          style: TextStyle(
                                              color: PreferenceUtils.getBool(
                                                  PreferenceKey.darkTheme)
                                                  ? Colors.white
                                                  : Colors.black87
                                          ),
                                        )
                                      ]),
                                  StarRatingBar(size: 15),
                                  Padding(
                                    padding: EdgeInsets.only(top: 25.sp),
                                    child:
                                    RichText(
                                      text: TextSpan(
                                        text: '\$17 ',
                                        style: TextStyle(
                                            color: PreferenceUtils.getBool(
                                                PreferenceKey.darkTheme)
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15),
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
                                ]),
                          )
                        ])
                );
            //  }
            }),
      );
    } )
    );
    }
  }

import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/workspac_details/view/details_view.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:http/http.dart'as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/rating_bar_widget.dart';
class WorkScreen extends StatefulWidget {
  static String id = 'WorkScreen view';

  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
 // List items = [];
  List<WorkspaceModel> items = [];
  int skip = 0;
  int limit = 7;
  bool isLoadMore = false;
  ScrollController scrollController =ScrollController();

  fetchData() async {
    var url = Uri.parse(
        "https://desk-share-api.onrender.com/workspaces?limit=$limit&skip=$skip");
    var response = await http.get(url,
        headers:
        {
          'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk5NjkwNywiZXhwIjoxNzE0NjAxNzA3fQ.ofv2qR5qa6du1so1wQ6RUc75JMWWg6LqBW37dCzbguo',
          'x-api-key': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    if (response.statusCode == 200) {
      // var json = jsonDecode(response.body)['workspaces'] as List;
      // if (!mounted) return;
      // setState(() {
      //   items.addAll(json);
      // });
      // print('workspacedata is : ${response.body}');
      var responseBody = jsonDecode(response.body);
      print('workspacedata is : ${responseBody}');

      if (response.statusCode == 200) {
        for (int i = 0; i < responseBody['limit']; i++) {
          items.add(
              WorkspaceModel.fromJson(data: responseBody['workspaces'][i])
          );
        }
        print('length: ${items.length}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    scrollController.addListener(() async {
      if(isLoadMore) return;
      if(scrollController.position.pixels ==
          scrollController.position.maxScrollExtent
      ){
        if (!mounted) return;
        setState(() {
       isLoadMore = true;
     });
     skip= skip+limit;
     await fetchData();
        if (!mounted) return;
        setState(() {
       isLoadMore=false;
     });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Workspaes",
        style: TextStyle(
            fontWeight: FontWeight.bold),),),
        body:
        items.isEmpty
        ? Center(child: const CupertinoActivityIndicator())
     : Padding(
       padding: const EdgeInsets.all(8.0),
       child: ListView.builder(
            shrinkWrap: true,
        physics: PageScrollPhysics(),
        controller: scrollController,
          itemCount:
          isLoadMore
              ? items.length +1
          : items.length,
            itemBuilder: (context,index) {
              if (index >= items.length) {
                return Center(child: CircularProgressIndicator(),);
              }
              else {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                           Navigator.pushNamed(context, Details.id,
                           arguments: items[index],
                            );
                                },
                            child:
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                items[index].cover == null
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
                                    tag: items[index].cover!,
                                  child: CachedNetworkImage(
                                  imageUrl: items[index].cover!,
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
                                    items[index].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text(items[index].address!,
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
              }
            }),
     )

    );
    }
  }

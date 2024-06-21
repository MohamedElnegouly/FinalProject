import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/home/view/body_home.dart';
import 'package:graduationproject/view/workspac_details/view/details_view.dart';
import 'package:graduationproject/widget/app_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../widget/favorite_button.dart';
import '../../../widget/rating_bar_widget.dart';
import '../../workspace/manager/workspace_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WorkspaceCubit>(context);
    return Scaffold(
              body:
                Padding(
                padding:EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp),
            child:
                  ListView(
                      shrinkWrap: true,
                      physics: PageScrollPhysics(),
                      children: [
                        BodyHomeScreen(),
                        BlocBuilder(
                            bloc: cubit,
                            builder: (context, state) {
                              return
                                //state is WorkspaceDetailsLoading
                                cubit.workspaceList.isEmpty
                                  ? CupertinoActivityIndicator()
                                  : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: PageScrollPhysics(),
                                    itemCount: 2,
                                    itemBuilder: (context, index) {
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
                                                          child:
                                                          FavoriteButton(product: cubit.workspaceList[index])
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
                            } ),
              ]),
                )
            );
          }
  }

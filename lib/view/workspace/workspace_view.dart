

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/view/workspac_details/view/view_details_screen.dart';
import 'package:graduationproject/view/workspace/manager/workspace_cubit.dart';
import 'package:graduationproject/view/workspace/workspace_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants.dart';

class CustomWorkspace extends StatelessWidget {
  CustomWorkspace({
    required this.workspace,
    super.key});
  WorkspaceModel workspace;
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WorkspaceCubit())
        ],
        child: BlocBuilder<WorkspaceCubit, WorkspaceState>(builder: (context, state) {
          return
            Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewDetailsWorkspace(workspaceDetails: workspaceDetails)));
                        },
                        child:
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            workspace.cover == null
                                ? Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50.sp,
                                ),
                              ),
                            )
                                : CachedNetworkImage(
                              //  imageUrl: 'https://ik.imagekit.io/co5deypud/6622c211e5b1d7c1f63d21f0/flat-lay-workstation-with-copy-space-laptop_23-2148430879_kpQsu_fHs.avif',
                              imageUrl: workspace.cover!,
                              width: 50.sp,
                              height: 50.sp,
                              fit: BoxFit.cover,
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
                                workspace.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(workspace.address!)
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.sp, bottom: 8.sp),
                                child: RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  itemSize: 15,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) =>
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25.sp),
                                child:
                                RichText(
                                  text: const TextSpan(
                                    text: '\$17 ',
                                    style: TextStyle(
                                        color: Colors.black,
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
        })
    );
  }
}

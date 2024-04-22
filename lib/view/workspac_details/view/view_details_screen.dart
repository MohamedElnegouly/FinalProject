import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/workspac_details/view/body_details_screen.dart';
import 'package:graduationproject/view/custom_details/workspace_details_cubit.dart';
import 'package:graduationproject/widget/rating_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants.dart';
import '../workspace_detail_model.dart';

class ViewDetailsWorkspace extends StatefulWidget {
  ViewDetailsWorkspace({
    required this.workspaceDetails,
    super.key});
  WorkspaceDetaislModel workspaceDetails;

  @override
  State<ViewDetailsWorkspace> createState() => _ViewDetailsWorkspaceState();
}

class _ViewDetailsWorkspaceState extends State<ViewDetailsWorkspace> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WorkspaceDetailsCubit()..getWorkspacesDetails(id: widget.workspaceDetails.id!))
        ],
        child: BlocBuilder<WorkspaceDetailsCubit, WorkspaceDetailsState>(builder: (context, state) {
          return
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const SizedBox(),
                  leadingWidth: 0,
                  toolbarHeight: 90,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: const Icon(Icons.arrow_back_ios,color: mainColor,),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border,color: mainColor,),
                        ),
                      ),
                    ],
                  ),
                  bottom:
                  PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: SizedBox()),
                  ),
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    background:
                    widget.workspaceDetails.cover == null
                        ? nullImage
                        : CachedNetworkImage(
                      imageUrl: 'https://img.freepik.com/free-photo/fresh-yellow-daisy-single-flower-close-up-beauty-generated-by-ai_188544-15543.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:
                      DetailsScreenBody(),
                ),
             ],
            );
        })
    );
  }
}

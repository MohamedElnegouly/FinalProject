import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../manager/workspace_details_cubit.dart';

class SliverBarDetailsScreen extends StatelessWidget {
  const SliverBarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // final cubit = WorkspaceDetailsCubit();
    int index = 0;

    return SliverAppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      toolbarHeight: 90,
      backgroundColor: Colors.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
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
      expandedHeight: 1000,
      pinned: true,
      // flexibleSpace: FlexibleSpaceBar(
      //   background: Hero(
      //     tag: cubit.workspaceDetails[index].id!,
      //     //widget.workspaceDetails!.id!,
      //     child: CachedNetworkImage(
      //       imageUrl: 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
      //       width: double.infinity,
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }
}

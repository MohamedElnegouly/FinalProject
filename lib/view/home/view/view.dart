import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/home/view/body_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../workspace/workspace_view.dart';
import '../manager/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return
      MultiBlocProvider(
        providers: [
    BlocProvider(create: (context) => HomeCubit()..getWorkspaces())
    ],
    child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp),
        child:
        ListView(
          children: [
           BodyHomeScreen(),
          cubit.workspaceList.isEmpty
              ? Center(child: const CupertinoActivityIndicator())
              : ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: cubit.workspaceList.length,
                      itemBuilder: (context, index) {
                        return CustomWorkspace(workspace: cubit.workspaceList[index]);
                      }),
          ],)
        ),
       );
  }
    )
    );
  }
}

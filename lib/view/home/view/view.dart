import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/view/home/view/body_home.dart';
import 'package:graduationproject/view/home/view/item.dart';
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

                        PopularItem(
                            imageUrl: 'https://www.dgicommunications.com/wp-content/uploads/2022/08/Design_a_Flexible_Workspace.jpg',
                            name: "workspace 1",
                            address: 'al nadi street'),
                        PopularItem(
                            imageUrl: 'https://cleveroffice.ie/wp-content/uploads/2020/01/CO3616-S-B.jpg',
                            name: "workspace 2",
                            address: 'tanta, hassan street'),
              ]),
                )
            );
          }
  }

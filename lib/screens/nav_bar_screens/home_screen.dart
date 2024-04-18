import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/models/custom_workspace.dart';
import 'package:graduationproject/models/workspace_model.dart';
import 'package:graduationproject/screens/sub_pages/workspace-detail.dart';
import 'package:graduationproject/services/get_all_workspaces.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp),
        child:
        ListView(
          children: [
            //1**********************************
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_on_outlined),
              ),
              RichText(
                text: const TextSpan(
                  text: 'Current location\n',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                  children: [
                    TextSpan(
                      text: 'Kuala Lumpur, Malaysia',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.notifications_none,
                size: 30,
              )
            ]),

            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  hintText: "  Where do you want yo work?",
                  hintStyle: TextStyle(height: 4,fontSize: 15)),
            ),
            Text(
              "  Only for Today",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //4************************************************************************* */

            Stack(children: [
              Image.asset(
                  "assets/images/photo_2024-04-04_12-18-30.jpg",
                  height: 55.sp,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("30% Off",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 33)),
                    Text("All Food & Beverage",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Text("By Only book for 1 hour",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              )
            ]),

            Text("Sponsored by Some random place",style: TextStyle(color: Colors.grey),),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text(
                  "Popular Workspace",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              Spacer(),
                Text("See all")
              ],
            ),
            // FutureBuilder<List<WorkspaceModel>>(
            //   future: AllWorkspacesServices().getAllWorkspaces(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       List<WorkspaceModel> workspaces = snapshot.data!;
            //       return ListView.builder(
            //           itemCount: workspaces.length,
            //           itemBuilder: (context, index) {
            //             return CustomWorkspace(workspace: workspaces[index]);
            //           });
            //     } else {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
       ),

    );
  }
}

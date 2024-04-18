import 'package:flutter/material.dart';
import 'package:graduationproject/models/custom_workspace.dart';
import 'package:graduationproject/models/workspace_model.dart';
import 'package:graduationproject/services/get_all_workspaces.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   static String id = 'HomePAge';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.co2,
//                 color: Colors.black,
//               ))
//         ],
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'New Trend',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
//         child: FutureBuilder<List<WorkspaceModel>>(
//           future: AllWorkspacesServices().getAllWorkspaces(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<WorkspaceModel> workspaces = snapshot.data!;
//               return ListView.builder(
//                   itemCount: workspaces.length,
//                   itemBuilder: (context, index) {
//                     return CustomWorkspace(workspace: workspaces[index]);
//                   });
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import '../helper/api.dart';
import '../models/workspace_model.dart';
// class AllWorkspacesServices
// {
//   Future<List<WorkspaceModel>> getAllWorkspaces ({required int id}) async {
//
//     List<dynamic> data = await Api().get(url:'https://desk-share-api.onrender.com/workspaces/$id');
//
//     List<WorkspaceModel> workspaceList = [];
//     for (int i = 0; i < data.length; i++){
//       workspaceList.add(WorkspaceModel.fromJson(data[i])
//       );
//     }
//     return workspaceList;
//   }
// }
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/home/manager/home_cubit.dart';
import 'package:graduationproject/view/workspac_details/manager/workspace_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
part 'workspace_details_state.dart';
//
// class WorkspaceDetailsCubit extends Cubit<WorkspaceDetailsState> {
//   WorkspaceDetailsCubit() : super(WorkspaceDetailsInitial());
//
//   List<WorkspaceDetaislModel> workspaceDetails = [];
//   void getWorkspacesDetails({required String id}) async {
//     Response response = await http.get(Uri.parse("https://desk-share-api.onrender.com/workspaces/$id"),
//         headers:
//         {
//           'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk5NjkwNywiZXhwIjoxNzE0NjAxNzA3fQ.ofv2qR5qa6du1so1wQ6RUc75JMWWg6LqBW37dCzbguo',
//           'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
//         }
//     );
//     print(response.statusCode);
//     var responseBody = jsonDecode(response.body);
//     print('workspacedata is : ${responseBody}');
//
//     if(response.statusCode == 200)
//     {
//       //for (int i = 0; i < responseBody.length; i++){
//       workspaceDetails.add(WorkspaceDetaislModel.fromJson( responseData: responseBody)
//       );
//       // }
//       print('length: ${workspaceDetails.length}');
//       emit(GetWorkspacesDetailsSuccess());
//     }
//     else{
//       emit(FailedGetWorkspacesDetails());
//     }
//   }
//}
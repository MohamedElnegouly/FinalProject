import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../data/workspace_model.dart';

part 'workspace_state.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  WorkspaceCubit() : super(WorkspaceInitial());

  List <WorkspaceModel> workspaceList = [];
  // void getProducts() async {
  //   int limit =17;
  //   int skip = 0;
  //   var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=18&skip=0");
  //   var response = await http.get(url,
  //       headers:
  //       {
  //         'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk0Mjk5Mn0.x41tk7I0cAubXh1T2eSfSKmBbxKI4rVXhaSkurzt51s',
  //         'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
  //       }
  //   );
  //   var responseBody = jsonDecode(response.body);
  //   print('workspaceSearchdata is : ${responseBody}');
  //
  //   if(response.statusCode == 200)
  //   {
  //     for (int i = 0; i < responseBody['limit']; i++) {
  //       workspaceList.add(
  //           WorkspaceModel.fromJson(data: responseBody['workspaces'][i])
  //       );
  //     }
  //     print('length: ${workspaceList.length}');
  //     emit(GetWorkspacesSuccess());
  //   }
  //   else{
  //     emit(FailedGetWorkspaces());
  //   }
  // }

  //List<WorkspaceModel> products = [];
  void getWorkspacess() async {
    int limit =17;
    int skip = 0;
    var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=17&skip=0");
    var response = await http.get(url,
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk0Mjk5Mn0.x41tk7I0cAubXh1T2eSfSKmBbxKI4rVXhaSkurzt51s',
          'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseBody = jsonDecode(response.body);
    print('workspaceSearchdata is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for (int i = 0; i < responseBody['limit']; i++) {
        workspaceList.add(
            WorkspaceModel.fromJson(data: responseBody['workspaces'][i])
        );
      }
      print('length: ${workspaceList.length}');
      emit(GetWorkspacesSuccess());
    }
    else{
      emit(FailedGetWorkspaces());
    }
  }

}







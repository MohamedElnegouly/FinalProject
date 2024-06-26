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
  int skip = 0;
  int limit = 17;

  getWorkspacesData() async {
    var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=$limit&skip=$skip");
    var response = await http.get(url,
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk5NjkwNywiZXhwIjoxNzE0NjAxNzA3fQ.ofv2qR5qa6du1so1wQ6RUc75JMWWg6LqBW37dCzbguo',
          'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseBody = jsonDecode(response.body);
    print('workspacedata is : ${responseBody}');

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



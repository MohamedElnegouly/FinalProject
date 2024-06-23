import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:graduationproject/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../data/workspace_model.dart';

part 'workspace_state.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  WorkspaceCubit() : super(WorkspaceInitial());

  List <WorkspaceModel> workspaceList = [];
  void getWorkspacess() async {
    int limit =17;
    int skip = 0;
    var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=24&skip=2");
    var response = await http.get(url,
        headers:
        {
          'Authorization' : token,
          'x-api-key'     : apiKey,
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







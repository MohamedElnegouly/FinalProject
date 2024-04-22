import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import '../../workspace/workspace_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<WorkspaceModel> workspaceList = [];

  void getWorkspaces() async {
    Response response = await http.get(Uri.parse("https://desk-share-api.onrender.com/workspaces"),
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzM1Mjc2NCwiZXhwIjoxNzEzOTU3NTY0fQ.Tr0Xesmnr3vnsC8UI45LNFPAxfnrL8NQm-9CLg2-w74',
          'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseBody = jsonDecode(response.body);
    print('workspacedata is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for (int i = 0; i < responseBody.length; i++){
        workspaceList.add(WorkspaceModel.fromJson( data: responseBody[i])
        );
      }
      emit(GetWorkspacesSuccess())  ;
    }
    else{
      emit(FailedGetWorkspaces());
    }
  }
}

import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/workspac_details/workspace_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
part 'workspace_details_state.dart';

class WorkspaceDetailsCubit extends Cubit<WorkspaceDetailsState> {
  WorkspaceDetailsCubit() : super(WorkspaceDetailsInitial());
  List<WorkspaceDetaislModel> workspaceDetails = [];
  void getWorkspacesDetails({required int id}) async {
    Response response = await http.get(Uri.parse("https://desk-share-api.onrender.com/workspaces/$id"),
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzM1Mjc2NCwiZXhwIjoxNzEzOTU3NTY0fQ.Tr0Xesmnr3vnsC8UI45LNFPAxfnrL8NQm-9CLg2-w74',
          'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseDetailsBody = jsonDecode(response.body);
    print('workspacDetailsedata is : ${responseDetailsBody}');

    if(response.statusCode == 200)
    {
      for (int i = 0; i < responseDetailsBody.length; i++){
        workspaceDetails.add(WorkspaceDetaislModel.fromJson(responseData: responseDetailsBody[i])
        );
      }
      emit(GetWorkspacesDetailsSuccess())  ;
    }
    else{
      emit(FailedGetWorkspacesDetails());
    }
  }
}





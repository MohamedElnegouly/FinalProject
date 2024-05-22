import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../workspace/data/workspace_model.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<WorkspaceModel> favorites = [];
  void getFavorites() async{
  Response response = await http.get(
    Uri.parse("https://desk-share-api.onrender.com/favorites"),
    headers:
    {
      'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NGIwZWNkODg4NjYyNDExNGVkMzE5MSIsImlhdCI6MTcxNjE5NTAyNn0.9IBB_DfQxtbb0M8c_ZHxVzZ4mAEFXkSvaBZbYJkSD0U',
      'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
    }
  );
  var responseBody = jsonDecode(response.body);
  if(responseBody['status'] == true )
  {
    for (var item in responseBody)
  emit(GetFavoriteSuccess());
  }
  else
    {
      emit(FailedToGetFavorite());
    }
  }
}

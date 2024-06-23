import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/constants.dart';
import '../../workspace/data/workspace_model.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<WorkspaceModel> favorites = [];
  Set<String> favoritsID = {};

  Future<void> getFavorites() async{
    favorites.clear();
  Response response = await http.get(
    Uri.parse("https://desk-share-api.onrender.com/favorites"),
    headers:
    {
      'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzZiNzM3MjlkYzk0Y2E3OGJkMDkxMCIsImlhdCI6MTcxOTE0MzU2M30.W9iCbks6ONwtGGwmjqCPadC8V-A4-up5j6epVBkjpYM',
      'x-api-key'     : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
    }
  );
    var responseBody = jsonDecode(response.body);
    print('Favoritedata is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for( var item in responseBody['favorites'])
      {
        favorites.add(WorkspaceModel.fromJson(data: item));
        favoritsID.add(item['_id'].toString());
      }
    print("Favorites number is : ${favorites.length}");
    emit(GetFavoriteSuccess());
    }
  else
    {
      emit(FailedToGetFavorite());
    }
  }

  Future<dynamic> AddToFavorite({required String id}) async {
    try {
       await http.post(
          Uri.parse("https://desk-share-api.onrender.com/favorites/$id"),
          headers:
          {
            'x-api-key'     : apiKey,
            "Authorization" : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzZiNzM3MjlkYzk0Y2E3OGJkMDkxMCIsImlhdCI6MTcxOTE0MzU2M30.W9iCbks6ONwtGGwmjqCPadC8V-A4-up5j6epVBkjpYM'
          },
      );
      if (favoritsID.contains(id)) {
        favoritsID.remove(id);
        print('remove');
        emit(RemovedFromFavorite());
      } else {
        favoritsID.add(id.toString());
        print('add');
        emit(AddedToFavorite());
      }
         await getFavorites();

    } catch (e) {
      debugPrint(e.toString());
    }
    emit(FavoriteInitial());
  }

  Future<dynamic> RemoveFromFavorite({required String id}) async {
    try {
      await http.delete(
        Uri.parse("https://desk-share-api.onrender.com/favorites/$id"),
        headers:
        {
          'x-api-key'     : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
          "Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzZiNzM3MjlkYzk0Y2E3OGJkMDkxMCIsImlhdCI6MTcxOTE0MzU2M30.W9iCbks6ONwtGGwmjqCPadC8V-A4-up5j6epVBkjpYM"
        },
      );
      if (favoritsID.contains(id)) {
        favoritsID.remove(id);
        print('remove');
        emit(RemovedFromFavorite());
      } else {
        favoritsID.add(id.toString());
        print('add');
        emit(AddedToFavorite());
      }
      await getFavorites();

    } catch (e) {
      debugPrint(e.toString());
    }
    emit(FavoriteInitial());
  }


 }

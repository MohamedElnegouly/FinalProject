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
      'Authorization' : token,
      'x-api-key'     : apiKey,
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
            'Authorization' : token,
            'x-api-key'     : apiKey,
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
          'Authorization' : token,
          'x-api-key'     : apiKey,
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

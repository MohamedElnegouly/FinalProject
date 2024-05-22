import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/search/repos/search_repo.dart';
import 'package:graduationproject/view/search/search_model.dart';
import 'package:graduationproject/view/search/search_service.dart';

class SearchRepoImplement implements SearchRepo {
  searchService searchservice = searchService(dio: Dio());

  @override
  Future<Either<String, List<SearchModel>>> searchRepo() async {
    try {
      var data = await searchservice.getWorkspaces();
      List<SearchModel> workspaces = [];
      for (var i in data['workspaces']) {
        workspaces.add(SearchModel.fromJson(i));
      }
      return right(workspaces);
    } catch (e) {
      return left(e.toString());
    }
  }
}

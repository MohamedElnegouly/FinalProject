import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/constants.dart';

part 'search_state.dart';
class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());

  List<WorkspaceModel> products = [];
  void getProducts() async {
    int limit =17;
    int skip = 0;
    var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=26&skip=0");
    var response = await http.get(url,
        headers:
        {
          'x-api-key'     : apiKey,
          "Authorization" : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzZiNzM3MjlkYzk0Y2E3OGJkMDkxMCIsImlhdCI6MTcxOTE0MzU2M30.W9iCbks6ONwtGGwmjqCPadC8V-A4-up5j6epVBkjpYM'
        }
    );
    var responseBody = jsonDecode(response.body);
    print('workspaceSearchdata is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for (int i = 0; i < responseBody['total']; i++) {
        products.add(
            WorkspaceModel.fromJson(data: responseBody['workspaces'][i])
        );
      }
      print('length: ${products.length}');
      emit(GetProductsSuccessState());
    }
    else{
      emit(FailedToGetProductsState());
    }
  }

  // filtered products
  List<WorkspaceModel> filteredProducts = [];
  void filterProducts({required String input})
  {
    filteredProducts = products.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(FilterProductsSuccessState());
  }

}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/workspace/data/workspace_model.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';
class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(LayoutInitialState());
  //
  // Future<void> getUserData() async {
  //   emit(GetUserDataLoadingState());
  //   Response response = await http.get(
  //       Uri.parse("https://student.valuxapps.com/api/profile"),
  //       headers:
  //       {
  //         'Authorization' : userToken!,
  //         "lang" : "en"
  //       }
  //   );
  //   var responseData = jsonDecode(response.body);
  //   if( responseData['status'] == true )
  //   {
  //     userModel = UserModel.fromJson(data: responseData['data']);
  //     // debugPrint("response is : $responseData");
  //     emit(GetUserDataSuccessState());
  //   }
  //   else
  //   {
  //     // print("response is : $responseData");
  //     emit(FailedToGetUserDataState(error: responseData['message']));
  //   }
  // }
  //
  // List<BannerModel> banners = [];
  // void getBannersData() async {
  //   Response response = await http.get(
  //       Uri.parse("https://student.valuxapps.com/api/banners")
  //   );
  //   final responseBody = jsonDecode(response.body);
  //   if( responseBody['status'] == true )
  //   {
  //     for( var item in responseBody['data'] )
  //     {
  //       banners.add(BannerModel.fromJson(data: item));
  //     }
  //     emit(GetBannersSuccessState());
  //   }
  //   else
  //   {
  //     emit(FailedToGetBannersState());
  //   }
  // }
  //
  // List<CategoryModel> categories = [];
  // void getCategoriesData() async {
  //   Response response = await http.get(
  //       Uri.parse("https://student.valuxapps.com/api/categories"),
  //       headers:
  //       {
  //         'lang' : "en"
  //       }
  //   );
  //   final responseBody = jsonDecode(response.body);
  //   if( responseBody['status'] == true )
  //   {
  //     for( var item in responseBody['data']['data'] )
  //     {
  //       categories.add(CategoryModel.fromJson(data: item));
  //     }
  //     emit(GetCategoriesSuccessState());
  //   }
  //   else
  //   {
  //     emit(FailedToGetCategoriesState());
  //   }
  // }

  List<WorkspaceModel> products = [];
  void getProducts() async {
    int limit =17;
    int skip = 0;
      var url = Uri.parse("https://desk-share-api.onrender.com/workspaces?limit=18&skip=0");
      var response = await http.get(url,
          headers:
          {
            'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk0Mjk5Mn0.x41tk7I0cAubXh1T2eSfSKmBbxKI4rVXhaSkurzt51s',
            'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
          }
      );
      var responseBody = jsonDecode(response.body);
      print('workspacesearchdata is : ${responseBody}');

      if(response.statusCode == 200)
      {
        for (int i = 0; i < responseBody['limit']; i++) {
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

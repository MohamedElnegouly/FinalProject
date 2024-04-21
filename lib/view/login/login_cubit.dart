import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../core/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://desk-share-api.onrender.com/auth/login"),
          headers: {
            'x-api-key': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8",
          },
          body: {
            "email": email,
            "password": password
          }
      );
      var data = jsonDecode(response.body);

      if(response.statusCode == 200){
        if(data['status']==true){
          print('success $data');
          PreferenceUtils.setString(
              PreferenceKey.token,
              data['token']
          );
          print('new token is : ${PreferenceUtils.getString(PreferenceKey.token)}');
          emit(LoginSuccessState());
        }
      }else if (response.statusCode == 400){
        print('failed: ${data}');

        emit(LoginFailedState(errorMessage:data['error'] ));
      }
    } catch (e){
      emit(LoginFailedState(errorMessage: e.toString()));
      print('error message : ${e.toString()}');
    }
  }
}

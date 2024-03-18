import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String country,
    required String city,
  }) async {

    Response response = await http.post(Uri.parse("https://desk-share-api.onrender.com/auth/signup"),
        headers: {
          'x-api-key': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8",
        },
        body: {
          "name":name,
          "email":email,
          "password":password,
          "country":country,
          "city":city
        }
    );
    var responseBody = jsonDecode(response.body);
    if(response.statusCode == 201 ){
      print('account created');
      print(responseBody);
      emit(RegisterSuccessState());
    } else if (response.statusCode == 200){
      print(responseBody);
      emit(RegisterFailedState(errorMessage: responseBody['errors']['email']));
    }

  }

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
          emit(LoginSuccessState());
        }
      }else if (response.statusCode == 400){
        print('failed: ${data}');

        emit(LoginFailedState(errorMessage:data['error'] ));
      }
    } catch (e){
      emit(LoginFailedState(errorMessage: e.toString()));
    }
  }

}
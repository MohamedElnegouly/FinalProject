import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:graduationproject/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String country,
    required String city,
  }) async {
    Response response = await http.post(Uri.parse("https://desk-share-api.onrender.com/auth/signup"),
        headers: {
          'x-api-key': apiKey,
        },
        body: {
          "name":name,
          "email":email,
          "password":password,
          "country":"65ea2167eedefdf87f991d35",
          "city":"65e9b5b4583cfabbd459bfe7"
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
}

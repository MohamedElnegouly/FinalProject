import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/profile/data/profile_model.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import '../../../core/constants/constants.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  // Future<void> getProfileData() async{
  //   Response response = await http.get(
  //       Uri.parse("https://desk-share-api.onrender.com//profile"),
  //       headers:
  //       {
  //         'x-api-key'     : apiKey,
  //         "Authorization" : token
  //       }
  //   );
  //   var responseBody = jsonDecode(response.body);
  //   print('profiledata is : ${responseBody}');
  //
  //   if(response.statusCode == 200)
  //   {
  //     print("profile number is : ${profileList.length}");
  //     emit(GetProfileSuccess());
  //   }
  //   else
  //   {
  //     emit(FailedToGetProfile());
  //   }
  // }
}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../core/shared/shared_preferences.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  Future<void> login({
    required String id,
    required String date,
  }) async {
    emit(ReservationLoadingState());
    try {
      Response response = await http.post(
          Uri.parse("https://desk-share-api.onrender.com/reservations"),
          headers: {
            'x-api-key': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8",
            'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk0Mjk5Mn0.x41tk7I0cAubXh1T2eSfSKmBbxKI4rVXhaSkurzt51s',
          },
          body: {
            "workspace_id": id,
            "date": date
          }
      );
      var data = jsonDecode(response.body);

      if(response.statusCode == 201){
          print('success $data');

          emit(ReservationSuccessState());

      }else if (response.statusCode == 400){
        print('failed: ${data}');

        emit(ReservationFailedState(errorMessage:data['error'] ));
      }
    } catch (e){
      emit(ReservationFailedState(errorMessage: e.toString()));
      print('error message : ${e.toString()}');
    }
  }
}

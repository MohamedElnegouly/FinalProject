import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/reservations/data/reservation_model.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  List<ReservationModel> reservList = [];
  Set<String> reservID = {};

  Future<void> getReserv() async{
    reservList.clear();
    Response response = await http.get(
        Uri.parse("https://desk-share-api.onrender.com/reservations"),
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NGM3Mjk3OWU2YjFmNmNmNmVkM2IyYyIsImlhdCI6MTcxNjQwNTYwOH0.m8RsUGZ5Da7xfFX4Fi-VaTIA_Q0z5EbnQnurMA4w6PI',
          'x-api-key'     : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseBody = jsonDecode(response.body);
    print('reservationdata is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for( var item in responseBody['reservations'])
      {
        reservList.add(ReservationModel.fromJson(data: item));
        reservID.add(item['_id'].toString());
      }
      print("reservation number is : ${reservList.length}");
      emit(GetReservSuccess());
    }
    else
    {
      emit(FailedToGetReserv());
    }
  }

  Future<dynamic> AddToReserv({
    required String id,
    required String date,}) async {
    try {
      Response response = await http.post(
          Uri.parse("https://desk-share-api.onrender.com/reservations"),
          headers:
          {
            'x-api-key'     : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
            "Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NGM3Mjk3OWU2YjFmNmNmNmVkM2IyYyIsImlhdCI6MTcxNjQwNTYwOH0.m8RsUGZ5Da7xfFX4Fi-VaTIA_Q0z5EbnQnurMA4w6PI",
            "Content-Type" : "application/x-www-form-urlencoded"
          },
          body:
          {
            "workspace_id": id,
            "date" : date
          }
      );
      if (reservID.contains(id)) {
        reservID.remove(id);
        print('remove');
        emit(RemovedFromReserv());
      } else {
        reservID.add(id.toString());
        print('added to reserv');
        emit(AddedToReserv());
      }
      await getReserv();

    } catch (e) {
      debugPrint(e.toString());
    }
    emit(ReservationInitial());
  }
}

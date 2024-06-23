import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/view/reservations/data/reservation_model.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/constants.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  List<ReservationModel> reservList = [];
  Set<String> reservID = {};

  Future<void> getReservation() async{
    reservList.clear();
    Response response = await http.get(
        Uri.parse("https://desk-share-api.onrender.com/reservations"),
        headers:
        {
          'Authorization' : token,
          'x-api-key'     : apiKey,
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

  Future<dynamic> AddToReservation({
    required String id,
    required String date,}) async {
    try {
      Response response = await http.post(
          Uri.parse("https://desk-share-api.onrender.com/reservations"),
          headers:
          {
            'x-api-key'     : apiKey,
            "Authorization" : token,
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
      await getReservation();

    } catch (e) {
      debugPrint(e.toString());
    }
    emit(ReservationInitial());
  }
}

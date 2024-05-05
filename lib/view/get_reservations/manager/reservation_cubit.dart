import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import '../../post_reservation/data/reservation_model.dart';
import '../data/reservation_model.dart';
part 'reservation_state.dart';

class GetReservationCubit extends Cubit<GetReservationState> {
  GetReservationCubit() : super(ReservationInitial());

  List<GetReservationModel> reservationList = [];
  void getReservations() async {
    var url = Uri.parse("https://desk-share-api.onrender.com/reservations");
    var response = await http.get(url,
        headers:
        {
          'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjM5YWNmYjMzM2Q0OTk3ZjVhZTVlNiIsImlhdCI6MTcxMzk0Mjk5Mn0.x41tk7I0cAubXh1T2eSfSKmBbxKI4rVXhaSkurzt51s',
          'x-api-key' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlfa2V5IjoiQzJabXkwNktHNUplaU9qSWhQNUZOTkg2OVFoMGR6a0UifQ.pSRkGDcH0wpkGP1GetT02mLStF6KUBIr9Iq4B9cvzR8',
        }
    );
    var responseBody = jsonDecode(response.body);
    print('reservationData is : ${responseBody}');

    if(response.statusCode == 200)
    {
      for (int i = 0; i < 4; i++) {
        reservationList.add(
            GetReservationModel.fromJson( data: responseBody['reservations'][i])
        );
      }
      print('length: ${reservationList.length}');
      emit(ReservationSuccess());
    }
    else{
      emit(FailedGetReservation());
    }
  }

}

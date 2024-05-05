class PostReservationModel {
  String? id;
  String? message;
  String? date;
  String? status;

  PostReservationModel.fromJson({required Map<String, dynamic> jsonData})
  {
    id= jsonData['id'] ;
    message= jsonData['message'] ;
    date= jsonData['date'];
    status= jsonData['status'];

  }

}
class GetReservationModel {
  String? id;
  String? date;
  String? status;
  String? name;
  String? address;
  String? cover;

  GetReservationModel.fromJson({required Map<String, dynamic> data})
  {
    id= data['id'];
    date= data['date'] ;
    status= data['status'] ;
    name= data['workspace']['name'] ;
    address= data['workspace']['address'];
    cover= data['workspace']['cover'];
  }

}
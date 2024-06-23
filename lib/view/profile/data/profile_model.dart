class ProfileModel {
  String? status;
  String? message;
  String? id;
  String? name;
  String? email;


  ProfileModel.fromJson({required Map<String, dynamic> data})
  {
    status= data['status'] ;
    message= data['message'] ;
    id= data['user']['id'];
    name= data['user']['name'] ;
    email= data['user']['email'];
  }

}
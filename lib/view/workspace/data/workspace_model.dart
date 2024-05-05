class WorkspaceModel {
  String? id;
  String? name;
  String? address;
  String? country;
   String? city;
  String? cover;

  WorkspaceModel.fromJson({required Map<String, dynamic> data})
  {
    id= data['id'] ;
    name= data['name'] ;
    address= data['address'];
     country= data['country']['name'] ;
     city= data['city']['name'];
    cover= data['cover'];
  }

}
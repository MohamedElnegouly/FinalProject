class WorkspaceDetaislModel {
  int? id;
  String? name;
  String? countryName;
  String? cityName;
  String? address;
  String? cover;

  WorkspaceDetaislModel.fromJson({required Map<String, dynamic> responseData})
  {
    id= responseData['id'];
    name= responseData['name'];
    countryName= responseData['country']['name'];
    cityName= responseData['city']['name'];
    address= responseData['address'];
    cover= responseData['cover'];
  }
}
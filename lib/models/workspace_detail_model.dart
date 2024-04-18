class WorkspaceDetailsModel {
  final dynamic id;
  final String name;
  final dynamic address;
  final String cover;
  final CountryModel? country;
 // final CountryModel? city;

  WorkspaceDetailsModel({required this.id,
    required this.name,
    required this.address,
    required this.cover,
    required this.country,
    //required this.city,
  });

  factory WorkspaceDetailsModel.fromJson(jsonData) {
    return WorkspaceDetailsModel(
        id: jsonData['id'],
        name: jsonData['name'],
        address: jsonData['address'],
        cover: jsonData['cover'],
        country: jsonData['country'] == null
            ? null
            : CountryModel.fromJson(jsonData['country']),

        // city: jsonData['city'] == null
        //     ? null
        //     : CityModel.fromJson(jsonData['city']),
    );
  }
}

class CityModel {
  final dynamic id;
  final String name;

  CityModel({required this.id, required this.name});
  
  factory CityModel.fromJson(jsonData){
    return CityModel(id: jsonData['id'], name: jsonData['name']);
  }
}

class CountryModel {
  final dynamic id;
  final String name;

  CountryModel({required this.id, required this.name});

  factory CountryModel.fromJson(jsonData) {
    return CountryModel(id: jsonData['id'], name: jsonData['name']);
  }
}


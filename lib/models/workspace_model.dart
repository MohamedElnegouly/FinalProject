class WorkspaceModel {
  final int id;
  final String name;
  final String address;
  final String country;
  final String city;
  final String cover;

  WorkspaceModel({
    required this.id,
    required this.name,
    required this.address,
    required this.country,
    required this.city,
    required this.cover,
  });

  factory WorkspaceModel.fromJson(jsonData){
    return WorkspaceModel(
        id: jsonData['id'],
        name: jsonData['name'],
        address: jsonData['address'],
        country: jsonData['country'],
        city: jsonData['city'],
        cover: jsonData['cover'],
    );

  }
}

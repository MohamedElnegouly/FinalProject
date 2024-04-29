import 'package:dio/dio.dart';

class searchService {
  final Dio dio;

  searchService({required this.dio});
  Future getWorkspaces() async {
    var responce = await dio.get(
        'https://desk-share-api.onrender.com/workspaces?q=&limit=5&skip=0');
    var data = responce.data;
    return data;
  }
}

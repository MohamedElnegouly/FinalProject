import 'package:dartz/dartz.dart';
import 'package:graduationproject/view/search/search_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<SearchModel>>> searchRepo();
}

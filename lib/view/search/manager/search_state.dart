part of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class SearchInitialState extends SearchStates{}
class SearchLoading extends SearchStates{}
class GetProductsSuccessState extends SearchStates{}
class FailedToGetProductsState extends SearchStates{}
class FilterProductsSuccessState extends SearchStates{}


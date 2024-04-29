part of 'layout_cubit.dart';

@immutable
abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates{}
class GetProductsSuccessState extends LayoutStates{}
class FailedToGetProductsState extends LayoutStates{}
class FilterProductsSuccessState extends LayoutStates{}


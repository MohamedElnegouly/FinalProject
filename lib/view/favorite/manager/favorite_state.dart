part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteSuccess extends FavoriteState {}
class FailedToGetFavorite extends FavoriteState {}

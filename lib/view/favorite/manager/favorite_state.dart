part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}
class GetFavoriteSuccess extends FavoriteState {}
class FailedToGetFavorite extends FavoriteState {}

final class AddedToFavorite extends FavoriteState {}
final class RemovedFromFavorite extends FavoriteState {}
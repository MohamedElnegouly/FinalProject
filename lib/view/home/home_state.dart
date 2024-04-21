part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
class GetWorkspacesSuccess extends HomeState {}
class FailedGetWorkspaces extends HomeState {}

part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class GetProfileSuccess extends ProfileState {}
class FailedToGetProfile extends ProfileState {}
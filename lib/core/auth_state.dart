part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterFailedState extends AuthState {
  final String errorMessage;

  RegisterFailedState({required this.errorMessage});
}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginFailedState extends AuthState {
  final String errorMessage;

  LoginFailedState({required this.errorMessage});
}
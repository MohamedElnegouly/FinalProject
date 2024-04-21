part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterFailedState extends RegisterState {
  final String errorMessage;

  RegisterFailedState({required this.errorMessage});
}

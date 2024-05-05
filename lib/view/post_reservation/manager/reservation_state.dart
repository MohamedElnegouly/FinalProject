part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}
class ReservationLoadingState extends ReservationState {}
class ReservationSuccessState extends ReservationState {}
class ReservationFailedState extends ReservationState {
  final String errorMessage;

  ReservationFailedState({required this.errorMessage});
}
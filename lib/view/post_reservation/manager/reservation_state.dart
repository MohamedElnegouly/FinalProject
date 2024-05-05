part of 'reservation_cubit.dart';

@immutable
abstract class PostReservationState {}

class ReservationInitial extends PostReservationState {}
class ReservationLoadingState extends PostReservationState {}
class ReservationSuccessState extends PostReservationState {}
class ReservationFailedState extends PostReservationState {
  final String errorMessage;

  ReservationFailedState({required this.errorMessage});
}
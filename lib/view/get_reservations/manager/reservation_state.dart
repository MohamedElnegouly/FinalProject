part of 'reservation_cubit.dart';

@immutable
abstract class GetReservationState {}

class ReservationInitial extends GetReservationState {}
class ReservationLoading extends GetReservationState {}
class ReservationSuccess extends GetReservationState {}
class FailedGetReservation extends GetReservationState {}
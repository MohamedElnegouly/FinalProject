part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservLoading extends ReservationState {}
class GetReservSuccess extends ReservationState {}
class FailedToGetReserv extends ReservationState {}

final class AddedToReserv extends ReservationState {}
final class RemovedFromReserv extends ReservationState {}
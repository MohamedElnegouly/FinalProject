part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
final class HomeLoading extends DetailsState {}
class GetWorkspacesSuccess extends DetailsState {}
class GetWorkspaceFailureState extends DetailsState {
  // final String errorMessage;
  //
  // GetArticlesFailureState(this.errorMessage);
}
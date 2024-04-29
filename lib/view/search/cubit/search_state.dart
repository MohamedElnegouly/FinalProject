part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchLoaded extends SearchState {
  final List<SearchModel> workspaces;

  SearchLoaded({required this.workspaces});
}
final class FailedToGetSearch extends SearchState {
  final String errMessage;

  FailedToGetSearch({required this.errMessage});
}


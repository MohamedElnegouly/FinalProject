part of 'workspace_details_cubit.dart';

@immutable
abstract class WorkspaceDetailsState {}

class WorkspaceDetailsInitial extends WorkspaceDetailsState {}

class WorkspaceLoading extends WorkspaceDetailsState {}
class GetWorkspacesDetailsSuccess extends WorkspaceDetailsState {}
class FailedGetWorkspacesDetails extends WorkspaceDetailsState {}

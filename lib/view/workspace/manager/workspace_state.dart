part of 'workspace_cubit.dart';

@immutable
abstract class WorkspaceState {}

class WorkspaceInitial extends WorkspaceState {}

class WorkspaceLoading extends WorkspaceState {}
class GetWorkspacesSuccess extends WorkspaceState {}
class FailedGetWorkspaces extends WorkspaceState {}
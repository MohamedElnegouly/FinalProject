import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workspace_state.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  WorkspaceCubit() : super(WorkspaceInitial());


}

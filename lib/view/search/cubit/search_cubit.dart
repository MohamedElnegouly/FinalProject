import 'package:bloc/bloc.dart';
import 'package:graduationproject/view/search/repos/search_repo.dart';
import 'package:graduationproject/view/search/search_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future getWorkspaces() async {
    try {
      emit(SearchLoading());
      var result = await searchRepo.searchRepo();
      result.fold(
          (failure) => emit(FailedToGetSearch(errMessage: failure.toString())),
          (workspaces) => emit(SearchLoaded(workspaces: workspaces)));
    } catch (e) {
      emit(FailedToGetSearch(errMessage: e.toString()));
    }
  }
}

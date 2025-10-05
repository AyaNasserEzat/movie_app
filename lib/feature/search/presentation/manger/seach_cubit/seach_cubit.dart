import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchMovieInitial());
  SearchUseCase searchUseCase;

  Future<void> searchByName({required SearchParams searchParams}) async {
    emit(SearchMovieLoading());
    var result = await searchUseCase.call(searchParams);
    result.fold(
      (faiure) {
        emit(SearchMovieFailure(faiure.errMessage));
      },
      (movies) {
        emit(SearchMovieSuccess(movies));
      },
    );
  }
}

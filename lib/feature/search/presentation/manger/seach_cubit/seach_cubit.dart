import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchMovieInitial());
  final SearchUseCase searchUseCase;

  Timer? _debounce;

  /// البحث مع تأخير (Debounce)
  void searchByName({required SearchParams searchParams}) {
    // لو فيه تايمر شغال نلغيه
    _debounce?.cancel();

    // نبدأ تايمر جديد (مثلاً بعد 500ms)
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchMovieLoading());
      final result = await searchUseCase.call(searchParams);
      result.fold(
        (failure) => emit(SearchMovieFailure(failure.errMessage)),
        (movies) => emit(SearchMovieSuccess(movies)),
      );
    });
  }

  @override
  Future<void> close() {
    // نلغي التايمر لما الكيوبت يتقفل
    _debounce?.cancel();
    return super.close();
  }
}

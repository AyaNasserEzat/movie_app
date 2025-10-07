import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/poulart_movies_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final GetPopularMoviesUseCase getPopularMovies;

  PopularMovieCubit(this.getPopularMovies) : super(PopularMovieInitial());

  int currentPage = 1;

  List<MovieEntity> allMovies = [];
  bool hasMore = true;
  Future<void> fetchPopularMovies({bool isLoadMore = false}) async {
    print('featch pop');
    if (!hasMore && isLoadMore) return;

    if (!isLoadMore) {
      emit(PopularMovieLoading());
      currentPage = 1;
      hasMore = true;
      allMovies.clear();
    }
    final result = await getPopularMovies(currentPage);
    currentPage++;
    print(currentPage);
    result.fold(
      (failure) {
        emit(PopularMovieFailure(failure.errMessage));
      },
      (movies) {
        print("fetch movie${movies.length}");
        if (movies.isEmpty) {
          hasMore = false;
        } else {
          allMovies.addAll(movies);
        }
        print("fetch allmo${allMovies.length}");
        emit(PopularMovieSuccess(List.from(allMovies)));
      },
    );
  }
}

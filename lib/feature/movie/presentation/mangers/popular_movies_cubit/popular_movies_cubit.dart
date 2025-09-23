import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/poulart_movies_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  final GetPopularMoviesUseCase getPopularMovies;

  PopularMovieCubit(this.getPopularMovies) : super(PopularMovieInitial());

  Future<void> fetchPopularMovies() async {
    emit(PopularMovieLoading());
    final result = await getPopularMovies();
    result.fold(
      (failure) => emit(PopularMovieFailure(failure.errMessage)),
      (movies) => emit(PopularMovieSuccess(movies)),
    );
  }
}

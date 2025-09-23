import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_to_rated_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movie_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMovieState> {
  final GetToRatedMoviesUseCase getTopRatedMoviesUseCase;

  TopRatedMoviesCubit( this.getTopRatedMoviesUseCase)
    : super(TopRatedMovieInitial());

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMovieLoading());

    final result = await getTopRatedMoviesUseCase.call();

    result.fold(
      (failure) => emit(TopRatedMovieFailure(failure.errMessage)),
      (movies) => emit(TopRatedMovieSuccess(movies)),
    );
  }
}

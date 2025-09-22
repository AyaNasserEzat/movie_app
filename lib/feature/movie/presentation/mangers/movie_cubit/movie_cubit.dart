import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_to_rated_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetToRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieCubit({
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getTopRatedMoviesUseCase,
  }) : super(MovieInitial());

  Future<void> getPopularMovies() async {
    emit(MovieLoading());

    final result = await getPopularMoviesUseCase.call();

    result.fold(
      (failure) => emit(MovieFailure(failure.errMessage)),
      (movies) => emit(MovieSuccess(movies)),
    );
  }
}

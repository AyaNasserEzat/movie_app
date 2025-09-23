import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_now_playing_movies.dart';
import 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMovies;

  NowPlayingMovieCubit(this.getNowPlayingMovies) : super(NowPlayingMovieInitial());

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMovieLoading());
    final result = await getNowPlayingMovies();
    result.fold(
      (failure) => emit(NowPlayingMovieFailure(failure.errMessage)),
      (movies) => emit(NowPlayingMovieSuccess(movies)),
    );
  }
}

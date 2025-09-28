import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetails;

  MovieDetailsCubit(this.getMovieDetails) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(MovieDetailsParams movieDetailsParams) async {
    emit(MovieDetailsLoading());
    final result = await getMovieDetails(movieDetailsParams);
    result.fold(
      (failure) => emit(MovieDetailsFailure(failure.errMessage)),
      (movieDetails) => emit(MovieDetailsSuccess(movieDetails)),
    );
  }
}

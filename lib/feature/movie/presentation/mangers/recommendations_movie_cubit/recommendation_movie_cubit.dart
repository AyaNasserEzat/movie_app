import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/recommendations_movie_cubit/recommendation_movie_state.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMovieState> {
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  RecommendationMoviesCubit(this.getRecommendationMoviesUseCase)
      : super(RecommendationMovieInitial());

  Future<void> fetchRecommendationMovies({required RecommendationParams recommendationParams}) async {
    emit(RecommendationMovieLoading());

    final result = await getRecommendationMoviesUseCase.call(recommendationParams);

    result.fold(
      (failure) => emit(RecommendationMovieFailure(failure.errMessage)),
      (movies) => emit(RecommendationMovieSuccess(movies)),
    );
  }
}

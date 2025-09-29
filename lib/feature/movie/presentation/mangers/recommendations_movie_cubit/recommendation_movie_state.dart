import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';

abstract class RecommendationMovieState extends Equatable {
  const RecommendationMovieState();

  @override
  List<Object?> get props => [];
}

class RecommendationMovieInitial extends RecommendationMovieState {}

class RecommendationMovieLoading extends RecommendationMovieState {}

class RecommendationMovieSuccess extends RecommendationMovieState {
  final List<MovieEntity> movies;

  const RecommendationMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class RecommendationMovieFailure extends RecommendationMovieState {
  final String message;

  const RecommendationMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}

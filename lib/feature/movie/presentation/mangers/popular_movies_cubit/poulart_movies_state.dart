import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object?> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieSuccess extends PopularMovieState {
  final List<MovieEntity> movies;

  const PopularMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class PopularMovieFailure extends PopularMovieState {
  final String message;

  const PopularMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
